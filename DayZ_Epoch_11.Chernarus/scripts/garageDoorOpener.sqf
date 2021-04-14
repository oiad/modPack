/*
	Garage door opener script by salival (https://github.com/oiad)
*/

if (dayz_actionInProgress) exitWith {localize "str_player_actionslimit" call dayz_rollingMessages;};
dayz_actionInProgress = true;

private ["_door","_typeof"];

_door = _this select 3;
_typeof = typeof _door;

if (isNull _door) exitWith {dayz_actionInProgress = false; systemChat localize "str_cursorTargetNotFound";};

{DZE_myVehicle removeAction _x} count s_player_gdoor_opener;s_player_gdoor_opener = [];
s_player_gdoor_opener_ctrl = 1;

call {
	if (_typeof in ["WoodenGate_1_DZ","WoodenGate_2_DZ","WoodenGate_3_DZ","WoodenGate_4_DZ"]) exitwith {
		if (_door animationPhase "DoorR" == 0) then {
			systemChat localize "STR_CL_GDO_DOOR_OPEN";
			_door animate ["DoorR",1];
			_door animate ["DoorL",1];
		} else {
			systemChat localize "STR_CL_GDO_DOOR_CLOSE";
			_door animate ["DoorR",0];
			_door animate ["DoorL",0];
		};
	};
	if (_typeof in ["CinderGarageOpenTopLocked_DZ","Land_DZE_WoodOpenTopGarageLocked"]) exitwith {
		if (_door animationPhase "doorl" == 0) then {
			systemChat localize "STR_CL_GDO_DOOR_OPEN";
			_door animate ["doorR",1];
			_door animate ["doorl",1];
		} else {
			systemChat localize "STR_CL_GDO_DOOR_CLOSE";
			_door animate ["doorR",0];
			_door animate ["doorl",0];
		};
	};	
	if (_typeof in ["CinderGateLocked_DZ","Land_DZE_WoodGateLocked"]) exitwith {
		if (_door animationPhase "Open_door" == 0) then {
			systemChat localize "STR_CL_GDO_DOOR_OPEN";
			_door animate ["Open_door",1];
			_door animate ["Open_doorR",1];
		} else {
			systemChat localize "STR_CL_GDO_DOOR_CLOSE";
			_door animate ["Open_door",0];
			_door animate ["Open_doorR",0];
		};	
	};
	if (_door animationPhase "Open_door" == 0) then {
		systemChat localize "STR_CL_GDO_DOOR_OPEN";
		_door animate ["Open_door",1];
	} else {
		systemChat localize "STR_CL_GDO_DOOR_CLOSE";
		_door animate ["Open_door",0];
	};
};

s_player_gdoor_opener_ctrl = -1;
dayz_actionInProgress = false;
