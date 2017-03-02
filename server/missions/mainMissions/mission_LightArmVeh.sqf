// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_LightArmVeh.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "mainMissionDefines.sqf";

private ["_vehicleClass", "_nbUnits"];

_setupVars =
{
	_vehicleClass =
	[
		"CUP_O_UAZ_SPG9_CHDKZ",
		"CUP_O_UAZ_METIS_CHDKZ",
		"CUP_O_Ural_ZU23_RU",
		"CUP_O_GAZ_Vodnik_PK_RU",
		"CUP_O_GAZ_Vodnik_BPPU_RU",
		"CUP_O_BRDM2_CHDKZ",
		"CUP_O_BRDM2_ATGM_CHDKZ",
		"CUP_B_HMMWV_TOW_USMC",
		"CUP_B_HMMWV_M2_GPK_USA",
		"CUP_B_HMMWV_Avenger_USMC",
		"CUP_B_HMMWV_Avenger_USA",
		"CUP_B_RG31_M2_GC_USMC",
		"CUP_B_RG31_M2_OD_USMC",
		"CUP_B_RG31_Mk19_USMC",
		"CUP_B_RG31_Mk19_OD_USMC"

	] call BIS_fnc_selectRandom;

	_missionType = "Light Armed Vehicle";
	_locationsArray = MissionSpawnMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_this call mission_VehicleCapture;
