/*
	DayZ Base Building
	Made for DayZ Epoch please ask permission to use/edit/distrubute email vbawol@veteranbastards.com.
*/
private ["_vector","_IsNearPlot","_abort","_animState","_buildables","_buildcheck","_canBuild","_cancel","_classname","_classnametmp","_counter","_dir","_distance","_exitWith","_finished","_friendlies","_hasbuilditem","_hasrequireditem","_hastoolweapon","_index","_inVehicle","_isAllowedUnderGround","_isMedic","_isNear","_isOk","_isfriendly","_isowner","_limit","_location","_location1","_location2","_message","_missing","_nearestPole","_needNear","_needText","_objHDiff","_object","_offset","_onLadder","_ownerID","_plotcheck","_position","_proceed","_reason","_requireplot","_rotate","_started","_text","_tmpbuilt","_vehicle","_zheightchanged","_zheightdirection","_havePad","_heliPad","_charID"];

if (dayz_actionInProgress) exitWith {localize "str_epoch_player_40" call dayz_rollingMessages;};
dayz_actionInProgress = true;

_onLadder = (getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> (animationState player) >> "onLadder")) == 1;
_cancel = false;
_reason = "";

_vehicle = vehicle player;
_inVehicle = (_vehicle != player);

DZE_Q = false;
DZE_Z = false;

DZE_Q_alt = false;
DZE_Z_alt = false;

DZE_Q_ctrl = false;
DZE_Z_ctrl = false;

DZE_5 = false;
DZE_4 = false;
DZE_6 = false;

DZE_cancelBuilding = false;

call gear_ui_init;
closeDialog 1;

if (dayz_isSwimming) exitWith {dayz_actionInProgress = false; localize "str_player_26" call dayz_rollingMessages;};
if (_inVehicle) exitWith {dayz_actionInProgress = false; localize "str_epoch_player_42" call dayz_rollingMessages;};
if (_onLadder) exitWith {dayz_actionInProgress = false; localize "str_player_21" call dayz_rollingMessages;};
if (player getVariable["combattimeout",0] >= diag_tickTime) exitWith {dayz_actionInProgress = false; localize "str_epoch_player_43" call dayz_rollingMessages;};

_abort = false;
_reason = "";

_index = _this call getDeployableIndex;
_needNear = _index call getDeployableNeedNearBy;

{
	switch (_x) do {
		case "fire": {
			_distance = 3;
			_isNear = {inflamed _x} count (getPosATL player nearObjects _distance);
			if (_isNear == 0) then {
				_abort = true;
				_reason = localize "STR_EPOCH_FIRE";
			};
		};
		case "workshop": {
			_distance = 3;
			_isNear = count (nearestObjects [player, ["Wooden_shed_DZ","WoodShack_DZ","WorkBench_DZ"], _distance]);
			if (_isNear == 0) then {
				_abort = true;
				_reason = localize "STR_BLD_name_ItemWorkshop";
			};
		};
		case "fueltank": {
			_distance = 30;
			_isNear = count (nearestObjects [player, dayz_fuelsources, _distance]);
			if (_isNear == 0) then {
				_abort = true;
				_reason = localize "STR_EPOCH_VEHUP_TNK";
			};
		};
	};
} forEach _needNear;

if (_abort) exitWith {
	dayz_actionInProgress = false;
	format[localize "str_epoch_player_135",_reason,_distance] call dayz_rollingMessages;
};

_classname      = _index call getDeployableClass;
_classnametmp   = _classname;
_text           = _index call getDeployableDisplay;

if (_index call getDeployableRequirePlot) then {_requireplot = 1;} else {_requireplot = 0;};

_isAllowedUnderGround = 1;
if (isNumber (configFile >> "CfgVehicles" >> _classname >> "nounderground")) then {
	_isAllowedUnderGround = getNumber(configFile >> "CfgVehicles" >> _classname >> "nounderground");
};

_offset = _index call getDeployableDistanceOffset;

_distance = DZE_PlotPole select 0;
_needText = localize "str_epoch_player_246";

_canBuild = false;
_nearestPole = objNull;
_ownerID = 0;
_friendlies = [];

_plotcheck = [player, false] call FNC_find_plots;
_distance = DZE_PlotPole select 0;

_IsNearPlot = _plotcheck select 1;
_nearestPole = _plotcheck select 2;

if (_IsNearPlot == 0) then {
	if (_requireplot == 0) then {
		_canBuild = true;
	} else {
		_exitWith = localize "STR_EPOCH_PLAYER_135";
	};
} else {
	if (_requireplot == 0) then {
		_canBuild = true;
	} else {
		_ownerID = _nearestPole getVariable["CharacterID","0"];
		if (dayz_characterID == _ownerID) then {
			_canBuild = true;
		} else {
			if (DZE_permanentPlot) then {
				_buildcheck = [player, _nearestPole] call FNC_check_access;
				_isowner = _buildcheck select 0;
				_isfriendly = ((_buildcheck select 1) or (_buildcheck select 3));
				if (_isowner || _isfriendly) then {
					_canBuild = true;
				} else {
					_exitWith = localize "STR_EPOCH_PLAYER_134";
				};
			} else {
				_friendlies	= player getVariable ["friendlyTo",[]];
				if (_ownerID in _friendlies) then {
					_canBuild = true;
				} else {
					_exitWith = localize "STR_EPOCH_PLAYER_134";
				};
			};
		};
	};
};

if (!_canBuild) exitWith {dayz_actionInProgress = false; format[_exitWith,_needText,_distance] call dayz_rollingMessages;};

_havePad = false;
if !(isNil "vg_list") then {
	if (_className in vg_heliPads) then {
		_heliPad = nearestObjects [player,vg_heliPads,vg_distance];
		if (count _heliPad > 0) then {
			_havePad = true;
		};
	};
};

if (_havePad) exitWith {
	dayz_actionInProgress = false;
	systemChat "You already have a heli pad!";
};

_missing = "";
_hasrequireditem = true;

_hastoolweapon = (_index call getDeployableKitClass) in ((weapons player) + (magazines player));
if (!_hastoolweapon) then { _hasrequireditem = false; _missing = (_index call getDeployableKitDisplay); };

_hasbuilditem = [player,_index] call getHasDeployableParts;
if (!_hasbuilditem) exitWith {dayz_actionInProgress = false; format[localize "str_player_31",str (_index call getDeployableParts),"build"] call dayz_rollingMessages; };

if (!_hasrequireditem) exitWith {dayz_actionInProgress = false; format[localize "str_epoch_player_137",_missing] call dayz_rollingMessages; };
if (_hasrequireditem) then {

	_dir = getdir player;
	_location = getPos player;
	_location = [(_location select 0)+8*sin(_dir),(_location select 1)+8*cos(_dir),0]; 
	
	_isOk = true;
	_location1 = getPosATL player;

	_object = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];
	_object setVehicleLock "LOCKED";
	_object setVariable["ObjectUID","1",true];

	_object attachTo [player,_offset];
	_object setDir _dir;
	_position = getPosATL _object;

	[localize "str_epoch_player_45",1] call dayz_rollingMessages;

	_objHDiff = 0;

	while {_isOk} do {

		_zheightchanged = false;
		_zheightdirection = "";
		_rotate = false;

		if (DZE_Q) then {
			DZE_Q = false;
			_zheightdirection = "up";
			_zheightchanged = true;
		};
		if (DZE_Z) then {
			DZE_Z = false;
			_zheightdirection = "down";
			_zheightchanged = true;
		};
		if (DZE_Q_alt) then {
			DZE_Q_alt = false;
			_zheightdirection = "up_alt";
			_zheightchanged = true;
		};
		if (DZE_Z_alt) then {
			DZE_Z_alt = false;
			_zheightdirection = "down_alt";
			_zheightchanged = true;
		};
		if (DZE_Q_ctrl) then {
			DZE_Q_ctrl = false;
			_zheightdirection = "up_ctrl";
			_zheightchanged = true;
		};
		if (DZE_Z_ctrl) then {
			DZE_Z_ctrl = false;
			_zheightdirection = "down_ctrl";
			_zheightchanged = true;
		};
		if (DZE_4) then {
			_rotate = true;
			DZE_4 = false;

			_dir = _dir + 30;
		};
		if (DZE_6) then {
			_rotate = true;
			DZE_6 = false;
			_dir = _dir - 30;
		};

		if (_rotate) then {
			_object setDir _dir;
			_object setPosATL _position;
		};

		if (_zheightchanged) then {
			detach _object;

			_position = getPosATL _object;

			if (_zheightdirection == "up") then {
				_position set [2,((_position select 2)+0.1)];
				_objHDiff = _objHDiff + 0.1;
			};
			if (_zheightdirection == "down") then {
				_position set [2,((_position select 2)-0.1)];
				_objHDiff = _objHDiff - 0.1;
			};
			if (_zheightdirection == "up_alt") then {
				_position set [2,((_position select 2)+1)];
				_objHDiff = _objHDiff + 1;
			};
			if (_zheightdirection == "down_alt") then {
				_position set [2,((_position select 2)-1)];
				_objHDiff = _objHDiff - 1;
			};
			if (_zheightdirection == "up_ctrl") then {
				_position set [2,((_position select 2)+0.01)];
				_objHDiff = _objHDiff + 0.01;
			};
			if (_zheightdirection == "down_ctrl") then {
				_position set [2,((_position select 2)-0.01)];
				_objHDiff = _objHDiff - 0.01;
			};

			if ((_isAllowedUnderGround == 0) && ((_position select 2) < 0)) then {
				_position set [2,0];
			};
			_object setPosATL _position;
			_object attachTo [player];
			_object setDir _dir;
		};

		uiSleep 0.5;

		_location2 = getPosATL player;

		if (DZE_5) exitWith {
			_isOk = false;
			_position = [_object] call FNC_GetPos;
			detach _object;
			_dir = getDir _object;
			_vector = [(vectorDir _object),(vectorUp _object)];
			deleteVehicle _object;
		};
		if (_location1 distance _location2 > DZE_buildMaxMoveDistance) exitWith {
			_isOk = false;
			_cancel = true;
			_reason = format [localize "STR_EPOCH_BUILD_FAIL_MOVED",DZE_buildMaxMoveDistance];
			detach _object;
			deleteVehicle _object;
		};
		if (abs(_objHDiff) > DZE_buildMaxHeightDistance) exitWith {
			_isOk = false;
			_cancel = true;
			_reason = format [localize "STR_EPOCH_BUILD_FAIL_HEIGHT",DZE_buildMaxHeightDistance];
			detach _object;
			deleteVehicle _object;
		};
		if (DZE_cancelBuilding) exitWith {
			_isOk = false;
			_cancel = true;
			_reason = localize "STR_EPOCH_PLAYER_46";
			detach _object;
			deleteVehicle _object;
		};
	};

	if (!(_index call getDeployableBuildOnRoad)) then {if (isOnRoad [_position select 0, _position select 1, 0]) then { _cancel = true; _reason = localize "STR_EPOCH_BUILD_FAIL_ROAD";};};

	if (_classname isKindOf "MotorCycle") then {
		if (count (nearestObjects [_position, ["Building","DZE_Housebase"], 5]) > 0) then {
			_cancel = true; 
			_reason = format ["%1 can not be built near a wall/door",_text];
		};
	};

	if (!_cancel) then {
		_classname = _classnametmp;

		_tmpbuilt = createVehicle [_classname, _location, [], 0, "CAN_COLLIDE"];
		_tmpbuilt setVehicleLock "LOCKED";

		if (!(_index call getDeployableSimulation)) then {
			_tmpbuilt enableSimulation false;
		};
		_tmpbuilt setVariable ["ObjectUID", "1", true];

		if (_index call getPermanent) then {
			_tmpbuilt setVectorDirAndUp _vector;
		} else {
			_tmpbuilt setdir _dir; // setdir is incompatible with setVectorDirAndUp and should not be used together on the same object https://community.bistudio.com/wiki/setVectorDirAndUp
		};

		_location = _position;

		if ((_isAllowedUnderGround == 0) && ((_location select 2) < 0)) then {
			_location set [2,0];
		};

		_tmpbuilt setPosATL _location;
		format[localize "str_epoch_player_138",_text] call dayz_rollingMessages;
		_limit = 3;

		if (DZE_StaticConstructionCount > 0) then {
			_limit = DZE_StaticConstructionCount;
		} else {
			if (isNumber (configFile >> "CfgVehicles" >> _classname >> "constructioncount")) then {
				_limit = getNumber(configFile >> "CfgVehicles" >> _classname >> "constructioncount");
			};
		};

		_isOk = true;
		_proceed = false;
		_counter = 0;

		while {_isOk} do {
			["Working",0,[100,15,10,0]] call dayz_NutritionSystem;
			if !((getPlayerUID player) in DZE_DEPLOYABLE_ADMINS) then { 
				player playActionNow "Medic";
				[player,"repair",0,false,20] call dayz_zombieSpeak;
				[player,20,true,(getPosATL player)] spawn player_alertZombies;

				r_interrupt = false;
				r_doLoop = true;
				_started = false;
				_finished = false;

				while {r_doLoop} do {
					_animState = animationState player;
					_isMedic = ["medic",_animState] call fnc_inString;
					if (_isMedic) then {
						_started = true;
					};
					if (_started && !_isMedic) then {
						r_doLoop = false;
						_finished = true;
					};
					if (r_interrupt) then {
						r_doLoop = false;
					};
					if (DZE_cancelBuilding) exitWith {
						r_doLoop = false;
					};
					uiSleep 0.1;
				};
				r_doLoop = false;

			} else {
				_finished = true;
			};
			
			if (!_finished) exitWith {
				_isOk = false;
				_proceed = false;
			};

			if (_finished) then {
				_counter = _counter + 1;
			};
			format[localize "str_epoch_player_139",_text, _counter,_limit] call dayz_rollingMessages;
			if (_counter == _limit) exitWith {
				_isOk = false;
				_proceed = true;
			};
		};

		if (_proceed) then {
			if ([player,_index] call getHasDeployableParts) then {
				[player,_index] call removeDeployableParts;
				[format[localize "str_build_01",_text],1] call dayz_rollingMessages;
				_tmpbuilt setVariable ["OEMPos",_location,true];
				if (_index call getPermanent) then {
					_charID = dayz_characterID;
					_tmpbuilt setVariable ["CharacterID",_charID,true];
					PVDZ_obj_Publish = [_charID,_tmpbuilt,[_dir,_position,dayz_playerUID,_vector],[],player,dayz_authKey];
					publicVariableServer "PVDZ_obj_Publish";
				};
				if (_index call getClearCargo) then {
					clearWeaponCargoGlobal _tmpbuilt;
					clearMagazineCargoGlobal _tmpbuilt;
				};
				if (_index call getDeployableClearAmmo) then {
					_tmpbuilt setVehicleAmmo 0;
				};
				
				_tmpbuilt call fnc_set_temp_deployable_id;
				player reveal _tmpbuilt;
				_tmpbuilt call fnc_veh_ResetEH;

				// for non JIP users this should make sure everyone has eventhandlers for vehicles.
				PVDZE_veh_Init = _tmpbuilt;
				publicVariable "PVDZE_veh_Init";

				_tmpbuilt setVehicleLock "UNLOCKED";
				DZE_DEPLOYING_SUCCESSFUL = true;
			} else {
				deleteVehicle _tmpbuilt;
				localize "str_epoch_player_46" call dayz_rollingMessages;
			};
		} else {
			r_interrupt = false;
			if (vehicle player == player) then {
				[objNull, player, rSwitchMove,""] call RE;
				player playActionNow "stop";
			};
			deleteVehicle _tmpbuilt;

			localize "str_epoch_player_46" call dayz_rollingMessages;
		};
	} else {
		format[localize "str_epoch_player_47",_text,_reason] call dayz_rollingMessages;
	};
};

dayz_actionInProgress = false;
