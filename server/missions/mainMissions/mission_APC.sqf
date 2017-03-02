// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_APC.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "mainMissionDefines.sqf";

private ["_vehicleClass", "_nbUnits"];

_setupVars =
{
	_vehicleClass =
	[	
		"CUP_O_BMP2_RU",
		"CUP_O_BMP2_CHDKZ",
		"CUP_O_BMP3_RU",
		"CUP_B_M1128_MGS_Woodland",
		"CUP_B_M1128_MGS_Desert",
		"CUP_B_M2Bradley_USA_D",
		"CUP_B_M2Bradley_USA_W",
		"CUP_B_M2A3Bradley_USA_D",
		"CUP_B_M2A3Bradley_USA_W",
		"CUP_B_FV432_Bulldog_GB_D",
		"CUP_B_FV432_Bulldog_GB_W",
		"CUP_B_FV432_Bulldog_GB_D_RWS",
		"CUP_B_FV432_Bulldog_GB_W_RWS",
		"CUP_B_FV510_GB_D",
		"CUP_B_FV510_GB_W",
		"CUP_B_FV510_GB_D_SLAT",
		"CUP_B_M163_USA",
		"CUP_O_ZSU23_TK",
		"CUP_O_2S6M_RU",
		"CUP_B_M6LineBacker_USA_D",
		"CUP_B_M6LineBacker_USA_W"


		/*
		"B_APC_Wheeled_01_cannon_F",
		"O_APC_Wheeled_02_rcws_F",
		"I_APC_Wheeled_03_cannon_F",
		"B_APC_Tracked_01_rcws_F",
		"O_APC_Tracked_02_cannon_F",
		"I_APC_tracked_03_cannon_F",
		"B_APC_Tracked_01_AA_F",
		"O_APC_Tracked_02_AA_F"
		*/
	] call BIS_fnc_selectRandom;

	_missionType = switch (true) do
	{
		case ({_vehicleClass isKindOf _x} count ["CUP_B_M163_USA", "CUP_O_ZSU23_TK","CUP_O_2S6M_RU","CUP_B_M6LineBacker_USA_D", "CUP_B_M6LineBacker_USA_W"] > 0): { "Anti Aircraft Vehicle" };
		case ({_vehicleClass isKindOf _x} count ["CUP_B_M2Bradley_USA_D",
		"CUP_B_M2Bradley_USA_W",
		"CUP_B_M2A3Bradley_USA_D",
		"CUP_B_M2A3Bradley_USA_W",
		"CUP_B_FV432_Bulldog_GB_D",
		"CUP_B_FV432_Bulldog_GB_W",
		"CUP_B_FV432_Bulldog_GB_D_RWS",
		"CUP_B_FV432_Bulldog_GB_W_RWS",
		"CUP_B_FV510_GB_D",
		"CUP_B_FV510_GB_W"] > 0):{ "Infantry Fighting Vehicle" };
		default  { "Armoured Personnel Carrier" };
	};

	_locationsArray = MissionSpawnMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_this call mission_VehicleCapture;
