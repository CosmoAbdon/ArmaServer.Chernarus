/*
	File: async_database.sqf
	Function: extDB_Database_async
	Author: Bryan "Tonic" Boardwine
	Description:
	Commits an asynchronous call to extDB
	Gets result via extDB  4:x + uses 5:x if message is Multi-Part
	Parameters:
		0: STRING (Query to be ran).
		1: INTEGER (1 = ASYNC + not return for update/insert, 2 = ASYNC + return for query's).
		3: BOOL (False to return a single array, True to return multiple entries mainly for garage).
*/

private["_queryStmt","_queryResult","_key","_mode","_return","_loop"];

_tickTime = diag_tickTime;

_queryStmt = param [0,"",["",[]]];
_mode = param [1,1,[0]];
_multiarr = param [2,false,[false]];

if (_queryStmt isEqualType []) then { _queryStmt = _queryStmt joinString ":" };

_key = "extDB3" callExtension ([_mode, call A3W_extDB_databaseID, _queryStmt] joinString ":");

if(_mode == 1) exitWith {true};

_key = call compile format["%1",_key];
_key = _key select 1;

sleep 0.01;

_queryResult = "";
_loop = true;
while{_loop} do
{
	_queryResult = "extDB3" callExtension format["4:%1", _key];
	if (_queryResult == "[5]") then {
		// extDB3 returned that result is Multi-Part Message
		_queryResult = "";
		while{true} do {
			_pipe = "extDB3" callExtension format["5:%1", _key];
			if(_pipe == "") exitWith {_loop = false};
			_queryResult = _queryResult + _pipe;
		};
	}
	else
	{
		if (_queryResult == "[3]") then
		{
			diag_log format ["[extDB3] Sleep [4]: %1", diag_tickTime]; // Helps highlight if someone SQL Queries are running slow
			sleep 0.1;
		} else {
			_loop = false;
		};
	};
};


_queryResult = call compile _queryResult;

// Not needed, its SQF Code incase extDB ever returns error message i.e Database Died
if ((_queryResult select 0) isEqualTo 0) exitWith {diag_log format ["[extDB3] ███ Protocol Error: %1, Unique ID: %2", _queryResult, _key]; []};
// diag_log format["DEBUG %1: %2", _key, _queryresult];
_return = (_queryResult select 1);

if(!_multiarr) then {
	_return = if (count _return > 0) then { _return select 0 } else { [] };
};

_return;