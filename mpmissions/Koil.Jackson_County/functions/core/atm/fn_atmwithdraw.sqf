/*
Author: Kerkkoh
First Edit: 30.11.2015
*/
params["_bankType"];
_amount = parseNumber (ctrlText 1400);
closeDialog 0;

if (_amount > 0) then 
{

	if(_bankType == 0) then {

		_check = [2, _amount] call Client_fnc_checkMoney;
		if (_check) then 
		{
			
			[_amount] call Client_fnc_removeBank;
			[_amount] call Client_fnc_addCash;
			hint "Successfully withdrawed cash!";
			
		} else {
		
			hint "Not enough bank balance!";
		
		};

	} else {
	
		if (_amount < mafiaBank) then 
		{
			
			["Remove",_amount] remoteexec ["server_fnc_updateMafiaBank",2];
			[_amount] call Client_fnc_addCash;
			hint "Successfully withdrawed cash!";
			
		} else {
		
			hint "Not enough bank balance!";
		
		};

	};
	
}
 else  
{

	hint "Withdrawal amount must be more than $0!";
	
};


