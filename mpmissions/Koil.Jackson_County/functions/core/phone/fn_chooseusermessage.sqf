disableSerialization;
_index = lbCurSel (1113);
_message = ctrlText 9331;
if(_message == "Enter a Message") exitwith {};
if (_index == -1) exitWith {};
_status = lbData[1113, _index];
_status = call compile format["%1", _status];
closedialog 0;
sleep 0.05;
if(isNil "_status") exitwith { };
[_status,_message,player] remoteExec ["server_fnc_sendMessage",2];
[_message,format["FRESH SMS from %1", name player],name player] remoteExec ["client_fnc_sendMessage",_status];
