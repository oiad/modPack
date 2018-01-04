private["_isPackingLocked","_lastPackTime","_exitWith","_deployable","_cursorTarget","_deployableName"];

_exitWith = "nil";
_deployable = (_this select 3) select 0;
_cursorTarget = (_this select 3) select 1;
_lastPackTime = _cursorTarget getVariable["lastPackTime",diag_tickTime - 11];
_isPackingLocked = diag_tickTime - _lastPackTime < 10;
_deployableName = _deployable call getDeployableDisplay;

{
	if (_x select 0) exitWith {_exitWith = (_x select 1);};
} forEach [
	[(dayz_playerUID in DZE_DEPLOYABLE_ADMINS),"admin"],
	[!(call fnc_can_do),format["You can't pack your %1 right now.",_deployableName]],
	[(player getVariable["inCombat",false]),format["Can't pack a %1 while in combat!",_deployableName]],
	[(damage cursorTarget > (_deployable call getDamageLimit)),format["The %1 must be under %2 percent damaged to pack!",_deployableName,(_deployable call getDamageLimit) * 100]],      
	[_isPackingLocked,format["Someone just tried to pack that %1! Try again in a few seconds.",_deployableName]],
	[DZE_PACKING,"You are already packing something!"],
	[DZE_DEPLOYING,"You are already building something!"]
];

if (_exitWith != "nil" && {_exitWith != "admin"}) exitWith {
	taskHint [_exitWith, DZE_COLOR_DANGER, "taskFailed"];
};

_cursorTarget setVariable["lastPackTime",diag_tickTime,true];
DZE_PACKING = true;

_exitWith = [
	["dayz_playerUID in DZE_DEPLOYABLE_ADMINS","admin"],
	["r_interrupt",format["Packing %1 interrupted!",_deployableName]],
	["(player getVariable['inCombat',false])",format["You can't pack your %1 while in combat!",_deployableName]]
] call fnc_bike_crafting_animation;

if (_exitWith != "nil" && {_exitWith != "admin"}) exitWith {
	DZE_PACKING = false;
	taskHint [_exitWith, DZE_COLOR_DANGER, "taskFailed"];
};

{
	if (isClass(configFile >> "CfgWeapons" >> _x)) then {
		player addWeapon _x;
	};
	if (isClass(configFile >> "CfgMagazines" >> _x)) then {
		player addMagazine _x;
	};
} forEach (_deployable call getDeployableParts);

if (_deployable call getPermanent) then {
	PVDZ_obj_Destroy = [_cursorTarget getVariable["ObjectID","0"],_cursorTarget getVariable["ObjectUID","0"],player,_cursorTarget,dayz_authKey];
	publicVariableServer "PVDZ_obj_Destroy";
} else {
	deleteVehicle _cursorTarget;
};

player removeAction (_deployable call getActionId);
[_deployable,-1] call setActionId;
DZE_PACKING = false;

taskHint [format["You have packed your %1 back into your %2.",_deployableName,(_deployable call getDeployableKitDisplay)], DZE_COLOR_PRIMARY, "taskDone"];
