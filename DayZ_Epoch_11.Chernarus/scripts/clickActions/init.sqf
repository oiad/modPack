if (isServer) exitWith {};
private "_build";
_build = 3;

if (isNil "DZE_CLICK_ACTIONS_BUILD") then {
	diag_log text "CLICK ACTIONS: loading...";
	call compile preprocessFileLineNumbers "scripts\clickActions\config.sqf";
	DZE_CLICK_ACTIONS_BUILD = _build;
} else {
	if (_build != DZE_CLICK_ACTIONS_BUILD) then {
		diag_log format["CLICK ACTIONS: tried to load build #%1 but #%2 already loaded!",_build,DZE_CLICK_ACTIONS_BUILD];
	} else {
		diag_log "CLICK ACTIONS: already loaded (not an error)!";
	};
};
