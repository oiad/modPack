if (isServer) then {
	diag_log "Loading custom server compiles";
};

if (!isDedicated) then {
	diag_log "Loading custom client compiles";

	fnc_usec_selfActions = compile preprocessFileLineNumbers "dayz_code\compile\fn_selfActions.sqf";
	player_build = compile preprocessFileLineNumbers "dayz_code\actions\modular_build.sqf";
	player_selectSlot = compile preprocessFileLineNumbers "dayz_code\compile\ui_selectSlot.sqf";
	remoteVehicle = compile preprocessFileLineNumbers "scripts\remoteVehicle\remoteVehicle.sqf";
};
