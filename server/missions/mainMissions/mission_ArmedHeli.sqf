// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_ArmedHeli.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "mainMissionDefines.sqf";

private ["_vehicleClass", "_nbUnits"];

_setupVars =
{
	
	if (count playAbleunits > 19) then
	{
		_vehicleClass =
		[
			/*
			 "CUP_O_Mi8_SLA_2",
			 "CUP_O_Ka52_RU",
			 "CUP_O_Ka52_Blk_RU",
			 "CUP_O_Mi24_D_TK",
			 "CUP_I_Mi24_Mk3_S8_GSh_AAF",
			 "CUP_B_AH6J_Escort_USA",
			 "CUP_B_AH6J_Escort19_USA",
			 "CUP_B_AH6J_AT_USA",
			 "CUP_B_AH6J_MP_USA",
			 "CUP_B_UH1Y_GUNSHIP_USMC",
			 "CUP_B_AH1Z_USMC",
			 "CUP_B_AH64D_USA",
			 "CUP_B_AH64D_ES_USA",
			 "CUP_B_AW159_Hellfire_GB",
			 "CUP_B_AW159_Hellfire_RN_Blackcat"
			 */
			 "CUP_I_Mi24_Mk3_S8_GSh_AAF" //remove after testing

		/*
			"B_Heli_Light_01_armed_F",
			"B_Heli_Transport_01_F",
			"B_Heli_Attack_01_F",
			"O_Heli_Light_02_F",
			"O_Heli_Attack_02_F",
			"I_Heli_light_03_F"
		*/
		] call BIS_fnc_selectRandom;
	}
	else
	{
		_vehicleClass =
		[
			 "CUP_O_Mi8_SLA_2",
			 //"CUP_O_Ka52_RU",
			 //"CUP_O_Ka52_Blk_RU",
			 //"CUP_O_Mi24_D_TK",
			 //"CUP_I_Mi24_Mk3_S8_GSh_AAF",
			 "CUP_B_AH6J_Escort_USA",
			 "CUP_B_AH6J_Escort19_USA",
			 "CUP_B_AH6J_AT_USA",
			 //"CUP_B_AH6J_MP_USA",
			 "CUP_B_UH1Y_GUNSHIP_USMC",
			 //"CUP_B_AH1Z_USMC",
			 //"CUP_B_AH64D_USA",
			 //"CUP_B_AH64D_ES_USA",
			 "CUP_B_AW159_Hellfire_GB",
			 "CUP_B_AW159_Hellfire_RN_Blackcat"

		/*
			"B_Heli_Light_01_armed_F",
			"B_Heli_Transport_01_F",
			"B_Heli_Attack_01_F",
			"O_Heli_Light_02_F",
			"O_Heli_Attack_02_F",
			"I_Heli_light_03_F"
		*/
		] call BIS_fnc_selectRandom;
	
	
	};

	_missionType = "Attack Helicopter";
	
	/*
	_missionType = switch (true) do
	{
		case (_vehicleClass isKindOf "B_Heli_Light_01_armed_F"): { "Experimental Attack Helicopter" };
		default { "Attack Helicopter" };
	};
	*/
	
	_locationsArray = MissionSpawnMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_this call mission_VehicleCapture;
