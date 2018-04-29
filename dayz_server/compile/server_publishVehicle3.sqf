private ["_action","_activatingPlayer","_characterID","_class","_clientKey","_dir","_donotusekey","_exitReason","_key","_keySelected","_location","_object","_oid","_outcome","_playerUID","_result","_uid","_worldspace"];
#include "\z\addons\dayz_server\compile\server_toggle_debug.hpp"

if (count _this < 7) exitWith {
	diag_log "Server_PublishVehicle3 error: Wrong parameter format";
	dze_waiting = "fail";
	(owner (_this select 5)) publicVariableClient "dze_waiting";
};

_object = 		_this select 0;
_worldspace = 	_this select 1;
_class = 		_this select 2;
_donotusekey =	_this select 3;
_keySelected =  _this select 4;
_activatingPlayer =  _this select 5;
_clientKey = _this select 6;
_playerUID = getPlayerUID _activatingPlayer;
_action = if (count _this > 7) then {_this select 7} else {""};
_characterID = _keySelected;

_exitReason = [_this,"PublishVehicle3",(_worldspace select 1),_clientKey,_playerUID,_activatingPlayer] call server_verifySender;
if (_exitReason != "") exitWith {
	diag_log _exitReason;
	dze_waiting = "fail";
	(owner _activatingPlayer) publicVariableClient "dze_waiting";
};

if (!(isClass(configFile >> "CfgVehicles" >> _class)) || isNull _object) exitWith {
	diag_log ("HIVE-PublishVehicle3 Error: Vehicle does not exist: "+ str(_class));
	dze_waiting = "fail";
	(owner _activatingPlayer) publicVariableClient "dze_waiting";
};

#ifdef OBJECT_DEBUG
diag_log ("PUBLISH: Attempt " + str(_object));
#endif

_dir = 		_worldspace select 0;
_location = _worldspace select 1;
_uid = _worldspace call dayz_objectUID2;

_key = format["CHILD:308:%1:%2:%3:%4:%5:%6:%7:%8:%9:",dayZ_instance, _class, 0 , _characterID, _worldspace, [], [], 1,_uid];
#ifdef OBJECT_DEBUG
diag_log ("HIVE: WRITE: "+ str(_key)); 
#endif

_key call server_hiveWrite;
_location = [_object] call fnc_getPos;

// GET DB ID
_key = format["CHILD:388:%1:",_uid];
#ifdef OBJECT_DEBUG
diag_log ("HIVE: WRITE: "+ str(_key));
#endif
_result = _key call server_hiveReadWrite;
_outcome = _result select 0;

if (_outcome != "PASS") then {
	diag_log("HIVE-pv3: failed to get id for : " + str(_uid));
	_key = format["CHILD:310:%1:",_uid];
	_key call server_hiveWrite;
	dze_waiting = "fail";
	(owner _activatingPlayer) publicVariableClient "dze_waiting";
} else {
	_oid = _result select 1;
	#ifdef OBJECT_DEBUG
	diag_log("CUSTOM: Selected " + str(_oid));
	#endif
	[_object,_uid,_characterID,_class,_dir,_location,_activatingPlayer,_playerUID,_oid,_action] spawn {
		private ["_action","_activatingPlayer","_backpacks","_characterID","_class","_clrinit","_clrinit2","_colour","_colour2","_dam","_dir","_fuel","_hitpoints","_i","_isAir","_location","_magazines","_message","_mgp","_name","_newHitPoints","_newobject","_object","_objectID","_objectUID","_oid","_playerUID","_selection","_strH","_uid","_weapons","_clearTurrets"];

		_object = _this select 0;
		_uid = _this select 1;
		_characterID = _this select 2;
		_class = _this select 3;
		_dir = _this select 4;
		_location = _this select 5;
		_activatingPlayer = _this select 6;
		_playerUID = _this select 7;
		_oid = _this select 8;
		_action = _this select 9;

		_objectID 	= _object getVariable ["ObjectID","0"];
		_objectUID	= _object getVariable ["ObjectUID","0"];
		_hitpoints = _object call vehicle_getHitpoints;
		_newHitPoints = [];
		_fuel = fuel _object;

		_clearTurrets = {
			//By denvdmj (probably, I found it on the biki)
			private ["_weaponArray","_findRecurse","_class","_obj","_turret","_mags"];
			_obj = _this;

			_weaponArray = [];
			_weaponArray set [count _weaponArray,[-1]];

			_findRecurse = {
				private ["_root", "_class", "_path", "_currentPath", "_thisThis"];
				_root = (_this select 0);
				_path = +(_this select 1);
				_thisThis = _this select 2;
				for "_i" from 0 to count _root -1 do {
				   _class = _root select _i;
				   if (isClass _class) then {
					  _currentPath = _path + [_i];
					  {_weaponArray set [count _weaponArray, _currentPath];} count getArray (_class >> "weapons");
					  _class = _class >> "turrets";
					  if (isClass _class) then {[_class, _currentPath, _thisThis] call _findRecurse;};
				   };
				};
			};

			[configFile >> "CfgVehicles" >> typeOf (_obj) >> "turrets", [], _this] call _findRecurse;

			{
				_turret = _x;
				_mags = _obj magazinesTurret _turret;
				{_obj removeMagazinesTurret[_x,_turret];} count _mags;
			} forEach _weaponArray;
		};

		{
			_dam = [_object,_x] call object_getHit;
			_selection = getText (configFile >> "CfgVehicles" >> (typeOf _object) >> "HitPoints" >> _x >> "name");
			_newHitPoints set [count _newHitPoints,[_selection,_dam]];
		} forEach _hitpoints;

		_weapons = getWeaponCargo _object;
		_magazines = getMagazineCargo _object;
		_backpacks = getBackpackCargo _object;

		clearWeaponCargoGlobal _object;
		clearMagazineCargoGlobal _object;
		clearBackpackCargoGlobal _object;
		
		_colour = _object getVariable ["Colour","0"];
		_colour2 = _object getVariable ["Colour2","0"];

		deleteVehicle _object;
		[_objectID,_objectUID,_activatingPlayer,_class] call server_deleteObjDirect;

		uiSleep 3;

		_newobject = _class createVehicle [0,0,0];

		_object = _newobject;
		
		_object setVariable ["ObjectID", _oid, true];
		_object setVariable ["lastUpdate",diag_tickTime];
		_object setVariable ["CharacterID", _characterID, true];
		dayz_serverObjectMonitor set [count dayz_serverObjectMonitor,_object];

		_isAir = _object isKindOf "Air";
		{
			_selection = _x select 0;
			_dam = if (!_isAir && {_selection in dayZ_explosiveParts}) then {(_x select 1) min 0.8;} else {_x select 1;};
			_strH = "hit_" + (_selection);
			_object setHit[_selection,_dam];
			_object setVariable [_strH,_dam,true];
		} foreach _newHitPoints;

		clearWeaponCargoGlobal _object;
		clearMagazineCargoGlobal _object;
		clearBackpackCargoGlobal _object;

		_object setDir _dir;
		_object setPosATL _location;
		_object setVectorUp surfaceNormal _location;
		_object setFuel _fuel;

		if (_colour != "0") then {
			_object setVariable ["Colour",_colour,true];
			_clrinit = format ["#(argb,8,8,3)color(%1)",_colour];
			_object setVehicleInit "this setObjectTexture [0,"+str _clrinit+"];";
		};

		if (_colour2 != "0") then {
			_object setVariable ["Colour2",_colour2,true];
			_clrinit2 = format ["#(argb,8,8,3)color(%1)",_colour2];
			_object setVehicleInit "this setObjectTexture [1,"+str _clrinit2+"];";
		};

		processInitCommands;
		[_weapons,_magazines,_backpacks,_object] call fn_addCargo;

		_object call fnc_veh_ResetEH;
		[_object,"all"] call server_updateObject;

		// for non JIP users this should make sure everyone has eventhandlers for vehicles.
		PVDZE_veh_Init = _object;
		publicVariable "PVDZE_veh_Init";

		{if (_object isKindOf _x) exitWith {_object disableTIEquipment true;}} count vkc_disableThermal;
		if (vkc_clearAmmo) then {_object call _clearTurrets;};

		dze_waiting = "success";
		(owner _activatingPlayer) publicVariableClient "dze_waiting";

		_name = if (alive _activatingPlayer) then {name _activatingPlayer} else {"unknown player"};
		_mgp = mapGridPosition _location;

		if (_action == "") then {
			_message = format ["%1 (%2) upgraded %3 @%4 %5",_name,_playerUID,_class,_mgp,_location];
		} else {
			_message = format ["%1 (%2) %6 %3 @%4 %5",_name,_playerUID,_class,_mgp,_location,_action];
		};
		diag_log _message;
	};
};
