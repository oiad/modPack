ATMDialogUpdateAmounts = {
	ctrlSetText [23001,format["%1 %2",player getVariable [Z_MoneyVariable,0] call BIS_fnc_numberText,CurrencyName]];
	ctrlSetText [23002,format["%1 %2",player getVariable [z_bankVariable,0] call BIS_fnc_numberText,CurrencyName]];
};

ATMDialogWithdrawAmount = {
	private ["_amount","_bank","_wealth"];

	_amount = (_this select 0) call fnc_sanitizeInput;
	_bank = player getVariable [Z_bankVariable,0];
	_wealth = player getVariable [Z_moneyVariable,0];

	if ((_amount < 1) or {_amount > _bank}) exitWith {format [localize "STR_ZSC_WITHDRAW_FAIL",CurrencyName,toLower (localize "STR_ZSC_GLOBAL_BANK")] call dayz_rollingMessages;};

	player setVariable [Z_moneyVariable,(_wealth + _amount),true];
	player setVariable [Z_bankVariable,(_bank - _amount),true];
	call player_forceSave;

	format[localize "STR_ZSC_GLOBAL_WITHDRAW",[_amount] call BIS_fnc_numberText,CurrencyName] call dayz_rollingMessages;
};

ATMDialogDepositAmount = {
	private ["_amount","_bank","_wealth"];

	_amount = (_this select 0) call fnc_sanitizeInput;
	_bank = player getVariable [Z_bankVariable,0];
	_wealth = player getVariable [Z_MoneyVariable,0];

	if ((_amount < 1) or {_amount > _wealth}) exitWith {format [localize "STR_ZSC_DEPOSIT_FAIL",CurrencyName] call dayz_rollingMessages;};

	if (ZSC_limitOnBank && {(_bank + _amount) > ZSC_maxBankMoney}) then {
		format[localize "STR_ZSC_GLOBAL_DEPOSIT_FAIL", [ZSC_maxBankMoney] call BIS_fnc_numberText,CurrencyName] call dayz_rollingMessages;
	} else {
		player setVariable [Z_MoneyVariable,(_wealth - _amount),true];
		player setVariable [Z_bankVariable,(_bank + _amount),true];
		format[localize "STR_ZSC_GLOBAL_DEPOSIT_OK",[_amount] call BIS_fnc_numberText,CurrencyName] call dayz_rollingMessages;
		call player_forceSave;
	};
};
