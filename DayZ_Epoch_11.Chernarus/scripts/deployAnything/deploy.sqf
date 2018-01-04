private["_exitWith","_position","_display","_object","_handle","_deployableName"];

_exitWith = "nil";

disableSerialization;
_display = findDisplay 106;

if (!(isNull _display)) then {
	_display closeDisplay 0;
};

_deployableName = _this call getDeployableDisplay;

{
	if (_x select 0) exitWith {_exitWith = (_x select 1);};
} forEach [
	[(dayz_playerUID in DZE_DEPLOYABLE_ADMINS),"admin"],
	[!([player,_this] call getHasDeployableParts),format["You need %1 to build %2",str (_this call getDeployableParts),_deployableName]],
	[!(call fnc_can_do),format["You can't build a %1 right now.",_deployableName]],
	[(player getVariable["inCombat",false]), format["Can't build a %1 while in combat!",(_this call getDeployableDisplay)]],
	[DZE_DEPLOYING,"You are already building something!"],
	[DZE_PACKING,"You are already packing something!"]
];

if (_exitWith != "nil" && {_exitWith != "admin"}) exitWith {
	taskHint [_exitWith, DZE_COLOR_DANGER, "taskFailed"];
};

DZE_DEPLOYING = true;
DZE_DEPLOYING_SUCCESSFUL = false;
_handle = (_this call getDeployableClass) spawn player_deploy;
waitUntil {scriptDone _handle;};

DZE_DEPLOYING = false;
if (!DZE_DEPLOYING_SUCCESSFUL) then {
	taskHint ["Deploying Failed!", DZE_COLOR_DANGER, "taskFailed"];
} else {
	taskHint [format["You've built a %1!",_deployableName], DZE_COLOR_PRIMARY, "taskDone"];

	uiSleep 10;
	if (!(_this call getPermanent)) then { 
		"Warning: Deployed vehicles DO NOT SAVE after server restart!" call dayz_rollingMessages;
	} else {
		"This vehicle is permanent and will persist through server restarts!" call dayz_rollingMessages;
	};
};
