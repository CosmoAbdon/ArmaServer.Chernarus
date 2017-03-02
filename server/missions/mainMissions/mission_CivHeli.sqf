// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_CivHeli.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "mainMissionDefines.sqf";

private ["_vehicleClass", "_nbUnits"];

_setupVars =
{
	_vehicleClass = 
	["CUP_O_Mi8_CHDKZ","CUP_B_UH60M_FFV_US","CUP_B_MH60S_FFV_USMC","CUP_B_UH1D_GER_KSK","CUP_B_UH1D_GER_KSK_Des","CUP_B_CH47F_USA"] call BIS_fnc_selectRandom;

	_missionType = "Troop Transport Helicopter";
	_locationsArray = MissionSpawnMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_this call mission_VehicleCapture;
