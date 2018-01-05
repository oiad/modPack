private ["_wpui","_vitals","_money","_bank","_message"];
disableSerialization;

while {true} do {
	16 cutRsc ["ZSC_Money_Display","PLAIN"];
	_wpui = uiNameSpace getVariable "ZSC_Money_Display";
	_vitals = _wpui displayCtrl 4900;
	_money = player getVariable[Z_MoneyVariable,0];
	_bank = player getVariable [Z_bankVariable,0];
	_message = format ["<t size='0.9'>%1 </t><img size='1.4' align='right' image='scripts\zsc\images\coins.paa'/><br/>",[_money] call BIS_fnc_numberText];

	if (Z_globalBanking) then {
		_message = _message + format ["<t size='0.9'>%1 </t><img size='1.4' align='right' image='scripts\zsc\images\bank.paa'/><br/>",[_bank] call BIS_fnc_numberText];
	};
	_vitals ctrlSetStructuredText parseText _message;
	_vitals ctrlCommit 0;
	uisleep 1.5;
};
