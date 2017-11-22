// this is where we open the shop that we are looking at
disableSerialization;
hint "Attempting purchase...";
_index = lbCurSel (9001);
if (_index == -1) exitWith {};
_status = lbData[9001, _index];
_status = call compile format["%1", _status];
_quantity = ctrlText 9339;
_quantity = call compile format["%1", _quantity];
closedialog 0;

if(isNil "_status") exitwith {};
if(isNil "_quantity") exitwith {};

if(_quantity < 0) exitwith {};
 
_cost = call compile format["%1", (_status select 2)];
_availableQuantity = call compile format["%1", (_status select 1)];

_totalprice = _cost * _Quantity;
_cash = player getVariable "wallet";
if(_cash < _totalprice) exitwith { hint "Not enough cash."; };
if(_quantity > _availableQuantity) exitwith { hint "Please select an appropriate amount."; };
if(_totalprice == 0 || _totalprice < 0) exitwith { hint "You can not purchase an item that costs $0"; };

_status = (_status select 0);
[player,_status,_quantity] remoteexec ["server_fnc_shopPurchase",2];

//remote exec the purhcase to handle on the server.