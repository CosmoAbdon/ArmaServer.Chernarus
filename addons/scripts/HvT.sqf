//	@file Version: 2.0
//	@file Name: HvT.sqf
//	@file Author: Cael817, CRE4MPIE, LouD, AgentRev

#define HVT_AMOUNT 35000  // how much a player needs to be carrying to become a HvT
#define HINT_DELAY 30  // number of seconds between each HvT reminder hint
#define MARKER_REFRESH 60  // number of seconds between each HvT marker refresh

if (isServer) then
{
	addMissionEventHandler ["PlayerDisconnected", { deleteMarker ("HvT_" + (_this select 1)) }];
};

if (!hasInterface) exitWith {};

waitUntil {sleep 0.1; alive player && !(player getVariable ["playerSpawning", true])};

_lastHint = -HINT_DELAY;
_lastMarker = -MARKER_REFRESH;
_markerTarget = objNull;
_hasMarker = false;

while {true} do
{
	_isHvT = (player getVariable ["cmoney",0] >= HVT_AMOUNT && alive player && !(player getVariable ["playerSpawning", true]));

	if (_isHvT && diag_tickTime - _lastHint >= HINT_DELAY) then
	{
		hint parseText ([
			"<t color='#ddbb22' size='1.5' align='center'>Priority Target</t>",
			//profileName,
			"<t color='#FFFFFF' shadow='1' shadowColor='#000000' align='center'>Someone has spotted you carrying a large sum of money and has marked your location on the map!</t>"
		] joinString "<br/>");

		_lastHint = diag_tickTime;
		//playSound "Topic_Done";
	};

	if (diag_tickTime - _lastMarker >= MARKER_REFRESH || (!alive _markerTarget && _hasMarker)) then
	{
		_markerName = "HvT_" + getPlayerUID player;

		if (_hasMarker) then
		{
			deleteMarker _markerName;
			_hasMarker = false;
		};

		if (_isHvT) then
		{
			createMarker [_markerName, getPosWorld player];
			_markerName setMarkerColor "ColorRed";
			_markerName setMarkerText format [" Priority Target: %1 ($%2k)", profileName, (floor ((player getVariable ["cmoney",0]) / 1000)) call fn_numToStr];
			//_markerName setMarkerText format ["Priority Target: %1", profileName];
			_markerName setMarkerSize [0.8, 0.8];
			_markerName setMarkerShape "ICON";
			_markerName setMarkerType "mil_dot";

			_lastMarker = diag_tickTime;
			_markerTarget = player;
			_hasMarker = true;
			playSound "Topic_Done";
		};
	};

	sleep 0.5;
};