/*
	DZE_CLICK_ACTIONS
	This is where you register your right-click actions
	FORMAT -- (no comma after last array entry)
	[_classname,_text,_execute,_condition],
	PARAMETERS
	_classname  : the name of the class to click on (example = "ItemBloodbag")
	_text       : the text for the option that is displayed when right clicking on the item (example = "Self Transfuse")
	_execute    : compiled code to execute when the option is selected (example = "execVM 'my\scripts\self_transfuse.sqf';")
	_condition  : compiled code evaluated to determine whether or not the option is displayed (example = {true})
*/

DZE_CLICK_ACTIONS = [
	["ItemGPS",localize "STR_CL_CA_SCAN_NEARBY","if(isNil 'CA_GPS_RANGE') then {CA_GPS_RANGE = 1500;};CA_ZOMBIE_COUNT = count ((position player) nearEntities ['zZombie_Base',CA_GPS_RANGE]); CA_MAN_COUNT = count ((position player) nearEntities ['CAManBase',CA_GPS_RANGE]); format[localize 'STR_CL_CA_SCAN',CA_GPS_RANGE,CA_MAN_COUNT - CA_ZOMBIE_COUNT,count ((position player) nearEntities ['zZombie_Base',CA_GPS_RANGE]),count ((position player) nearEntities ['allVehicles',CA_GPS_RANGE]) - CA_MAN_COUNT] call dayz_rollingMessages;","true"],
	["ItemGPS",localize "STR_CL_CA_RANGE_UP","if(isNil 'CA_GPS_RANGE') then {CA_GPS_RANGE = 1500;};CA_GPS_RANGE = (CA_GPS_RANGE + 100) min 2500; format[localize 'STR_CL_CA_RANGE_GPS',CA_GPS_RANGE] call dayz_rollingMessages;","true"],
	["ItemGPS",localize "STR_CL_CA_RANGE_DOWN","if(isNil 'CA_GPS_RANGE') then {CA_GPS_RANGE = 1500;};CA_GPS_RANGE = (CA_GPS_RANGE - 100) max 1000; format[localize 'STR_CL_CA_RANGE_GPS',CA_GPS_RANGE] call dayz_rollingMessages;","true"],

	["ItemMap",localize "STR_CL_LV_LOCATE_VEHICLES","execVM 'scripts\locateVehicle.sqf';","true"],

	["ItemKey",localize "STR_CL_RV_CA_EJECT","spawn remoteVehicle;","true",1],
	["ItemKey",localize "STR_CL_RV_CA_ENGINE","spawn remoteVehicle;","true",2],
	["ItemKey",localize "STR_CL_RV_CA_UNLOCK","spawn remoteVehicle;","true",3],
	["ItemKey",localize "STR_CL_RV_CA_LOCK","spawn remoteVehicle;","true",4],
	["ItemKey",localize "STR_CL_RV_CA_LIGHTS","spawn remoteVehicle;","true",5]
];
