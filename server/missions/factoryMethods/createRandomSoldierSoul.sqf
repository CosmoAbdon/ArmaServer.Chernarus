/*
	----------------------------------------------------------------------------------------------
	
	Copyright © 2016 soulkobk (soulkobk.blogspot.com)
	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU Affero General Public License as
	published by the Free Software Foundation, either version 3 of the
	License, or (at your option) any later version.
	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
	GNU Affero General Public License for more details.
	You should have received a copy of the GNU Affero General Public License
	along with this program. If not, see <http://www.gnu.org/licenses/>.
	----------------------------------------------------------------------------------------------
	
	Name: createRandomSoldierSoul.sqf
	Version: 1.0.0
	Author: soulkobk (soulkobk.blogspot.com)
	Creation Date: 6:30 PM 29/09/2016
	Modification Date: 6:30 PM 29/09/2016
	
	Description:
	For use with A3Wasteland 1.2b mission (A3Wasteland.com). This script is for custom AI loadouts.
	
	Add -> createRandomSoldierSoul = [_path, "createUnits\createRandomSoldierSoul.sqf"] call mf_compile;
	
	To -> \server\functions\serverCompile.sqf
	
	Parameter(s): none
	Example: none
	
	Change Log:
	1.0.0 -	original base script.
	
	----------------------------------------------------------------------------------------------
*/

if !(isServer) exitWith {}; // DO NOT DELETE THIS LINE!

_soldier = _this select 0;

///////////////////////////////////////////////////////////////////////////////////////////////////
// NUMBERS ARE IN PERCENTAGES
_rs_headGearProbability = 65;
_rs_vestProbability = 100;
_rs_backpackProbability = 25;
_rs_muzzleProbability = 35;
_rs_pointerProbability = 25;
_rs_opticProbability = 45; 
_rs_healthProbability = 25;
_rs_grenadeProbability = 35;
_rs_launcherProbability = 15;
_rs_intelProbability = 1;
///////////////////////////////////////////////////////////////////////////////////////////////////
_rs_weaponMagazineNum = (round(random 4) + 2);
_rs_launcherMagazineNum = (round(random 3) + 3);
///////////////////////////////////////////////////////////////////////////////////////////////////

_rs_weapons =
[

 "CUP_sgun_M1014",
 "CUP_arifle_AK47",
 "CUP_arifle_AK74M",
 "CUP_arifle_AK74M_GL",
 "CUP_arifle_AK107",
 "CUP_arifle_AK107_GL",
 "CUP_arifle_AKS74",
 "CUP_arifle_AKS74U",
 "CUP_arifle_AKM",
 "CUP_arifle_AKS",
 "CUP_arifle_M16A4_Base",
 "CUP_arifle_M4A1_black",
 "CUP_arifle_M4A1_camo",
 "CUP_arifle_M4A1_desert",
 "CUP_arifle_Mk16_STD",
 "CUP_arifle_Mk16_SV",
 "CUP_arifle_Mk17_CQC",
 "CUP_arifle_Mk17_STD",
 "CUP_arifle_G36C",
 "CUP_arifle_G36C_camo",
 "CUP_arifle_FNFAL_railed",
 "CUP_arifle_L85A2",
 "CUP_arifle_Sa58RIS1",
 "CUP_arifle_Sa58RIS1_des",
 "CUP_arifle_Sa58RIS2",
 "CUP_arifle_Sa58RIS2_camo",
 "CUP_srifle_Mk12SPR",
 "CUP_srifle_LeeEnfield_rail",
 "CUP_srifle_M14_DMR",
 "CUP_srifle_L129A1",
 "CUP_srifle_G22_des",
 "CUP_srifle_M24_des",
 "CUP_srifle_M24_wdl",
 "CUP_lmg_m249_pip2",
 "CUP_lmg_m249_pip1",
 "CUP_lmg_Mk48_wdl",
 "CUP_lmg_Pecheneg",
 "CUP_arifle_RPK74_45",
 "CUP_arifle_RPK74M",
 "CUP_arifle_RPK74",
 "CUP_lmg_minimi_railed"

];

_rs_launchers =
[
 "CUP_launch_Javelin",
 "CUP_launch_FIM92Stinger",
 "CUP_launch_M136",
 "CUP_launch_M47",
 "CUP_launch_MAAWS",
 "CUP_launch_Mk153Mod0",
 "CUP_launch_Metis",
 "CUP_launch_RPG18",
 "CUP_launch_9K32Strela",
 "CUP_launch_Igla",
 "CUP_launch_RPG7V",
 "CUP_launch_NLAW"

];

_rs_uniforms =
[
	"U_B_GhillieSuit",
	"U_O_GhillieSuit",
	"U_I_GhillieSuit",
	"U_B_FullGhillie_ard",
	"U_O_FullGhillie_ard",
	"U_I_FullGhillie_ard",
	"CUP_U_B_USArmy_Base",
	"CUP_U_B_USArmy_TwoKnee",
	"CUP_U_B_USArmy_UBACS",
	"CUP_U_B_USMC_FROG1_WMARPAT",
	"CUP_U_B_USMC_FROG1_DMARPAT",
	"CUP_U_B_USMC_FROG2_WMARPAT",
	"CUP_U_B_USMC_FROG2_DMARPAT",
	"CUP_U_B_USMC_FROG3_WMARPAT",
	"CUP_U_B_USMC_FROG3_DMARPAT",
	"CUP_U_B_USMC_FROG4_WMARPAT",
	"CUP_U_B_USMC_FROG4_DMARPAT",
	"CUP_U_O_RUS_Flora_1",
	"CUP_U_O_RUS_EMR_1",
	"CUP_U_O_RUS_Commander",
	"CUP_U_O_RUS_Gorka_Partizan",
	"CUP_U_O_RUS_Gorka_Green",
	"CUP_U_B_GER_Tropentarn_1",
	"CUP_U_B_GER_Flecktarn_1",
	"CUP_U_B_BAF_DDPM_S1_RolledUp",
	"CUP_U_B_BAF_DDPM_S2_UnRolled",
	"CUP_U_B_BAF_DPM_S1_RolledUp",
	"CUP_U_B_BAF_DPM_S2_UnRolled",
	"CUP_U_B_BAF_MTP_S1_RolledUp",
	"CUP_U_B_BAF_MTP_S2_UnRolled"

];

_rs_vests =
[
	"CUP_V_B_IOTV_SL",
	"CUP_V_B_IOTV_Medic",
	"CUP_V_B_IOTV_Rifleman",
	"CUP_V_B_IOTV_AT",
	"CUP_V_B_IOTV_MG",
	"CUP_V_B_Interceptor_Rifleman",
	"CUP_V_B_MTV_Patrol",
	"CUP_V_B_MTV_Pouches",
	"CUP_V_B_MTV_PistolBlack",
	"CUP_V_B_MTV_LegPouch",
	"CUP_V_B_MTV_MG",
	"CUP_V_B_MTV_TL",
	"CUP_V_B_RRV_TL",
	"CUP_V_B_RRV_Medic",
	"CUP_V_B_RRV_DA1",
	"CUP_V_B_RRV_MG",
	"CUP_V_B_RRV_Scout",
	"CUP_V_B_Eagle_SPC_Rifleman",
	"CUP_V_B_Eagle_SPC_Patrol",
	"CUP_V_B_Eagle_SPC_GL",
	"CUP_V_B_Eagle_SPC_MG",
	"CUP_V_B_Eagle_SPC_AT",
	"CUP_V_B_Eagle_SPC_Corpsman",
	"CUP_V_B_Eagle_SPC_SL",
	"CUP_V_BAF_Osprey_Mk2_DDPM_Soldier1",
	"CUP_V_BAF_Osprey_Mk2_DDPM_Grenadier",
	"CUP_V_BAF_Osprey_Mk2_DDPM_Sapper",
	"CUP_V_BAF_Osprey_Mk2_DDPM_Medic",
	"CUP_V_BAF_Osprey_Mk2_DPM_Soldier1",
	"CUP_V_BAF_Osprey_Mk2_DPM_Grenadier",
	"CUP_V_BAF_Osprey_Mk2_DPM_Sapper",
	"CUP_V_BAF_Osprey_Mk2_DPM_Medic",
	"CUP_V_BAF_Osprey_Mk4_MTP_Grenadier",
	"CUP_V_BAF_Osprey_Mk4_MTP_MachineGunner",
	"CUP_V_BAF_Osprey_Mk4_MTP_Rifleman",
	"CUP_V_BAF_Osprey_Mk4_MTP_SquadLeader",
	"CUP_V_RUS_6B3_1",
	"CUP_V_RUS_6B3_2",
	"CUP_V_RUS_6B3_3",
	"CUP_V_RUS_6B3_4",
	"CUP_V_RUS_Smersh_1",
	"CUP_V_RUS_Smersh_2"

];

_rs_headgears =
[
	"CUP_H_USMC_ACVC_WDL",
	"CUP_H_USMC_ACVC_DES",
	"CUP_H_USMC_MICH2000_DEF_ESS_WDL",
	"CUP_H_USMC_MICH2000_DEF_ESS_DES",
	"CUP_H_USMC_LWH_ESS_WDL",
	"CUP_H_USMC_LWH_ESS_DES",
	"CUP_H_USMC_BOONIE_WDL",
	"CUP_H_USMC_BOONIE_DES",
	"CUP_H_USMC_Helmet_Pilot",
	"CUP_H_USMC_Crew_Helmet",
	"CUP_H_USArmy_HelmetMICH",
	"CUP_H_USArmy_HelmetMICH_wdl",
	"CUP_H_USArmy_Helmet_ECH1_Sand",
	"CUP_H_USArmy_Helmet_ECH1_Black",
	"CUP_H_USArmy_Helmet_ECH1_Green",
	"CUP_H_USArmy_Helmet_Pro",
	"CUP_H_USArmy_Helmet_M1_Olive",
	"CUP_H_USArmy_Helmet_M1_Vine",
	"CUP_H_USArmy_Helmet_M1_m81",
	"CUP_H_USArmy_Helmet_M1_btp",
	"CUP_H_BAF_Officer_Beret",
	"CUP_H_BAF_Helmet_Pilot",
	"CUP_H_BAF_Helmet_1_DDPM",
	"CUP_H_BAF_Helmet_1_DPM",
	"CUP_H_BAF_Helmet_1_MTP",
	"CUP_H_BAF_Helmet_Net_2_DDPM",
	"CUP_H_BAF_Helmet_Net_2_DPM",
	"CUP_H_BAF_Helmet_Net_2_MTP",
	"CUP_H_BAF_Crew_Helmet_DDPM",
	"CUP_H_BAF_Crew_Helmet_DPM",
	"CUP_H_BAF_Crew_Helmet_MTP",
	"CUP_H_RUS_6B27",
	"CUP_H_RUS_6B27_olive",
	"CUP_H_RUS_TSH_4_Brown",
	"CUP_H_RUS_ZSH_Shield_Down",
	"CUP_H_RUS_Beret_Spetsnaz",
	"CUP_H_RUS_ZSH_1"

];

_rs_backpacks =
[
	"CUP_B_USPack_Coyote",
	"CUP_B_USPack_Black",
	"CUP_B_GER_Medic_Desert",
	"CUP_B_GER_Medic_Tropentarn",
	"CUP_B_GER_Medic_FLecktarn",
	"CUP_B_TK_Medic_Desert",
	"CUP_B_SLA_Medicbag",
	"CUP_B_RPGPack_Khaki",
	"CUP_B_RUS_Backpack",
	"CUP_B_CivPack_WDL",
	"CUP_B_HikingPack_Civ",
	"CUP_B_GER_Pack_Tropentarn",
	"CUP_B_GER_Pack_Flecktarn",
	"CUP_B_Bergen_BAF",
	"CUP_B_AlicePack_Khaki",
	"CUP_B_AlicePack_Bedroll",
	"CUP_B_USMC_AssaultPack",
	"CUP_B_USMC_MOLLE",
	"CUP_B_USMC_MOLLE_WDL"

];

_rs_opticsSRifle = 
[
	"CUP_optic_SB_11_4x20_PM",
	"CUP_optic_LeupoldMk4_MRT_tan",
	"CUP_optic_Leupold_VX3",
	"CUP_optic_LeupoldM3LR",
	"CUP_optic_LeupoldMk4_10x40_LRT_Desert",
	"CUP_optic_LeupoldMk4_10x40_LRT_Woodland",
	"CUP_optic_PSO_3"
];

_rs_intels = 
[
	"CUP_item_Moscow_Bombing_File",
	"CUP_item_Cobalt_File",
	"CUP_item_Kostey_photos",
	"CUP_item_Kostey_map_case",
	"CUP_item_Kostey_notebook"
];

_rs_opticsDisallow =
[
	
	"CUP_optic_SB_3_12x50_PMII",
	"CUP_optic_AN_PVS_10",
	"CUP_optic_AN_PVS_4",
	"CUP_optic_AN_PAS_13c1",
	"CUP_optic_AN_PAS_13c2",
	"CUP_optic_PechenegScope",
	"CUP_optic_NSPU",
	"GOSHAWK TWS",
	"CUP_optic_NSPU_RPG",
	"optic_SOS",
	"optic_SOS_khk_F", // apex
	"optic_Nightstalker", // thermal
	"optic_tws", // thermal
	"optic_tws_mg", // thermal
	"optic_NVS", // night vision
	"optic_DMS", // lr scope
	"optic_DMS_ghex_F", // apex
	"optic_LRPS", // lr scope
	"optic_LRPS_tna_F", // lr scope apex
	"optic_LRPS_ghex_F" // lr scope apex
];

///////////////////////////////////////////////////////////////////////////////////////////////////
// CLEAR SOLDIER CONTENTS
removeUniform _soldier;
removeHeadgear _soldier:
removeGoggles _soldier;
removeVest _soldier;
removeBackpack _soldier;
removeAllWeapons _soldier;
removeAllAssignedItems _soldier;
removeAllItems _soldier;
///////////////////////////////////////////////////////////////////////////////////////////////////
// ADD UNIFORM
_soldierUniform = _rs_uniforms select floor(random(count _rs_uniforms));
_soldier addUniform _soldierUniform;
///////////////////////////////////////////////////////////////////////////////////////////////////
// ADD HEADGEAR
if ((_rs_headGearProbability > random 99) || (_rs_headGearProbability == 100)) then
{
	_soldierHeadgear = _rs_headgears select floor(random(count _rs_headgears));
	_soldier addHeadgear _soldierHeadgear;
};
///////////////////////////////////////////////////////////////////////////////////////////////////
// ADD VEST
if ((_rs_vestProbability > random 99) || (_rs_vestProbability == 100)) then
{
	_soldierVest = _rs_vests select floor(random(count _rs_vests));
	_soldier addVest _soldierVest;
};
///////////////////////////////////////////////////////////////////////////////////////////////////
// ADD BACKBACK
if ((_rs_backpackProbability > random 99) || (_rs_backpackProbability == 100)) then
{
	_soldierBackpack = _rs_backpacks select floor(random(count _rs_backpacks));
	_soldier addBackPack _soldierBackpack;
};
///////////////////////////////////////////////////////////////////////////////////////////////////
// ADD LAUNCHER TO SOLDIER
if ((_rs_launcherProbability > random 99) || (_rs_launcherProbability == 100)) then
{
	if (isNull (unitBackpack _soldier)) then
	{
		_soldier addBackpack "B_Carryall_mcamo";
		//_soldierBackpack = _rs_backpacks select floor(random(count _rs_backpacks));
		//_soldier addBackPack _soldierBackpack;
	};
	_soldierLauncherWeapon = _rs_launchers select floor(random(count _rs_launchers));
	_soldierLauncherWeaponAdd = [_soldier, _soldierLauncherWeapon, _rs_launcherMagazineNum] call BIS_fnc_addWeapon;
};
///////////////////////////////////////////////////////////////////////////////////////////////////
// ADD MAIN WEAPON TO SOLDIER
_soldierPrimaryWeapon = _rs_weapons select floor(random(count _rs_weapons));
_soldierPrimaryWeaponAdd = [_soldier, _soldierPrimaryWeapon, _rs_weaponMagazineNum] call BIS_fnc_addWeapon;
///////////////////////////////////////////////////////////////////////////////////////////////////
// ADD MUZZLE TO MAIN WEAPON
if ((_rs_muzzleProbability > random 99) || (_rs_muzzleProbability == 100)) then
{
	_soldierPrimaryMuzzles = []; _soldierPrimaryMuzzles = getArray (configFile >> "CfgWeapons" >> _soldierPrimaryWeapon >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");
	if ((count _soldierPrimaryMuzzles) >= 1) then
	{
		_soldierPrimaryMuzzle = _soldierPrimaryMuzzles select floor(random(count _soldierPrimaryMuzzles));
		_soldier addPrimaryWeaponItem _soldierPrimaryMuzzle;
	};
};
///////////////////////////////////////////////////////////////////////////////////////////////////
// ADD POINTER TO MAIN WEAPON
if ((_rs_pointerProbability > random 99) || (_rs_pointerProbability == 100)) then
{
	_soldierPrimaryPointers = []; _soldierPrimaryPointers = getArray (configFile >> "CfgWeapons" >> _soldierPrimaryWeapon >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
	if ((count _soldierPrimaryPointers) >= 1) then
	{
		_soldierPrimaryPointer = _soldierPrimaryPointers select floor(random(count _soldierPrimaryPointers));
		_soldier addPrimaryWeaponItem _soldierPrimaryPointer;
	};
};
///////////////////////////////////////////////////////////////////////////////////////////////////
// ADD OPTIC TO MAIN WEAPON
if (["srifle", _soldierPrimaryWeapon] call fn_findString > 0) then 
	{
		_soldierPrimaryOptic = _rs_opticsSRifle call BIS_fnc_selectRandom;
		_soldier addPrimaryWeaponItem _soldierPrimaryOptic;	
		
	} 
	else
	{
		if ((_rs_opticProbability > random 99) || (_rs_opticProbability == 100)) then
		{
				{
				_soldierPrimaryOptics = []; _soldierPrimaryOptics = getArray (configFile >> "CfgWeapons" >> _soldierPrimaryWeapon >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
				_soldierPrimaryOptics = _soldierPrimaryOptics - _rs_opticsDisallow;
				
				if ((count _soldierPrimaryOptics) >= 1) then
				{
					_soldierPrimaryOptic = _soldierPrimaryOptics select floor(random(count _soldierPrimaryOptics));
					_soldier addPrimaryWeaponItem _soldierPrimaryOptic;	
				};
			};
			
			
			
		};
	};
///////////////////////////////////////////////////////////////////////////////////////////////////
// ADD FIRST AID KITS TO SOLDIER
if ((_rs_healthProbability > random 99) || (_rs_healthProbability == 100)) then
{
	_healthMaxNum = (round (random 4) + 1);
	for "_i" from 1 to _healthMaxNum do
	{
		_soldier addItem "FirstAidKit";
	};
};
///////////////////////////////////////////////////////////////////////////////////////////////////
// ADD GRENADES TO SOLDIER
if ((_rs_grenadeProbability > random 99) || (_rs_grenadeProbability == 100)) then
{
	_grenadeMaxNum = (round (random 4) + 1);
	_soldier addMagazines ["HandGrenade", _grenadeMaxNum];
};
///////////////////////////////////////////////////////////////////////////////////////////////////
// ADD INTEL TO SOLDIER
if ((_rs_intelProbability > random 99) || (_rs_intelProbability == 100)) then
{
	_soldierIntel = _rs_intels select floor(random(count _rs_intels));
	_soldier addItem _soldierIntel;
};
