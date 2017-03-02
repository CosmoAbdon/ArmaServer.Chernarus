// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: mission_HostileHelicopter.sqf
//	@file Author: JoSchaap, AgentRev

if (!isServer) exitwith {};
#include "sideMissionDefines.sqf"

private ["_vehicleClass", "_vehicle", "_createVehicle", "_vehicles", "_leader", "_speedMode", "_waypoint", "_vehicleName", "_numWaypoints", "_box1", "_box2", "_loadout"];

_setupVars =
{
	_missionType = "Hostile Helicopter";
	_locationsArray = nil; // locations are generated on the fly from towns
};

_setupObjects =
{
	_missionPos = markerPos (((call cityList) call BIS_fnc_selectRandom) select 0);
	_loadout = aiLoadoutsCrewman call BIS_fnc_selectRandom;

	_vehicleClass = if (missionDifficultyHard) then
	{
		["CUP_B_AH1Z_USMC", "CUP_O_Mi24_D_TK", "CUP_O_Ka52_Blk_RU", "CUP_B_AH64D_USA", "CUP_I_Mi24_Mk3_S8_GSh_AAF"] call BIS_fnc_selectRandom;
	}
	else
	{
		["CUP_B_AH6J_Escort_USA","CUP_O_Mi8_SLA_2", "CUP_B_AH6J_AT_USA", "CUP_O_Ka60_GL_Whale_CSAT"] call BIS_fnc_selectRandom;
	};

	_createVehicle =
	{
		private ["_type", "_position", "_direction", "_vehicle", "_soldier"];

		_type = _this select 0;
		_position = _this select 1;
		_direction = _this select 2;

		_vehicle = createVehicle [_type, _position, [], 0, "FLY"];
		_vehicle setVariable ["R3F_LOG_disabled", true, true];
		[_vehicle] call vehicleSetup;

		_vehicle setDir _direction;
		_aiGroup addVehicle _vehicle;

		// add a driver/pilot/captain to the vehicle
		// the little bird, orca, and hellcat do not require gunners and should not have any passengers
		_soldier = [_aiGroup, _position, _loadout] call createRandomCrewman;
		_soldier moveInDriver _vehicle;

		switch (true) do
		{
			case (_vehicle isKindOf "CUP_O_Ka60_GL_Whale_CSAT"):
			
			{
				//This chopper has a single side gunner with index 0 - tested in editor - should work
				_soldier = [_aiGroup, _position, _loadout] call createRandomCrewman;
				_soldier moveInTurret [_vehicle, [0]];
				/*
				// these choppers have 2 turrets so we need 2 gunners
				_soldier = [_aiGroup, _position, _loadout] call createRandomCrewman;
				_soldier moveInTurret [_vehicle, [1]];

				_soldier = [_aiGroup, _position, _loadout] call createRandomCrewman;
				_soldier moveInTurret [_vehicle, [2]];
				*/
			};
			
			case (_vehicle isKindOf "CUP_O_Mi8_SLA_2"):
			
			{
				// these chopper has 3 turrets so we need 3 gunners
				_soldier = [_aiGroup, _position, _loadout] call createRandomCrewman;
				_soldier moveInTurret [_vehicle, [0]];
				
				_soldier = [_aiGroup, _position, _loadout] call createRandomCrewman;
				_soldier moveInTurret [_vehicle, [1]];

				_soldier = [_aiGroup, _position, _loadout] call createRandomCrewman;
				_soldier moveInTurret [_vehicle, [2]];
			};

			//case (_type isKindOf "Heli_Attack_01_base_F" || _type isKindOf "Heli_Attack_02_base_F"):
			case ({_vehicle isKindOf _x} count ["CUP_B_AH6J_Escort_USA","CUP_O_Mi8_SLA_2", "CUP_B_AH6J_AT_USA", "CUP_B_AH1Z_USMC", "CUP_O_Mi24_D_TK", "CUP_O_Ka52_Blk_RU", "CUP_B_AH64D_USA", "CUP_I_Mi24_Mk3_S8_GSh_AAF"] > 0): 
			{
				// these choppers need 1 gunner
				_soldier = [_aiGroup, _position, _loadout] call createRandomCrewman;
				_soldier moveInGunner _vehicle;
			};
		};

		// remove flares because it overpowers AI choppers
		if (_type isKindOf "Air") then
		{
			{
				if (["CMFlare", _x] call fn_findString != -1) then
				{
					_vehicle removeMagazinesTurret [_x, [-1]];
				};
			} forEach getArray (configFile >> "CfgVehicles" >> _type >> "magazines");
		};

		[_vehicle, _aiGroup] spawn checkMissionVehicleLock;
		_vehicle
	};

	_aiGroup = createGroup CIVILIAN;

	_vehicle = [_vehicleClass, _missionPos, 0] call _createVehicle;

	_leader = effectiveCommander _vehicle;
	_aiGroup selectLeader _leader;

	_aiGroup setCombatMode "WHITE"; // Defensive behaviour
	_aiGroup setBehaviour "AWARE";
	_aiGroup setFormation "STAG COLUMN";

	_speedMode = if (missionDifficultyHard) then { "NORMAL" } else { "LIMITED" };

	_aiGroup setSpeedMode _speedMode;

	// behaviour on waypoints
	{
		_waypoint = _aiGroup addWaypoint [markerPos (_x select 0), 0];
		_waypoint setWaypointType "MOVE";
		_waypoint setWaypointCompletionRadius 50;
		_waypoint setWaypointCombatMode "WHITE";
		_waypoint setWaypointBehaviour "AWARE";
		_waypoint setWaypointFormation "STAG COLUMN";
		_waypoint setWaypointSpeed _speedMode;
	} forEach ((call cityList) call BIS_fnc_arrayShuffle);

	_missionPos = getPosATL leader _aiGroup;

	_missionPicture = getText (configFile >> "CfgVehicles" >> _vehicleClass >> "picture");
	_vehicleName = getText (configFile >> "CfgVehicles" >> _vehicleClass >> "displayName");

	_missionHintText = format ["An armed <t color='%2'>%1</t> is patrolling the island. Intercept it and recover its cargo!", _vehicleName, sideMissionColor];

	_numWaypoints = count waypoints _aiGroup;
};

_waitUntilMarkerPos = {getPosATL _leader};
_waitUntilExec = nil;
_waitUntilCondition = {currentWaypoint _aiGroup >= _numWaypoints};

_failedExec = nil;

// _vehicle is automatically deleted or unlocked in missionProcessor depending on the outcome

_successExec =
{
	// Mission completed

	_Boxes1 = ["Box_IND_Wps_F","Box_East_Wps_F","Box_NATO_Wps_F","Box_NATO_AmmoOrd_F","Box_NATO_Grenades_F","Box_East_WpsLaunch_F","Box_NATO_WpsLaunch_F","Box_East_WpsSpecial_F","Box_NATO_WpsSpecial_F"];    
	_currBox1 = _Boxes1 call BIS_fnc_selectRandom;
	_box1 = createVehicle [_currBox1, _lastPos, [], 5, "None"];
	_box1 setDir random 360;
	_box1 call randomCrateLoadOutNoThermal;

	_successHintMessage = "The sky is clear again, the enemy patrol was taken out! Ammo crates have fallen near the wreck.";
};

_this call sideMissionProcessor;
