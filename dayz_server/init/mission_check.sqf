//Temporary check for A2OA mission override exploit.
//This bug should be fixed in the next EOL patch.
//Put this code at the bottom of dayz_server\init\server_functions.sqf

//List of files in your mission to check. For example, you may want to add 'custom\variables.sqf' etc.
//Remove any you aren't using
_files = [
	'dayz_code\compile\fn_selfActions.sqf','dayz_code\compile\remote_message.sqf','dayz_code\compile\ui_selectSlot.sqf','dayz_code\init\compiles.sqf','dayz_code\init\variables.sqf','description.ext','init.sqf','mission.sqm','rules.sqf','scripts\buryActions.sqf','scripts\clickActions\config.sqf','scripts\clickActions\init.sqf','scripts\deployAnything\config.sqf','scripts\deployAnything\deploy.sqf','scripts\deployAnything\functions.sqf','scripts\deployAnything\init.sqf','scripts\deployAnything\pack.sqf','scripts\deployAnything\player_deploy.sqf','scripts\deployAnything\wrapper.sqf','scripts\garageDoorOpener.sqf','scripts\locateVehicle.sqf','scripts\remoteVehicle\remoteVehicle.sqf','scripts\remoteVehicle\vehicleInfo.sqf','scripts\servicePoints\init.sqf','scripts\servicePoints\servicePointActions.sqf','scripts\takeClothes.sqf','scripts\traders\server_traders.sqf','scripts\virtualGarage\player_getVehicle.sqf','scripts\virtualGarage\player_removePad.sqf','scripts\virtualGarage\player_storeVehicle.sqf','scripts\virtualGarage\vehicleInfo.sqf','scripts\virtualGarage\virtualGarage.sqf','scripts\vkc\vehicleInfo.sqf','scripts\vkc\vehicleKeyChanger.sqf','scripts\zsc\atmDialog.sqf','scripts\zsc\bankDialog.sqf','scripts\zsc\checkWallet.sqf','scripts\zsc\givePlayer.sqf','scripts\zsc\playerHud.sqf','scripts\zsc\zscInit.sqf'
];

_list = [];
{
	_file = toArray (toLower(preprocessFile _x));
	_sum = 0;
	_count = {_sum = _sum + _x; true} count _file;
	if (_count > 999999) then {_count = _count mod 999999}; //Prevent scientific notation when converting to string below
	if (_sum > 999999) then {_sum = _sum mod 999999};
	_list set [count _list,[_count,_sum]];
} forEach _files;

//Check mission integrity on all clients
_temp = "HeliHEmpty" createVehicle [0,0,0];
_temp setVehicleInit (str formatText["
	if (isServer) exitWith {};
	
	_list = [];
	{
		_file = toArray (toLower(preprocessFile _x));
		_sum = 0;
		_count = {_sum = _sum + _x; true} count _file;
		if (_count > 999999) then {_count = _count mod 999999};
		if (_sum > 999999) then {_sum = _sum mod 999999};
		_list set [count _list,[_count,_sum]];
	} forEach %1;
	
	_file = -1;
	{
		if ((_x select 0 != (_list select _forEachIndex) select 0) or (_x select 1 != (_list select _forEachIndex) select 1)) then {
			_file = _forEachIndex;
		};
	} forEach %2;

	if (_file != -1) then {
		MISSION_CHECK = if ((_list select _file) select 0 < 49999) then {preprocessFileLineNumbers (%1 select _file)} else {'TOO BIG'};
		publicVariableServer 'MISSION_CHECK';
		[] spawn {
			uiSleep 1;
			{(findDisplay _x) closeDisplay 2;} count [0,8,12,18,46,70];
		};
	};
",_files,_list]);

processInitCommands;
