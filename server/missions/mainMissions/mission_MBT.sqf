// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_MBT.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "mainMissionDefines.sqf";

private ["_vehicleClass", "_nbUnits"];

_setupVars =
{
	_vehicleClass =
	[
		"CUP_O_T72_RU",
		"CUP_O_T90_RU",
		"CUP_B_M1A1_Woodland_US_Army",
		"CUP_B_M1A1_DES_US_Army",
		"CUP_B_M1A2_TUSK_MG_US_Army",
		"CUP_B_M1A2_TUSK_MG_DES_US_Army",
		"CUP_B_Challenger2_Woodland_BAF",
		"CUP_B_Challenger2_Desert_BAF"

	] call BIS_fnc_selectRandom;

	//_missionType = "Main Battle Tank";
	
	_missionType = switch (true) do
	{
		case (_vehicleClass isKindOf "rhs_sprut_vdv"): { "Tank Destroyer" };
		default { "Main Battle Tank" };
	
	};
	_locationsArray = MissionSpawnMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_this call mission_VehicleCapture;
