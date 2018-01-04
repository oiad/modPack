private ["_wpui","_vitals","_money","_bank"];
disableSerialization;

while {true} do {
	16 cutRsc ["ZSC_Money_Display","PLAIN"];
	_wpui = uiNameSpace getVariable "ZSC_Money_Display";
	_vitals = _wpui displayCtrl 4900;
	_money = player getVariable [Z_moneyVariable,0];
	_bank = player getVariable [Z_bankVariable,0];
	_vitals ctrlSetStructuredText parseText format ["
	<t size='0.9'>%1 </t><img size='1.4' align='right' image='scripts\zsc\images\coins.paa'/><br/>
	<t size='0.9'>%2 </t><img size='1.4' align='right' image='scripts\zsc\images\bank.paa'/><br/>
	",[_money] call BIS_fnc_numberText,[_bank] call BIS_fnc_numberText];
	_vitals ctrlCommit 0;
	uisleep 1.5;
};