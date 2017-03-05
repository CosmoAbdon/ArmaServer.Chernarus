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
	
	Name: randomCrateLoadOut.sqf
	Version: 1.0
	Author: soulkobk (soulkobk.blogspot.com)
	Creation Date: 4:40 PM 07/10/2016
	Modification Date: 4:40 PM 07/10/2016
	
	Description:
	For use with A3Wasteland 1.3x mission (A3Wasteland.com). This script is a replacement mission
	crate load-out script that will randomly select and place items in to mission crates.
	
	Place this script in the mission file, in path \server\functions\randomCrateLoadOut.sqf
	and edit \server\functions\serverCompile.sqf and place...	
	randomCrateLoadOut = [_path, "randomCrateLoadOut.sqf"] call mf_compile;
	underneath the line...
	_path = "server\functions";
	
	In order to use this in your mission you can place in the init line of the crate...
	this call randomCrateLoadOut;
	
	If you intend on using it within outpost scripts, you can call this script within using the
	fourth paramater, Example...
	["Box_East_WpsSpecial_F",[0,0,0],0,{_this call randomCrateLoadOut}],
	["<object>",[<xyz location>],<direction>,{<init>}],
	
	The custom function will disable damage to the crate, lock the crate until mission is completed,
	and randomly fill the crate with loot. To edit the script and how it functions, see the code
	below from lines 64 to 1109. Some loot is commented out by default (OP items), I have left
	them in should you want them in your A3Wasteland mission.

	Parameter(s): none

	Example: none
	
	Change Log:
	1.0.0 -	original base script.

	----------------------------------------------------------------------------------------------
*/

if !(isServer) exitWith {}; // DO NOT DELETE THIS LINE!

// #define __DEBUG__

_backPacks =
[
	// "B_AA_01_weapon_F", // Static Titan Launcher (AA) [NATO] BACKPACK"
	"CUP_B_AssaultPack_ACU", // Assault Pack (Black) BACKPACK"
	"CUP_B_AssaultPack_Coyote", // Assault Pack (Coyote) BACKPACK"
	"CUP_B_AssaultPack_Black", // Assault Pack (Digi) BACKPACK"
	// "B_AssaultPack_Kerry", // US Assault Pack (Kerry) BACKPACK"
	"CUP_B_USPack_Coyote", // Assault Pack (Khaki) BACKPACK"
	"CUP_B_USPack_Black", // Assault Pack (MTP) BACKPACK"
	"CUP_B_ACRScout_m95", // Assault Pack (Hex) BACKPACK"
	"CUP_B_ACRPara_m95", // Assault Pack (Green) BACKPACK"
	"CUP_B_GER_Medic_Desert", // Assault Pack (Sage) BACKPACK"
	"CUP_B_GER_Medic_Tropentarn", // Assault Pack (Tropic) BACKPACK"
	// "B_AT_01_weapon_F", // Static Titan Launcher (AT) [NATO] BACKPACK"
	"CUP_B_GER_Medic_FLecktarn", // Bergen Backpack (Digital) BACKPACK"
	"CUP_B_TK_Medic_Desert", // Bergen Backpack (Hex) BACKPACK"
	"CUP_B_SLA_Medicbag", // Bergen Backpack (MTP) BACKPACK"
	"CUP_B_RPGPack_Khaki", // Bergen Backpack (Tropic) BACKPACK"
	"CUP_B_RUS_Backpack", // Carryall Backpack (Coyote) BACKPACK"
	"CUP_B_CivPack_WDL", // Carryall Backpack (Green Hex) BACKPACK"
	"CUP_B_HikingPack_Civ", // Carryall Backpack (Khaki) BACKPACK"
	"CUP_B_GER_Pack_Tropentarn", // Carryall Backpack (MTP) BACKPACK"
	"CUP_B_GER_Pack_Flecktarn", // Carryall Backpack (Hex) BACKPACK"
	"CUP_B_Bergen_BAF", // Carryall Backpack (Olive) BACKPACK"
	"CUP_B_AlicePack_Khaki", // Carryall Backpack (Urban) BACKPACK"
	"CUP_B_AlicePack_Bedroll", // Field Pack (Black) BACKPACK"
	"CUP_B_USMC_AssaultPack", // Field Pack (Coyote) BACKPACK"
	"CUP_B_USMC_MOLLE", // Field Pack (Green Hex) BACKPACK"
	"CUP_B_USMC_MOLLE_WDL", // Field Pack (Khaki) BACKPACK"
	"B_Carryall_khk", // Field Pack (Coyote) BACKPACK"
	"B_Carryall_mcamo", // Field Pack (Green Hex) BACKPACK"
	"B_Carryall_oucamo", // Field Pack (Khaki) BACKPACK"
	"B_Bergen_blk", // Field Pack (Hex) BACKPACK"
	"B_Bergen_rgr", // Field Pack (Olive) BACKPACK"
	"B_Bergen_mcamo" // Field Pack (Urban) BACKPACK"
	
	/*
	// "B_GMG_01_A_weapon_F", // Dismantled Autonomous GMG [NATO] BACKPACK"
	// "B_GMG_01_high_weapon_F", // Dismantled Mk32 GMG (Raised) [NATO] BACKPACK"
	// "B_GMG_01_weapon_F", // Dismantled Mk32 GMG [NATO] BACKPACK"
	// "B_HMG_01_A_weapon_F", // Dismantled Autonomous MG [NATO] BACKPACK"
	// "B_HMG_01_high_weapon_F", // Dismantled Mk30 HMG (Raised) [NATO] BACKPACK"
	// "B_HMG_01_support_F", // Folded Tripod [NATO] BACKPACK"
	// "B_HMG_01_support_high_F", // Folded Tripod (Raised) [NATO] BACKPACK"
	// "B_HMG_01_weapon_F", // Dismantled Mk30 HMG [NATO] BACKPACK"
	"B_Kitbag_cbr", // Kitbag (Coyote) BACKPACK"
	"B_Kitbag_mcamo", // Kitbag (MTP) BACKPACK"
	"B_Kitbag_rgr", // Kitbag (Green) BACKPACK"
	"B_Kitbag_sgg", // Kitbag (Sage) BACKPACK"
	// "B_Mortar_01_support_F", // Folded Mk6 Mortar Bipod [NATO] BACKPACK"
	// "B_Mortar_01_weapon_F", // Folded Mk6 Mortar Tube [NATO] BACKPACK"
	// "B_Parachute", // Steerable Parachute BACKPACK"
	// "B_Static_Designator_01_weapon_F", // Remote Designator Bag [NATO] BACKPACK"
	"B_TacticalPack_blk", // Tactical Backpack (Black) BACKPACK"
	"B_TacticalPack_mcamo", // Tactical Backpack (MTP) BACKPACK"
	"B_TacticalPack_ocamo", // Tactical Backpack (Hex) BACKPACK"
	"B_TacticalPack_oli", // Tactical Backpack (Olive) BACKPACK"
	"B_TacticalPack_rgr", // Tactical Backpack (Green) BACKPACK"
	// "B_UAV_01_backpack_F", // UAV Bag [NATO] BACKPACK"
	"B_ViperHarness_blk_F", // Viper Harness (Black) BACKPACK"
	"B_ViperHarness_ghex_F", // Viper Harness (Green Hex) BACKPACK"
	"B_ViperHarness_hex_F", // Viper Harness (Hex) BACKPACK"
	"B_ViperHarness_khk_F", // Viper Harness (Khaki) BACKPACK"
	"B_ViperHarness_oli_F", // Viper Harness (Olive) BACKPACK"
	"B_ViperLightHarness_blk_F", // Viper Light Harness (Black) BACKPACK"
	"B_ViperLightHarness_ghex_F", // Viper Light Harness (Green Hex) BACKPACK"
	"B_ViperLightHarness_hex_F", // Viper Light Harness (Hex) BACKPACK"
	"B_ViperLightHarness_khk_F", // Viper Light Harness (Khaki) BACKPACK"
	"B_ViperLightHarness_oli_F" // Viper Light Harness (Olive) BACKPACK"
	// "I_AA_01_weapon_F", // Static Titan Launcher (AA) [AAF] BACKPACK"
	// "I_AT_01_weapon_F", // Static Titan Launcher (AT) [AAF] BACKPACK"
	// "I_GMG_01_A_weapon_F", // Dismantled Autonomous GMG [AAF] BACKPACK"
	// "I_GMG_01_high_weapon_F", // Dismantled Mk32 GMG (Raised) [AAF] BACKPACK"
	// "I_GMG_01_weapon_F", // Dismantled Mk32 GMG [AAF] BACKPACK"
	// "I_HMG_01_A_weapon_F", // Dismantled Autonomous MG [AAF] BACKPACK"
	// "I_HMG_01_high_weapon_F", // Dismantled Mk30 HMG (Raised) [AAF] BACKPACK"
	// "I_HMG_01_support_F", // Folded Tripod [AAF] BACKPACK"
	// "I_HMG_01_support_high_F", // Folded Tripod (Raised) [AAF] BACKPACK"
	// "I_HMG_01_weapon_F", // Dismantled Mk30 HMG [AAF] BACKPACK"
	// "I_Mortar_01_support_F", // Folded Mk6 Mortar Bipod [AAF] BACKPACK"
	// "I_Mortar_01_weapon_F", // Folded Mk6 Mortar Tube [AAF] BACKPACK"
	// "I_UAV_01_backpack_F", // UAV Bag [AAF] BACKPACK"
	// "O_AA_01_weapon_F", // Static Titan Launcher (AA) [CSAT] BACKPACK"
	// "O_AT_01_weapon_F", // Static Titan Launcher (AT) [CSAT] BACKPACK"
	// "O_GMG_01_A_weapon_F", // Dismantled Autonomous GMG [CSAT] BACKPACK"
	// "O_GMG_01_high_weapon_F", // Dismantled Mk32 GMG (Raised) [CSAT] BACKPACK"
	// "O_GMG_01_weapon_F", // Dismantled Mk32 GMG [CSAT] BACKPACK"
	// "O_HMG_01_A_weapon_F", // Dismantled Autonomous MG [CSAT] BACKPACK"
	// "O_HMG_01_high_weapon_F", // Dismantled Mk30 HMG (Raised) [CSAT] BACKPACK"
	// "O_HMG_01_support_F", // Folded Tripod [CSAT] BACKPACK"
	// "O_HMG_01_support_high_F", // Folded Tripod (Raised) [CSAT] BACKPACK"
	// "O_HMG_01_weapon_F", // Dismantled Mk30 HMG [CSAT] BACKPACK"
	// "O_Mortar_01_support_F", // Folded Mk6 Mortar Bipod [CSAT] BACKPACK"
	// "O_Mortar_01_weapon_F", // Folded Mk6 Mortar Tube [CSAT] BACKPACK"
	// "O_Static_Designator_02_weapon_F", // Remote Designator Bag [CSAT] BACKPACK"
	// "O_UAV_01_backpack_F" // UAV Bag [CSAT] BACKPACK"
	*/
];

_binoculars =
[
	"Laserdesignator", // Laser Designator (Sand) BINOCULAR"
	"Laserdesignator_01_khk_F", // Laser Designator (Khaki) BINOCULAR"
	"Laserdesignator_02", // Laser Designator (Hex) BINOCULAR"
	"Laserdesignator_02_ghex_F", // Laser Designator (Green Hex) BINOCULAR"
	"Laserdesignator_03", // Laser Designator (Olive) BINOCULAR"
	// "NVGoggles", // NV Goggles (Brown) BINOCULAR"
	// "NVGogglesB_blk_F", // ENVG-II (Black) BINOCULAR"
	// "NVGogglesB_grn_F", // ENVG-II (Green) BINOCULAR"
	// "NVGogglesB_gry_F", // ENVG-II (Grey) BINOCULAR"
	// "NVGoggles_INDEP", // NV Goggles (Green) BINOCULAR"
	// "NVGoggles_OPFOR", // NV Goggles (Black) BINOCULAR"
	// "NVGoggles_tna_F", // NV Goggles (Tropic) BINOCULAR"
	"O_NVGoggles_ghex_F", // Compact NVG (Green Hex) BINOCULAR"
	"O_NVGoggles_hex_F", // Compact NVG (Hex) BINOCULAR"
	"O_NVGoggles_urb_F", // Compact NVG (Urban) BINOCULAR"
	"Rangefinder" // Rangefinder BINOCULAR"
];

_bipods =
[
	"CUP_bipod_Harris_1A2_L", // Bipod (Black) [NATO] BIPOD"
	"CUP_bipod_VLTOR_Modpod", // Bipod (Khaki) [NATO] BIPOD"
	
	"bipod_01_F_blk", // Bipod (Black) [NATO] BIPOD"
	"bipod_01_F_khk", // Bipod (Khaki) [NATO] BIPOD"
	"bipod_01_F_mtp", // Bipod (MTP) [NATO] BIPOD"
	"bipod_01_F_snd", // Bipod (Sand) [NATO] BIPOD"
	"bipod_02_F_blk", // Bipod (Black) [CSAT] BIPOD"
	"bipod_02_F_hex", // Bipod (Hex) [CSAT] BIPOD"
	"bipod_02_F_tan", // Bipod (Tan) [CSAT] BIPOD"
	"bipod_03_F_blk", // Bipod (Black) [AAF] BIPOD"
	"bipod_03_F_oli" // Bipod (Olive) [AAF] BIPOD"
];

_headGear =
[
	"CUP_H_USMC_ACVC_WDL", // Combat Helmet HEADGEAR"
	"CUP_H_USMC_ACVC_DES", // Combat Helmet (Black) HEADGEAR"
	"CUP_H_USMC_MICH2000_DEF_ESS_WDL", // Combat Helmet (Camo) HEADGEAR"
	"CUP_H_USMC_MICH2000_DEF_ESS_DES", // Combat Helmet (Desert) HEADGEAR"
	"CUP_H_USMC_LWH_ESS_WDL", // Enhanced Combat Helmet (Tropic) HEADGEAR"
	"CUP_H_USMC_LWH_ESS_DES", // Combat Helmet (Grass) HEADGEAR"
	"CUP_H_USMC_BOONIE_WDL", // Light Combat Helmet HEADGEAR"
	"CUP_H_USMC_BOONIE_DES", // Light Combat Helmet (Black) HEADGEAR"
	"CUP_H_USMC_Helmet_Pilot", // Light Combat Helmet (Desert) HEADGEAR"
	"CUP_H_USMC_Crew_Helmet", // Light Combat Helmet (Grass) HEADGEAR"
	
	"CUP_H_USArmy_HelmetMICH", // Light Combat Helmet (Sand) HEADGEAR"
	"CUP_H_USArmy_HelmetMICH_wdl", // Light Combat Helmet (Snakeskin) HEADGEAR"
	"CUP_H_USArmy_Helmet_ECH1_Sand", // Light Combat Helmet (Tropic) HEADGEAR"
	"CUP_H_USArmy_Helmet_ECH1_Black", // Combat Helmet (Sand) HEADGEAR"
	"CUP_H_USArmy_Helmet_ECH1_Green", // Combat Helmet (Snakeskin) HEADGEAR"
	"CUP_H_USArmy_Helmet_Pro", // Stealth Combat Helmet HEADGEAR"
	"CUP_H_USArmy_Helmet_M1_Olive", // Combat Helmet (Tropic) HEADGEAR"
	"CUP_H_USArmy_Helmet_M1_Vine", // Combat Helmet HEADGEAR"
	"CUP_H_USArmy_Helmet_M1_m81", // Combat Helmet (Black) HEADGEAR"
	"CUP_H_USArmy_Helmet_M1_btp", // Combat Helmet (Camo) HEADGEAR"
	
	"CUP_H_BAF_Officer_Beret", // Combat Helmet (Desert) HEADGEAR"
	"CUP_H_BAF_Helmet_Pilot", // Enhanced Combat Helmet (Tropic) HEADGEAR"
	"CUP_H_BAF_Helmet_1_DDPM", // Combat Helmet (Grass) HEADGEAR"
	"CUP_H_BAF_Helmet_1_DPM", // Light Combat Helmet HEADGEAR"
	"CUP_H_BAF_Helmet_1_MTP", // Light Combat Helmet (Black) HEADGEAR"
	"CUP_H_BAF_Helmet_Net_2_DDPM", // Light Combat Helmet (Desert) HEADGEAR"
	"CUP_H_BAF_Helmet_Net_2_DPM", // Light Combat Helmet (Grass) HEADGEAR"
	"CUP_H_BAF_Helmet_Net_2_MTP", // Combat Helmet HEADGEAR"
	"CUP_H_BAF_Crew_Helmet_DDPM", // Combat Helmet (Black) HEADGEAR"
	"CUP_H_BAF_Crew_Helmet_DPM", // Combat Helmet (Camo) HEADGEAR"
	"CUP_H_BAF_Crew_Helmet_MTP", // Combat Helmet (Desert) HEADGEAR"
	"CUP_H_RUS_6B27", // Enhanced Combat Helmet (Tropic) HEADGEAR"
	"CUP_H_RUS_6B27_olive", // Combat Helmet (Grass) HEADGEAR"
	"CUP_H_RUS_TSH_4_Brown", // Light Combat Helmet HEADGEAR"
	"CUP_H_RUS_ZSH_Shield_Down", // Light Combat Helmet (Black) HEADGEAR"
	"CUP_H_RUS_Beret_Spetsnaz", // Light Combat Helmet (Desert) HEADGEAR"
	"CUP_H_RUS_ZSH_1", // Light Combat Helmet (Grass) HEADGEAR"
	
	"H_Bandanna_blu", // Bandana (Blue) HEADGEAR"
	"H_Bandanna_camo", // Bandana (Woodland) HEADGEAR"
	"H_Bandanna_cbr", // Bandana (Coyote) HEADGEAR"
	"H_Bandanna_gry", // Bandana (Black) HEADGEAR"
	"H_Bandanna_khk", // Bandana (Khaki) HEADGEAR"
	"H_Bandanna_khk_hs", // Bandana (Headset) HEADGEAR"
	"H_Bandanna_mcamo", // Bandana (MTP) HEADGEAR"
	"H_Bandanna_sand", // Bandana (Sand) HEADGEAR"
	"H_Bandanna_sgg", // Bandana (Sage) HEADGEAR"
	"H_Bandanna_surfer", // Bandana (Surfer) HEADGEAR"
	"H_Bandanna_surfer_blk", // Bandana (Surfer, Black) HEADGEAR"
	"H_Bandanna_surfer_grn" // Bandana (Surfer, Green) HEADGEAR"
	
	/*
	// "H_Beret_02", // Beret [NATO] HEADGEAR"
	// "H_Beret_blk", // Beret (Black) HEADGEAR"
	// "H_Beret_Colonel", // Beret [NATO] (Colonel) HEADGEAR"
	// "H_Beret_gen_F", // Beret (Gendarmerie) HEADGEAR"
	// "H_Booniehat_dgtl", // Booniehat [AAF] HEADGEAR"
	// "H_Booniehat_khk", // Booniehat (Khaki) HEADGEAR"
	// "H_Booniehat_khk_hs", // Booniehat (Headset) HEADGEAR"
	// "H_Booniehat_mcamo", // Booniehat (MTP) HEADGEAR"
	// "H_Booniehat_oli", // Booniehat (Olive) HEADGEAR"
	// "H_Booniehat_tan", // Booniehat (Sand) HEADGEAR"
	// "H_Booniehat_tna_F", // Booniehat (Tropic) HEADGEAR"
	// "H_Cap_blk", // Cap (Black) HEADGEAR"
	// "H_Cap_blk_CMMG", // Cap (CMMG) HEADGEAR"
	// "H_Cap_blk_ION", // Cap (ION) HEADGEAR"
	// "H_Cap_blk_Raven", // Cap [AAF] HEADGEAR"
	// "H_Cap_blu", // Cap (Blue) HEADGEAR"
	// "H_Cap_brn_SPECOPS", // Cap [OPFOR] HEADGEAR"
	// "H_Cap_grn", // Cap (Green) HEADGEAR"
	// "H_Cap_grn_BI", // Cap (BI) HEADGEAR"
	// "H_Cap_headphones", // Rangemaster Cap HEADGEAR"
	// "H_Cap_khaki_specops_UK", // Cap (UK) HEADGEAR"
	// "H_Cap_marshal", // Marshal Cap HEADGEAR"
	// "H_Cap_oli", // Cap (Olive) HEADGEAR"
	// "H_Cap_oli_hs", // Cap (Olive, Headset) HEADGEAR"
	// "H_Cap_police", // Cap (Police) HEADGEAR"
	// "H_Cap_press", // Cap (Press) HEADGEAR"
	// "H_Cap_red", // Cap (Red) HEADGEAR"
	// "H_Cap_surfer", // Cap (Surfer) HEADGEAR"
	// "H_Cap_tan", // Cap (Tan) HEADGEAR"
	// "H_Cap_tan_specops_US", // Cap (US MTP) HEADGEAR"
	// "H_Cap_usblack", // Cap (US Black) HEADGEAR"
	"H_CrewHelmetHeli_B", // Heli Crew Helmet [NATO] HEADGEAR"
	"H_CrewHelmetHeli_I", // Heli Crew Helmet [AAF] HEADGEAR"
	"H_CrewHelmetHeli_O", // Heli Crew Helmet [CSAT] HEADGEAR"
	// "H_Hat_blue", // Hat (Blue) HEADGEAR"
	// "H_Hat_brown", // Hat (Brown) HEADGEAR"
	// "H_Hat_camo", // Hat (Camo) HEADGEAR"
	// "H_Hat_checker", // Hat (Checker) HEADGEAR"
	// "H_Hat_grey", // Hat (Grey) HEADGEAR"
	// "H_Hat_tan", // Hat (Tan) HEADGEAR"
	"H_HelmetB", // Combat Helmet HEADGEAR"
	"H_HelmetB_black", // Combat Helmet (Black) HEADGEAR"
	"H_HelmetB_camo", // Combat Helmet (Camo) HEADGEAR"
	"H_HelmetB_desert", // Combat Helmet (Desert) HEADGEAR"
	"H_HelmetB_Enh_tna_F", // Enhanced Combat Helmet (Tropic) HEADGEAR"
	"H_HelmetB_grass", // Combat Helmet (Grass) HEADGEAR"
	"H_HelmetB_light", // Light Combat Helmet HEADGEAR"
	"H_HelmetB_light_black", // Light Combat Helmet (Black) HEADGEAR"
	"H_HelmetB_light_desert", // Light Combat Helmet (Desert) HEADGEAR"
	"H_HelmetB_light_grass", // Light Combat Helmet (Grass) HEADGEAR"
	"H_HelmetB_light_sand", // Light Combat Helmet (Sand) HEADGEAR"
	"H_HelmetB_light_snakeskin", // Light Combat Helmet (Snakeskin) HEADGEAR"
	"H_HelmetB_Light_tna_F", // Light Combat Helmet (Tropic) HEADGEAR"
	"H_HelmetB_sand", // Combat Helmet (Sand) HEADGEAR"
	"H_HelmetB_snakeskin", // Combat Helmet (Snakeskin) HEADGEAR"
	"H_HelmetB_TI_tna_F", // Stealth Combat Helmet HEADGEAR"
	"H_HelmetB_tna_F", // Combat Helmet (Tropic) HEADGEAR"
	"H_HelmetCrew_B", // Crew Helmet [NATO] HEADGEAR"
	"H_HelmetCrew_I", // Crew Helmet [AAF] HEADGEAR"
	"H_HelmetCrew_O", // Crew Helmet [CSAT] HEADGEAR"
	"H_HelmetCrew_O_ghex_F", // Crew Helmet (Green Hex) [CSAT] HEADGEAR"
	// "H_HelmetIA", // Modular Helmet HEADGEAR"
	"H_HelmetLeaderO_ghex_F", // Defender Helmet (Green Hex) HEADGEAR"
	"H_HelmetLeaderO_ocamo", // Defender Helmet (Hex) HEADGEAR"
	"H_HelmetLeaderO_oucamo", // Defender Helmet (Urban) HEADGEAR"
	"H_HelmetO_ghex_F", // Protector Helmet (Green Hex) HEADGEAR"
	"H_HelmetO_ocamo", // Protector Helmet (Hex) HEADGEAR"
	"H_HelmetO_oucamo", // Protector Helmet (Urban) HEADGEAR"
	// "H_HelmetO_ViperSP_ghex_F", // Special Purpose Helmet (Green Hex) HEADGEAR"
	// "H_HelmetO_ViperSP_hex_F", // Special Purpose Helmet (Hex) HEADGEAR"
	"H_HelmetSpecB", // Enhanced Combat Helmet HEADGEAR"
	"H_HelmetSpecB_blk", // Enhanced Combat Helmet (Black) HEADGEAR"
	"H_HelmetSpecB_paint1", // Enhanced Combat Helmet (Grass) HEADGEAR"
	"H_HelmetSpecB_paint2", // Enhanced Combat Helmet (Desert) HEADGEAR"
	"H_HelmetSpecB_sand", // Enhanced Combat Helmet (Sand) HEADGEAR"
	"H_HelmetSpecB_snakeskin", // Enhanced Combat Helmet (Snakeskin) HEADGEAR"
	"H_HelmetSpecO_blk", // Assassin Helmet (Black) HEADGEAR"
	"H_HelmetSpecO_ghex_F", // Assassin Helmet (Green Hex) HEADGEAR"
	"H_HelmetSpecO_ocamo", // Assassin Helmet (Hex) HEADGEAR"
	// "H_Helmet_Skate", // Skate Helmet HEADGEAR"
	// "H_MilCap_blue", // Military Cap (Blue) HEADGEAR"
	// "H_MilCap_dgtl", // Military Cap [AAF] HEADGEAR"
	// "H_MilCap_gen_F", // Military Cap (Gendarmerie) HEADGEAR"
	// "H_MilCap_ghex_F", // Military Cap (Green Hex) HEADGEAR"
	// "H_MilCap_gry", // Military Cap (Grey) HEADGEAR"
	// "H_MilCap_mcamo", // Military Cap (MTP) HEADGEAR"
	// "H_MilCap_ocamo", // Military Cap (Hex) HEADGEAR"
	// "H_MilCap_tna_F", // Military Cap (Tropic) HEADGEAR"
	"H_PilotHelmetFighter_B", // Pilot Helmet [NATO] HEADGEAR"
	"H_PilotHelmetFighter_I", // Pilot Helmet [AAF] HEADGEAR"
	"H_PilotHelmetFighter_O", // Pilot Helmet [CSAT] HEADGEAR"
	"H_PilotHelmetHeli_B", // Heli Pilot Helmet [NATO] HEADGEAR"
	"H_PilotHelmetHeli_I", // Heli Pilot Helmet [AAF] HEADGEAR"
	"H_PilotHelmetHeli_O" // Heli Pilot Helmet [CSAT] HEADGEAR"
	// "H_RacingHelmet_1_black_F", // Racing Helmet (Black) HEADGEAR"
	// "H_RacingHelmet_1_blue_F", // Racing Helmet (Blue) HEADGEAR"
	// "H_RacingHelmet_1_F", // Racing Helmet (Fuel) HEADGEAR"
	// "H_RacingHelmet_1_green_F", // Racing Helmet (Green) HEADGEAR"
	// "H_RacingHelmet_1_orange_F", // Racing Helmet (Orange) HEADGEAR"
	// "H_RacingHelmet_1_red_F", // Racing Helmet (Red) HEADGEAR"
	// "H_RacingHelmet_1_white_F", // Racing Helmet (White) HEADGEAR"
	// "H_RacingHelmet_1_yellow_F", // Racing Helmet (Yellow) HEADGEAR"
	// "H_RacingHelmet_2_F", // Racing Helmet (Bluking) HEADGEAR"
	// "H_RacingHelmet_3_F", // Racing Helmet (Redstone) HEADGEAR"
	// "H_RacingHelmet_4_F", // Racing Helmet (Vrana) HEADGEAR"
	// "H_ShemagOpen_khk", // Shemag (White) HEADGEAR"
	// "H_ShemagOpen_tan", // Shemag (Tan) HEADGEAR"
	// "H_Shemag_olive", // Shemag (Olive) HEADGEAR"
	// "H_Shemag_olive_hs", // Shemag (Olive, Headset) HEADGEAR"
	// "H_StrawHat", // Straw Hat HEADGEAR"
	// "H_StrawHat_dark", // Straw Hat (Dark) HEADGEAR"
	// "H_Watchcap_blk", // Beanie HEADGEAR"
	// "H_Watchcap_camo", // Beanie (Green) HEADGEAR"
	// "H_Watchcap_cbr", // Beanie (Coyote) HEADGEAR"
	// "H_Watchcap_khk" // Beanie (Khaki) HEADGEAR"
	*/
];

_items =
[
	"B_UavTerminal", // UAV Terminal [NATO] ITEM"
	"FirstAidKit", // First Aid Kit ITEM"
	"FirstAidKit", // First Aid Kit ITEM"
	"FirstAidKit", // First Aid Kit ITEM"
	"FirstAidKit", // First Aid Kit ITEM"
	"FirstAidKit", // First Aid Kit ITEM"
	"FirstAidKit", // First Aid Kit ITEM"
	"FirstAidKit", // First Aid Kit ITEM"
	"FirstAidKit", // First Aid Kit ITEM"
	"FirstAidKit", // First Aid Kit ITEM"
	"FirstAidKit", // First Aid Kit ITEM"
	// "ItemCompass", // Compass ITEM"
	"ItemGPS", // GPS ITEM"
	// "ItemMap", // Map ITEM"
	// "ItemRadio", // Radio ITEM"
	// "ItemWatch", // Watch ITEM"
	"I_UavTerminal", // UAV Terminal [AAF] ITEM"
	"Medikit", // Medikit ITEM"
	"Medikit", // Medikit ITEM"
	"Medikit", // Medikit ITEM"
	"Medikit", // Medikit ITEM"
	"Medikit", // Medikit ITEM"
	"O_UavTerminal", // UAV Terminal [CSAT] ITEM"
	"ToolKit",// Toolkit ITEM"
	"ToolKit",// Toolkit ITEM"
	"ToolKit",// Toolkit ITEM"
	"ToolKit",// Toolkit ITEM"
	"ToolKit"// Toolkit ITEM"
];

_launcherWeapons =
[
	"CUP_launch_Javelin", // Titan MPRL (Sand) LAUNCHERWEAPON"
	"CUP_launch_FIM92Stinger", // Titan MPRL Compact (Sand) LAUNCHERWEAPON"
	"CUP_launch_M136", // Titan MPRL Compact (Tropic) LAUNCHERWEAPON"
	"CUP_launch_M47", // Titan MPRL (Tropic) LAUNCHERWEAPON"
	"CUP_launch_MAAWS", // Titan MPRL (Digital) LAUNCHERWEAPON"
	"CUP_launch_Mk153Mod0", // Titan MPRL Compact (Olive) LAUNCHERWEAPON"
	"CUP_launch_Metis", // PCML LAUNCHERWEAPON"
	"CUP_launch_RPG18", // Titan MPRL (Hex) LAUNCHERWEAPON"
	"CUP_launch_9K32Strela", // Titan MPRL (Green Hex) LAUNCHERWEAPON"
	"CUP_launch_Igla", // Titan MPRL Compact (Coyote) LAUNCHERWEAPON"
	"CUP_launch_RPG7V", // Titan MPRL Compact (Green Hex) LAUNCHERWEAPON"
	"CUP_launch_NLAW" // RPG-42 Alamut LAUNCHERWEAPON"
	//"launch_RPG32_ghex_F", // RPG-42 Alamut (Green Hex) LAUNCHERWEAPON"
	//"launch_RPG7_F" // RPG-7 LAUNCHERWEAPON"
	// "MineDetector" // Mine Detector LAUNCHERWEAPON"
];

_magazines =
[
	"CUP_30Rnd_545x39_AK_M", 
	"CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M", 
	"CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M", 
	"CUP_30Rnd_TE1_White_Tracer_545x39_AK_M", 
	"CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK_M", 
	"CUP_30Rnd_Subsonic_545x39_AK_M", 
	"CUP_30Rnd_762x39_AK47_M", 
	"CUP_30Rnd_Sa58_M", 
	"CUP_30Rnd_Sa58_M_TracerG", 
	"CUP_10x_303_M", 
	"CUP_30Rnd_556x45_Stanag", 
	"CUP_30Rnd_556x45_G36", 
	"CUP_30Rnd_TE1_Red_Tracer_556x45_G36", 
	"CUP_30Rnd_TE1_Green_Tracer_556x45_G36", 
	"CUP_30Rnd_TE1_Yellow_Tracer_556x45_G36", 
	"CUP_100Rnd_556x45_BetaCMag", 
	"CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag", 
	"CUP_100Rnd_TE1_Green_Tracer_556x45_BetaCMag", 
	"CUP_100Rnd_TE1_Yellow_Tracer_556x45_BetaCMag", 
	"CUP_20Rnd_762x51_FNFAL_M", 
	"CUP_20Rnd_762x51_L129_M", 
	"CUP_20Rnd_762x51_B_SCAR", 
	"CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR", 
	"CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR", 
	"CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR", 
	"CUP_20Rnd_TE1_White_Tracer_762x51_SCAR", 
	"CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M", 
	"CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M", 
	"CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M", 
	"CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", 
	"CUP_200Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M", 
	"CUP_200Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", 
	"CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M", 
	"CUP_200Rnd_TE4_Green_Tracer_556x45_M249", 
	"CUP_200Rnd_TE4_Red_Tracer_556x45_M249", 
	"CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249", 
	"CUP_200Rnd_TE1_Red_Tracer_556x45_M249", 
	"CUP_100Rnd_TE4_Green_Tracer_556x45_M249", 
	"CUP_100Rnd_TE4_Red_Tracer_556x45_M249", 
	"CUP_100Rnd_TE4_Yellow_Tracer_556x45_M249", 
	"CUP_200Rnd_TE4_Green_Tracer_556x45_L110A1", 
	"CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1", 
	"CUP_200Rnd_TE4_Yellow_Tracer_556x45_L110A1", 
	"CUP_1Rnd_HE_GP25_M", 
	"CUP_FlareWhite_GP25_M", 
	"CUP_FlareGreen_GP25_M", 
	"CUP_FlareRed_GP25_M", 
	"CUP_FlareYellow_GP25_M", 
	"CUP_IlumFlareWhite_GP25_M", 
	"CUP_IlumFlareRed_GP25_M", 
	"CUP_IlumFlareGreen_GP25_M", 
	"CUP_1Rnd_SMOKE_GP25_M", 
	"CUP_1Rnd_SmokeRed_GP25_M", 
	"CUP_1Rnd_SmokeGreen_GP25_M", 
	"CUP_1Rnd_SmokeYellow_GP25_M", 
	"CUP_6Rnd_HE_GP25_M", 
	"CUP_1Rnd_HE_M203", 
	"CUP_1Rnd_HEDP_M203", 
	"1Rnd_HE_Grenade_shell", 
	"CUP_1Rnd_StarCluster_White_M203", 
	"CUP_1Rnd_StarCluster_Red_M203", 
	"CUP_1Rnd_StarCluster_Green_M203", 
	"CUP_1Rnd_StarFlare_White_M203", 
	"CUP_1Rnd_StarFlare_Red_M203", 
	"CUP_1Rnd_StarFlare_Green_M203", 
	"CUP_FlareWhite_M203", 
	"CUP_FlareGreen_M203", 
	"CUP_FlareRed_M203", 
	"CUP_FlareYellow_M203", 
	"CUP_1Rnd_Smoke_M203", 
	"CUP_1Rnd_SmokeRed_M203", 
	"CUP_1Rnd_SmokeGreen_M203", 
	"CUP_1Rnd_SmokeYellow_M203", 
	"UGL_FlareWhite_F", 
	"UGL_FlareGreen_F", 
	"UGL_FlareRed_F", 
	"UGL_FlareYellow_F", 
	"UGL_FlareCIR_F", 
	"1Rnd_Smoke_Grenade_shell", 
	"1Rnd_SmokeRed_Grenade_shell", 
	"1Rnd_SmokeGreen_Grenade_shell", 
	"1Rnd_SmokeYellow_Grenade_shell", 
	"1Rnd_SmokePurple_Grenade_shell", 
	"1Rnd_SmokeBlue_Grenade_shell", 
	"1Rnd_SmokeOrange_Grenade_shell", 
	"CUP_64Rnd_9x19_Bizon_M", 
	"CUP_64Rnd_Green_Tracer_9x19_Bizon_M", 
	"CUP_64Rnd_Red_Tracer_9x19_Bizon_M", 
	"CUP_64Rnd_White_Tracer_9x19_Bizon_M", 
	"CUP_64Rnd_Yellow_Tracer_9x19_Bizon_M", 
	"CUP_30Rnd_9x19_MP5", 
	"CUP_10Rnd_B_765x17_Ball_M", 
	"CUP_20Rnd_B_765x17_Ball_M", 
	"CUP_30Rnd_9x19_EVO", 
	"CUP_30Rnd_9x19_UZI", 
	"CUP_5Rnd_127x108_KSVK_M", 
	"CUP_10Rnd_762x54_SVD_M", 
	"CUP_10Rnd_9x39_SP5_VSS_M", 
	"CUP_20Rnd_9x39_SP5_VSS_M", 
	"CUP_5Rnd_127x99_as50_M", 
	"CUP_5Rnd_762x51_M24", 
	"CUP_20Rnd_762x51_B_M110", 
	"CUP_20Rnd_TE1_Yellow_Tracer_762x51_M110", 
	"CUP_20Rnd_TE1_Red_Tracer_762x51_M110", 
	"CUP_20Rnd_TE1_Green_Tracer_762x51_M110", 
	"CUP_20Rnd_TE1_White_Tracer_762x51_M110", 
	"CUP_10Rnd_127x99_M107", 
	"CUP_10Rnd_762x51_CZ750", 
	"CUP_10Rnd_762x51_CZ750_Tracer", 
	"CUP_5Rnd_86x70_L115A1", 
	"CUP_5Rnd_762x67_G22", 
	"CUP_5x_22_LR_17_HMR_M", 
	"CUP_8Rnd_B_Saiga12_74Slug_M", 
	"CUP_8Rnd_B_Saiga12_74Pellets_M", 
	"CUP_20Rnd_B_AA12_Pellets", 
	"CUP_20Rnd_B_AA12_74Slug", 
	"CUP_20Rnd_B_AA12_HE", 
	"CUP_8Rnd_B_Beneli_74Slug", 
	"CUP_8Rnd_B_Beneli_74Pellets", 
	"CUP_8Rnd_9x18_Makarov_M", 
	"CUP_8Rnd_9x18_MakarovSD_M", 
	"CUP_6Rnd_45ACP_M", 
	"CUP_17Rnd_9x19_glock17", 
	"CUP_7Rnd_45ACP_1911", 
	"CUP_10Rnd_9x19_Compact", 
	"CUP_18Rnd_9x19_Phantom", 
	"CUP_15Rnd_9x19_M9", 
	"CUP_Strela_2_M", 
	"CUP_Igla_M", 
	"CUP_Stinger_M", 
	"CUP_Javelin_M", 
	"CUP_M136_M", 
	"CUP_Dragon_EP1_M", 
	"CUP_MAAWS_HEDP_M", 
	"CUP_MAAWS_HEAT_M", 
	"CUP_AT13_M", 
	"CUP_NLAW_M", 
	"CUP_RPG18_M", 
	"CUP_PG7V_M", 
	"CUP_OG7_M", 
	"CUP_SMAW_HEDP_M", 
	"CUP_SMAW_HEAA_M", 
	"1Rnd_HE_Grenade_shell", 
	"3Rnd_HE_Grenade_shell", 
	"1Rnd_Smoke_Grenade_shell", 
	"1Rnd_SmokePurple_Grenade_shell", 
	"1Rnd_SmokeBlue_Grenade_shell", 
	"1Rnd_SmokeGreen_Grenade_shell", 
	"1Rnd_SmokeYellow_Grenade_shell", 
	"1Rnd_SmokeOrange_Grenade_shell", 
	"1Rnd_SmokeRed_Grenade_shell", 
	"3Rnd_Smoke_Grenade_shell", 
	"3Rnd_SmokePurple_Grenade_shell", 
	"3Rnd_SmokeBlue_Grenade_shell", 
	"3Rnd_SmokeGreen_Grenade_shell", 
	"3Rnd_SmokeYellow_Grenade_shell", 
	"3Rnd_SmokeOrange_Grenade_shell", 
	"3Rnd_SmokeRed_Grenade_shell", 
	"UGL_FlareWhite_F", 
	"UGL_FlareGreen_F", 
	"UGL_FlareYellow_F", 
	"UGL_FlareRed_F", 
	"UGL_FlareCIR_F", 
	"3Rnd_UGL_FlareWhite_F", 
	"3Rnd_UGL_FlareGreen_F", 
	"3Rnd_UGL_FlareYellow_F", 
	"3Rnd_UGL_FlareRed_F", 
	"3Rnd_UGL_FlareCIR_F"

	
	/*
	"100Rnd_580x42_Mag_F", // 5.8 mm 100Rnd Mag MAGAZINE"
	"100Rnd_580x42_Mag_Tracer_F", // 5.8 mm 100Rnd Tracer (Green) Mag MAGAZINE"
	"100Rnd_65x39_caseless_mag", // 6.5 mm 100Rnd Mag MAGAZINE"
	"100Rnd_65x39_caseless_mag_Tracer", // 6.5 mm 100Rnd Tracer (Red) Mag MAGAZINE"
	"10Rnd_127x54_Mag", // 12.7mm 10Rnd Mag MAGAZINE"
	"10Rnd_338_Mag", // .338 LM 10Rnd Mag MAGAZINE"
	"10Rnd_50BW_Mag_F", // .50 BW 10Rnd Caseless Mag MAGAZINE"
	"10Rnd_762x51_Mag", // 7.62mm 10Rnd Mag MAGAZINE"
	"10Rnd_762x54_Mag", // 7.62mm 10Rnd Mag MAGAZINE"
	"10Rnd_93x64_DMR_05_Mag", // 9.3mm 10Rnd Mag MAGAZINE"
	"10Rnd_9x21_Mag", // 9 mm 10Rnd Mag MAGAZINE"
	"11Rnd_45ACP_Mag", // .45 ACP 11Rnd Mag MAGAZINE"
	"130Rnd_338_Mag", // .338 NM 130Rnd Belt MAGAZINE"
	"150Rnd_556x45_Drum_Mag_F", // 5.56 mm 150Rnd Mag MAGAZINE"
	"150Rnd_556x45_Drum_Mag_Tracer_F", // 5.56 mm 150Rnd Tracer (Red) Mag MAGAZINE"
	"150Rnd_762x51_Box", // 7.62 mm 150Rnd Box MAGAZINE"
	"150Rnd_762x51_Box_Tracer", // 7.62 mm 150Rnd Tracer (Green) Box MAGAZINE"
	"150Rnd_762x54_Box", // 7.62 mm 150Rnd Box MAGAZINE"
	"150Rnd_762x54_Box_Tracer", // 7.62 mm 150Rnd Tracer (Green) Box MAGAZINE"
	"150Rnd_93x64_Mag", // 9.3mm 150Rnd Belt MAGAZINE"
	"16Rnd_9x21_green_Mag", // 9 mm 16Rnd Reload Tracer (Green) Mag MAGAZINE"
	"16Rnd_9x21_Mag", // 9 mm 16Rnd Mag MAGAZINE"
	"16Rnd_9x21_red_Mag", // 9 mm 16Rnd Reload Tracer (Red) Mag MAGAZINE"
	"16Rnd_9x21_yellow_Mag", // 9 mm 16Rnd Reload Tracer (Yellow) Mag MAGAZINE"
	"1Rnd_HE_Grenade_shell", // 40 mm HE Grenade Round MAGAZINE"
	"1Rnd_SmokeBlue_Grenade_shell", // Smoke Round (Blue) MAGAZINE"
	"1Rnd_SmokeGreen_Grenade_shell", // Smoke Round (Green) MAGAZINE"
	"1Rnd_SmokeOrange_Grenade_shell", // Smoke Round (Orange) MAGAZINE"
	"1Rnd_SmokePurple_Grenade_shell", // Smoke Round (Purple) MAGAZINE"
	"1Rnd_SmokeRed_Grenade_shell", // Smoke Round (Red) MAGAZINE"
	"1Rnd_SmokeYellow_Grenade_shell", // Smoke Round (Yellow) MAGAZINE"
	"1Rnd_Smoke_Grenade_shell", // Smoke Round (White) MAGAZINE"
	"200Rnd_556x45_Box_F", // 5.56 mm 200Rnd Reload Tracer (Yellow) Box MAGAZINE"
	"200Rnd_556x45_Box_Red_F", // 5.56 mm 200Rnd Reload Tracer (Red) Box MAGAZINE"
	"200Rnd_556x45_Box_Tracer_F", // 5.56 mm 200Rnd Tracer (Yellow) Box MAGAZINE"
	"200Rnd_556x45_Box_Tracer_Red_F", // 5.56 mm 200Rnd Tracer (Red) Box MAGAZINE"
	"200Rnd_65x39_cased_Box", // 6.5 mm 200Rnd Belt MAGAZINE"
	"200Rnd_65x39_cased_Box_Tracer", // 6.5 mm 200Rnd Belt Tracer (Yellow) MAGAZINE"
	"20Rnd_556x45_UW_mag", // 5.56 mm 20Rnd Dual Purpose Mag MAGAZINE"
	"20Rnd_650x39_Cased_Mag_F", // 6.5 mm 20Rnd Mag MAGAZINE"
	"20Rnd_762x51_Mag", // 7.62 mm 20Rnd Mag MAGAZINE"
	"30Rnd_45ACP_Mag_SMG_01", // .45 ACP 30Rnd Vermin Mag MAGAZINE"
	"30Rnd_45ACP_Mag_SMG_01_Tracer_Green", // .45 ACP 30Rnd Vermin Tracers (Green) Mag MAGAZINE"
	"30Rnd_45ACP_Mag_SMG_01_Tracer_Red", // .45 ACP 30Rnd Vermin Tracers (Red) Mag MAGAZINE"
	"30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow", // .45 ACP 30Rnd Vermin Tracers (Yellow) Mag MAGAZINE"
	"30Rnd_545x39_Mag_F", // 5.45 mm 30Rnd Reload Tracer (Yellow) Mag MAGAZINE"
	"30Rnd_545x39_Mag_Green_F", // 5.45 mm 30Rnd Reload Tracer (Green) Mag MAGAZINE"
	"30Rnd_545x39_Mag_Tracer_F", // 5.45 mm 30Rnd Tracer (Yellow) Mag MAGAZINE"
	"30Rnd_545x39_Mag_Tracer_Green_F", // 5.45 mm 30Rnd Tracer (Green) Mag MAGAZINE"
	"30Rnd_556x45_Stanag", // 5.56 mm 30rnd STANAG Reload Tracer (Yellow) Mag MAGAZINE"
	"30Rnd_556x45_Stanag_green", // 5.56 mm 30rnd STANAG Reload Tracer (Green) Mag MAGAZINE"
	"30Rnd_556x45_Stanag_red", // 5.56 mm 30rnd STANAG Reload Tracer (Red) Mag MAGAZINE"
	"30Rnd_556x45_Stanag_Tracer_Green", // 5.56 mm 30rnd Tracer (Green) Mag MAGAZINE"
	"30Rnd_556x45_Stanag_Tracer_Red", // 5.56 mm 30rnd Tracer (Red) Mag MAGAZINE"
	"30Rnd_556x45_Stanag_Tracer_Yellow", // 5.56 mm 30rnd Tracer (Yellow) Mag MAGAZINE"
	"30Rnd_580x42_Mag_F", // 5.8 mm 30Rnd Mag MAGAZINE"
	"30Rnd_580x42_Mag_Tracer_F", // 5.8 mm 30Rnd Tracer (Green) Mag MAGAZINE"
	"30Rnd_65x39_caseless_green", // 6.5mm 30Rnd Caseless Mag MAGAZINE"
	"30Rnd_65x39_caseless_green_mag_Tracer", // 6.5 mm 30Rnd Tracer (Green) Caseless Mag MAGAZINE"
	"30Rnd_65x39_caseless_mag", // 6.5 mm 30Rnd STANAG Mag MAGAZINE"
	"30Rnd_65x39_caseless_mag_Tracer", // 6.5 mm 30Rnd Tracer (Red) Mag MAGAZINE"
	"30Rnd_762x39_Mag_F", // 7.62 mm 30Rnd Reload Tracer (Yellow) Mag MAGAZINE"
	"30Rnd_762x39_Mag_Green_F", // 7.62 mm 30Rnd Reload Tracer (Green) Mag MAGAZINE"
	"30Rnd_762x39_Mag_Tracer_F", // 7.62 mm 30Rnd Tracer (Yellow) Mag MAGAZINE"
	"30Rnd_762x39_Mag_Tracer_Green_F", // 7.62 mm 30Rnd Tracer (Green) Mag MAGAZINE"
	"30Rnd_9x21_Green_Mag", // 9 mm 30Rnd Reload Tracer (Green) Mag MAGAZINE"
	"30Rnd_9x21_Mag", // 9 mm 30Rnd Mag MAGAZINE"
	"30Rnd_9x21_Mag_SMG_02", // 9 mm 30Rnd Mag MAGAZINE"
	"30Rnd_9x21_Mag_SMG_02_Tracer_Green", // 9 mm 30Rnd Reload Tracer (Green) Mag MAGAZINE"
	"30Rnd_9x21_Mag_SMG_02_Tracer_Red", // 9 mm 30Rnd Reload Tracer (Red) Mag MAGAZINE"
	"30Rnd_9x21_Mag_SMG_02_Tracer_Yellow", // 9 mm 30Rnd Reload Tracer (Yellow) Mag MAGAZINE"
	"30Rnd_9x21_Red_Mag", // 9 mm 30Rnd Reload Tracer (Red) Mag MAGAZINE"
	"30Rnd_9x21_Yellow_Mag", // 9 mm 30Rnd Reload Tracer (Yellow) Mag MAGAZINE"
	"3Rnd_HE_Grenade_shell", // 40 mm 3Rnd HE Grenade MAGAZINE"
	"3Rnd_SmokeBlue_Grenade_shell", // 3Rnd 3GL Smoke Rounds (Blue) MAGAZINE"
	"3Rnd_SmokeGreen_Grenade_shell", // 3Rnd 3GL Smoke Rounds (Green) MAGAZINE"
	"3Rnd_SmokeOrange_Grenade_shell", // 3Rnd 3GL Smoke Rounds (Orange) MAGAZINE"
	"3Rnd_SmokePurple_Grenade_shell", // 3Rnd 3GL Smoke Rounds (Purple) MAGAZINE"
	"3Rnd_SmokeRed_Grenade_shell", // 3Rnd 3GL Smoke Rounds (Red) MAGAZINE"
	"3Rnd_SmokeYellow_Grenade_shell", // 3Rnd 3GL Smoke Rounds (Yellow) MAGAZINE"
	"3Rnd_Smoke_Grenade_shell", // 3Rnd 3GL Smoke Rounds (White) MAGAZINE"
	"3Rnd_UGL_FlareCIR_F", // 3Rnd 3GL Flares (IR) MAGAZINE"
	"3Rnd_UGL_FlareGreen_F", // 3Rnd 3GL Flares (Green) MAGAZINE"
	"3Rnd_UGL_FlareRed_F", // 3Rnd 3GL Flares (Red) MAGAZINE"
	"3Rnd_UGL_FlareWhite_F", // 3Rnd 3GL Flares (White) MAGAZINE"
	"3Rnd_UGL_FlareYellow_F", // 3Rnd 3GL Flares (Yellow) MAGAZINE"
	"5Rnd_127x108_APDS_Mag", // 12.7mm 5Rnd APDS Mag MAGAZINE"
	"5Rnd_127x108_Mag", // 12.7 mm 5Rnd Mag MAGAZINE"
	"6Rnd_45ACP_Cylinder", // .45 ACP 6Rnd Cylinder MAGAZINE"
	"6Rnd_GreenSignal_F", // 6Rnd Signal Cylinder (Green) MAGAZINE"
	"6Rnd_RedSignal_F", // 6Rnd Signal Cylinder (Red) MAGAZINE"
	"7Rnd_408_Mag", // .408 7Rnd LRR Mag MAGAZINE"
	"9Rnd_45ACP_Mag", // .45 ACP 9Rnd Mag MAGAZINE"
	"FlareGreen_F", // Flare (Green) MAGAZINE"
	"FlareRed_F", // Flare (Red) MAGAZINE"
	"FlareWhite_F", // Flare (White) MAGAZINE"
	"FlareYellow_F", // Flare (Yellow) MAGAZINE"
	"Laserbatteries", // Designator Batteries MAGAZINE"
	"NLAW_F", // PCML Missile MAGAZINE"
	"RPG32_F", // RPG-42 Rocket MAGAZINE"
	"RPG32_HE_F", // RPG-42 HE Rocket MAGAZINE"
	"RPG7_F", // PG-7VM HEAT Grenade MAGAZINE"
	"Titan_AA", // Titan AA Missile MAGAZINE"
	"Titan_AP", // Titan AP Missile MAGAZINE"
	"Titan_AT", // Titan AT Missile MAGAZINE"
	"UGL_FlareCIR_F", // Flare Round (IR) MAGAZINE"
	"UGL_FlareGreen_F", // Flare Round (Green) MAGAZINE"
	"UGL_FlareRed_F", // Flare Round (Red) MAGAZINE"
	"UGL_FlareWhite_F", // Flare Round (White) MAGAZINE"
	"UGL_FlareYellow_F" // Flare Round (Yellow) MAGAZINE"
	*/
];

_throwables =
[
	"CUP_HandGrenade_M67", // RGO Grenade MAGAZINE"
	"CUP_HandGrenade_L109A1_HE", // RGO Grenade MAGAZINE"
	"CUP_HandGrenade_L109A2_HE", // IR Grenade [AAF] MAGAZINE"
	"CUP_HandGrenade_RGD5", // RGN Grenade MAGAZINE"
	"CUP_HandGrenade_RGO", // RGN Grenade MAGAZINE"
	
	"B_IR_Grenade", // IR Grenade [NATO] MAGAZINE"
	//"HandGrenade", // RGO Grenade MAGAZINE"
	//"HandGrenade", // RGO Grenade MAGAZINE"
	"I_IR_Grenade", // IR Grenade [AAF] MAGAZINE"
	//"MiniGrenade", // RGN Grenade MAGAZINE"
	//"MiniGrenade", // RGN Grenade MAGAZINE"
	"O_IR_Grenade", // IR Grenade [CSAT] MAGAZINE"
	// "SmokeShell", // Smoke Grenade (White) MAGAZINE"
	"SmokeShellBlue", // Smoke Grenade (Blue) MAGAZINE"
	"SmokeShellGreen", // Smoke Grenade (Green) MAGAZINE"
	// "SmokeShellOrange", // Smoke Grenade (Orange) MAGAZINE"
	// "SmokeShellPurple", // Smoke Grenade (Purple) MAGAZINE"
	"SmokeShellRed", // Smoke Grenade (Red) MAGAZINE"
	// "SmokeShellYellow" // Smoke Grenade (Yellow) MAGAZINE"
	"Chemlight_blue", // Chemlight (Blue) MAGAZINE"
	"Chemlight_green", // Chemlight (Green) MAGAZINE"
	"Chemlight_red" // Chemlight (Red) MAGAZINE"
	// "Chemlight_yellow", // Chemlight (Yellow) MAGAZINE"
];

_muzzles =
[
	"muzzle_snds_L", 
	"CUP_muzzle_snds_M9", 
	"muzzle_snds_acp", 
	"CUP_muzzle_snds_MicroUzi", 
	"CUP_hgun_PB6P9", 
	"muzzle_snds_M", 
	"muzzle_snds_B", 
	"CUP_muzzle_snds_G36_black", 
	"CUP_muzzle_snds_G36_desert", 
	"CUP_muzzle_snds_L85", 
	"CUP_muzzle_snds_M110", 
	"CUP_muzzle_snds_Mk12", 
	"CUP_muzzle_snds_M16_camo", 
	"CUP_muzzle_snds_SCAR_L", 
	"CUP_muzzle_snds_SCAR_H", 
	"CUP_muzzle_Bizon", 
	"CUP_muzzle_snds_AWM",
	"CUP_muzzle_PBS4"
	
/*
	"muzzle_snds_338_black", // Sound Suppressor (.338, Black) MUZZLE"
	"muzzle_snds_338_green", // Sound Suppressor (.338, Green) MUZZLE"
	"muzzle_snds_338_sand", // Sound Suppressor (.338, Sand) MUZZLE"
	"muzzle_snds_58_blk_F", // Stealth Sound Suppressor (5.8 mm, Black) MUZZLE"
	"muzzle_snds_58_ghex_F", // Stealth Sound Suppressor (5.8 mm, Green Hex) MUZZLE"
	"muzzle_snds_58_hex_F", // Sound Suppressor (5.8 mm, Hex) MUZZLE"
	"muzzle_snds_65_TI_blk_F", // Stealth Sound Suppressor (6.5 mm, Black) MUZZLE"
	"muzzle_snds_65_TI_ghex_F", // Stealth Sound Suppressor (6.5 mm, Green Hex) MUZZLE"
	"muzzle_snds_65_TI_hex_F", // Stealth Sound Suppressor (6.5 mm, Hex) MUZZLE"
	"muzzle_snds_93mmg", // Sound Suppressor (9.3mm, Black) MUZZLE"
	"muzzle_snds_93mmg_tan", // Sound Suppressor (9.3mm, Tan) MUZZLE"
	"muzzle_snds_acp", // Sound Suppressor (.45 ACP) MUZZLE"
	"muzzle_snds_B", // Sound Suppressor (7.62 mm) MUZZLE"
	"muzzle_snds_B_khk_F", // Sound Suppressor (7.62 mm, Khaki) MUZZLE"
	"muzzle_snds_B_snd_F", // Sound Suppressor (7.62 mm, Sand) MUZZLE"
	"muzzle_snds_H", // Sound Suppressor (6.5 mm) MUZZLE"
	"muzzle_snds_H_khk_F", // Sound Suppressor (6.5 mm, Khaki) MUZZLE"
	"muzzle_snds_H_snd_F", // Sound Suppressor (6.5 mm, Sand) MUZZLE"
	"muzzle_snds_L", // Sound Suppressor (9 mm) MUZZLE"
	"muzzle_snds_M", // Sound Suppressor (5.56 mm) MUZZLE"
	"muzzle_snds_m_khk_F", // Sound Suppressor (5.56 mm, Khaki) MUZZLE"
	"muzzle_snds_m_snd_F" // Sound Suppressor (5.56 mm, Sand) MUZZLE"
	*/
];

_optics =
[
	"CUP_optic_HoloBlack", // ACO (Red) OPTIC"
	"CUP_optic_HoloWdl", // ACO (Green) OPTIC"
	"CUP_optic_HoloDesert", // ACO SMG (Green) OPTIC"
	"CUP_optic_TrijiconRx01_black", // ACO SMG (Red) OPTIC"
	"CUP_optic_TrijiconRx01_desert", // AMS (Black) OPTIC"
	"CUP_optic_CompM2_Black", // AMS (Khaki) OPTIC"
	"CUP_optic_CompM2_Woodland", // AMS (Sand) OPTIC"
	"CUP_optic_CompM2_Desert", // ARCO OPTIC"
	"CUP_optic_RCO", // ARCO (Black) OPTIC"
	"CUP_optic_RCO_desert", // ARCO (Green Hex) OPTIC",
	"CUP_optic_ACOG", // DMS OPTIC"
	"CUP_optic_Elcan_reflex", // DMS (Green Hex) OPTIC"
	"CUP_optic_SB_11_4x20_PM", // ERCO (Black) OPTIC"
	"CUP_optic_LeupoldMk4_MRT_tan", // ERCO (Khaki) OPTIC"
	"CUP_optic_SUSAT", // ERCO (Sand) OPTIC"
	"CUP_optic_Leupold_VX3", // RCO OPTIC"
	"CUP_optic_LeupoldM3LR", // RCO (Khaki) OPTIC"
	"CUP_optic_LeupoldMk4_10x40_LRT_Desert", // Mk17 Holosight OPTIC"
	"CUP_optic_LeupoldMk4_10x40_LRT_Woodland", // Mk17 Holosight (Black) OPTIC"
	"CUP_optic_SB_3_12x50_PMII", // Mk17 Holosight (Khaki) OPTIC"
	"CUP_optic_MAAWS_Scope", // Mk17 Holosight SMG OPTIC"
	"CUP_optic_SMAW_Scope", // Mk17 Holosight SMG (Black) OPTIC"
	
	"CUP_optic_Kobra", // Kahlia (Black) OPTIC"
	"CUP_optic_PSO_1", // Kahlia (Hex) OPTIC"
	"CUP_optic_PSO_3", // Kahlia (Old) OPTIC"
	"CUP_optic_PechenegScope", // Kahlia (Tan) OPTIC"
	"CUP_optic_PGO7V", // LRPS OPTIC"
	"CUP_optic_PGO7V2", // LRPS (Green Hex) OPTIC"
	"CUP_optic_PGO7V3" // LRPS (Tropic) OPTIC"
	//"optic_MRCO", // MRCO OPTIC"
	//"optic_MRD", // MRD OPTIC"
	//"optic_Nightstalker", // Nightstalker OPTIC"
	//"optic_NVS", // NVS OPTIC"
	//"optic_SOS", // MOS OPTIC"
	//"optic_SOS_khk_F", // MOS (Khaki) OPTIC"
	//"optic_tws", // TWS OPTIC"
	//"optic_tws_mg", // TWS MG OPTIC"
	//"optic_Yorris" // Yorris J2 OPTIC"
];

_primaryWeapons =
[
	"CUP_sgun_Saiga12K", 
	"CUP_sgun_M1014", 
	"CUP_sgun_AA12", 
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
	"CUP_arifle_M16A4_GL", 
	"CUP_arifle_M4A1_black", 
	"CUP_arifle_M4A1_camo", 
	"CUP_arifle_M4A1_desert", 
	"CUP_arifle_M4A1_BUIS_GL", 
	"CUP_arifle_M4A1_BUIS_camo_GL", 
	"CUP_arifle_M4A1_BUIS_desert_GL", 
	"CUP_arifle_M4A3_desert", 
	"CUP_arifle_Mk16_CQC", 
	"CUP_arifle_Mk16_CQC_EGLM", 
	"CUP_arifle_Mk16_STD", 
	"CUP_arifle_Mk16_STD_EGLM", 
	"CUP_arifle_Mk16_SV", 
	"CUP_arifle_Mk17_CQC", 
	"CUP_arifle_Mk17_CQC_EGLM", 
	"CUP_arifle_Mk17_STD", 
	"CUP_arifle_Mk17_STD_EGLM", 
	"CUP_arifle_Mk20", 
	"CUP_arifle_G36C", 
	"CUP_arifle_G36C_camo", 
	"CUP_arifle_FNFAL_railed", 
	"CUP_arifle_L85A2", 
	"CUP_arifle_L85A2_GL", 
	"CUP_arifle_Sa58RIS1", 
	"CUP_arifle_Sa58RIS1_des", 
	"CUP_arifle_Sa58RIS2", 
	"CUP_arifle_Sa58RIS2_camo", 
	"CUP_arifle_Sa58RIS2_gl", 
	"CUP_srifle_CZ550", 
	"CUP_srifle_Mk12SPR", 
	"CUP_srifle_LeeEnfield_rail", 
	"CUP_srifle_M14_DMR", 
	"CUP_srifle_M110", 
	"CUP_srifle_L129A1", 
	"CUP_srifle_G22_des", 
	"CUP_srifle_M24_des", 
	"CUP_srifle_M24_wdl", 
	"CUP_srifle_M40A3", 
	"CUP_srifle_CZ750", 
	"CUP_srifle_AWM_des", 
	"CUP_srifle_AWM_wdl", 
	"CUP_srifle_M107_Base", 
	"CUP_srifle_AS50", 
	"CUP_srifle_VSSVintorez", 
	"CUP_srifle_SVD", 
	"CUP_srifle_SVD_des", 
	"CUP_srifle_ksvk", 
	"CUP_lmg_M240", 
	"CUP_lmg_m249_pip2", 
	"CUP_lmg_m249_pip1", 
	"CUP_lmg_Mk48_des", 
	"CUP_lmg_Mk48_wdl", 
	"CUP_lmg_M60E4", 
	"CUP_lmg_Pecheneg", 
	"CUP_arifle_RPK74_45", 
	"CUP_arifle_RPK74M", 
	"CUP_arifle_RPK74", 
	"CUP_lmg_L110A1", 
	"CUP_lmg_minimi_railed"

	/*
	"arifle_AK12_F", // AK-12 7.62 mm PRIMARYWEAPON"
	"arifle_AK12_GL_F", // AK-12 GL 7.62 mm PRIMARYWEAPON"
	"arifle_AKM_F", // AKM 7.62 mm PRIMARYWEAPON"
	"arifle_AKS_F", // AKS-74U 5.45 mm PRIMARYWEAPON"
	"arifle_ARX_blk_F", // Type 115 6.5 mm (Black) PRIMARYWEAPON"
	"arifle_ARX_ghex_F", // Type 115 6.5 mm (Green Hex) PRIMARYWEAPON"
	"arifle_ARX_hex_F", // Type 115 6.5 mm (Hex) PRIMARYWEAPON"
	"arifle_CTARS_blk_F", // CAR-95-1 5.8mm (Black) PRIMARYWEAPON"
	"arifle_CTARS_blk_Pointer_F", // CAR-95-1 5.8mm (Black) PRIMARYWEAPON"
	"arifle_CTARS_ghex_F", // CAR-95-1 5.8mm (Green Hex) PRIMARYWEAPON"
	"arifle_CTARS_hex_F", // CAR-95-1 5.8mm (Hex) PRIMARYWEAPON"
	"arifle_CTAR_blk_ACO_F", // CAR-95 5.8 mm (Black) PRIMARYWEAPON"
	"arifle_CTAR_blk_ACO_Pointer_F", // CAR-95 5.8 mm (Black) PRIMARYWEAPON"
	"arifle_CTAR_blk_ACO_Pointer_Snds_F", // CAR-95 5.8 mm (Black) PRIMARYWEAPON"
	"arifle_CTAR_blk_ARCO_F", // CAR-95 5.8 mm (Black) PRIMARYWEAPON"
	"arifle_CTAR_blk_ARCO_Pointer_F", // CAR-95 5.8 mm (Black) PRIMARYWEAPON"
	"arifle_CTAR_blk_ARCO_Pointer_Snds_F", // CAR-95 5.8 mm (Black) PRIMARYWEAPON"
	"arifle_CTAR_blk_F", // CAR-95 5.8 mm (Black) PRIMARYWEAPON"
	"arifle_CTAR_blk_Pointer_F", // CAR-95 5.8 mm (Black) PRIMARYWEAPON"
	"arifle_CTAR_ghex_F", // CAR-95 5.8 mm (Green Hex) PRIMARYWEAPON"
	"arifle_CTAR_GL_blk_ACO_F", // CAR-95 GL 5.8 mm (Black) PRIMARYWEAPON"
	"arifle_CTAR_GL_blk_ACO_Pointer_Snds_F", // CAR-95 GL 5.8 mm (Black) PRIMARYWEAPON"
	"arifle_CTAR_GL_blk_F", // CAR-95 GL 5.8 mm (Black) PRIMARYWEAPON"
	"arifle_CTAR_GL_ghex_F", // CAR-95 GL 5.8 mm (Green Hex) PRIMARYWEAPON"
	"arifle_CTAR_GL_hex_F", // CAR-95 GL 5.8 mm (Hex) PRIMARYWEAPON"
	"arifle_CTAR_hex_F", // CAR-95 5.8 mm (Hex) PRIMARYWEAPON"
	"arifle_Katiba_ACO_F", // Katiba 6.5 mm PRIMARYWEAPON"
	"arifle_Katiba_ACO_pointer_F", // Katiba 6.5 mm PRIMARYWEAPON"
	"arifle_Katiba_ACO_pointer_snds_F", // Katiba 6.5 mm PRIMARYWEAPON"
	"arifle_Katiba_ARCO_F", // Katiba 6.5 mm PRIMARYWEAPON"
	"arifle_Katiba_ARCO_pointer_F", // Katiba 6.5 mm PRIMARYWEAPON"
	"arifle_Katiba_ARCO_pointer_snds_F", // Katiba 6.5 mm PRIMARYWEAPON"
	"arifle_Katiba_C_ACO_F", // Katiba Carbine 6.5 mm PRIMARYWEAPON"
	"arifle_Katiba_C_ACO_pointer_F", // Katiba Carbine 6.5 mm PRIMARYWEAPON"
	"arifle_Katiba_C_ACO_pointer_snds_F", // Katiba Carbine 6.5 mm PRIMARYWEAPON"
	"arifle_Katiba_C_F", // Katiba Carbine 6.5 mm PRIMARYWEAPON"
	"arifle_Katiba_F", // Katiba 6.5 mm PRIMARYWEAPON"
	"arifle_Katiba_GL_ACO_F", // Katiba GL 6.5 mm PRIMARYWEAPON"
	"arifle_Katiba_GL_ACO_pointer_F", // Katiba GL 6.5 mm PRIMARYWEAPON"
	"arifle_Katiba_GL_ACO_pointer_snds_F", // Katiba GL 6.5 mm PRIMARYWEAPON"
	"arifle_Katiba_GL_ARCO_pointer_F", // Katiba GL 6.5 mm PRIMARYWEAPON"
	"arifle_Katiba_GL_F", // Katiba GL 6.5 mm PRIMARYWEAPON"
	"arifle_Katiba_GL_Nstalker_pointer_F", // Katiba GL 6.5 mm PRIMARYWEAPON"
	"arifle_Katiba_pointer_F", // Katiba 6.5 mm PRIMARYWEAPON"
	"arifle_Mk20C_ACO_F", // Mk20C 5.56 mm (Camo) PRIMARYWEAPON"
	"arifle_Mk20C_ACO_pointer_F", // Mk20C 5.56 mm (Camo) PRIMARYWEAPON"
	"arifle_Mk20C_F", // Mk20C 5.56 mm (Camo) PRIMARYWEAPON"
	"arifle_Mk20C_plain_F", // Mk20C 5.56 mm PRIMARYWEAPON"
	"arifle_Mk20_ACO_F", // Mk20 5.56 mm (Camo) PRIMARYWEAPON"
	"arifle_Mk20_ACO_pointer_F", // Mk20 5.56 mm (Camo) PRIMARYWEAPON"
	"arifle_Mk20_F", // Mk20 5.56 mm (Camo) PRIMARYWEAPON"
	"arifle_Mk20_GL_ACO_F", // Mk20 EGLM 5.56 mm (Camo) PRIMARYWEAPON"
	"arifle_Mk20_GL_F", // Mk20 EGLM 5.56 mm (Camo) PRIMARYWEAPON"
	"arifle_Mk20_GL_MRCO_pointer_F", // Mk20 EGLM 5.56 mm (Camo) PRIMARYWEAPON"
	"arifle_Mk20_GL_plain_F", // Mk20 EGLM 5.56 mm PRIMARYWEAPON"
	"arifle_Mk20_Holo_F", // Mk20 5.56 mm (Camo) PRIMARYWEAPON"
	"arifle_Mk20_MRCO_F", // Mk20 5.56 mm (Camo) PRIMARYWEAPON"
	"arifle_Mk20_MRCO_plain_F", // Mk20 5.56 mm PRIMARYWEAPON"
	"arifle_Mk20_MRCO_pointer_F", // Mk20 5.56 mm (Camo) PRIMARYWEAPON"
	"arifle_Mk20_plain_F", // Mk20 5.56 mm PRIMARYWEAPON"
	"arifle_Mk20_pointer_F", // Mk20 5.56 mm (Camo) PRIMARYWEAPON"
	"arifle_MXC_ACO_F", // MXC 6.5 mm PRIMARYWEAPON"
	"arifle_MXC_ACO_pointer_F", // MXC 6.5 mm PRIMARYWEAPON"
	"arifle_MXC_ACO_pointer_snds_F", // MXC 6.5 mm PRIMARYWEAPON"
	"arifle_MXC_Black_F", // MXC 6.5 mm (Black) PRIMARYWEAPON"
	"arifle_MXC_F", // MXC 6.5 mm PRIMARYWEAPON"
	"arifle_MXC_Holo_F", // MXC 6.5 mm PRIMARYWEAPON"
	"arifle_MXC_Holo_pointer_F", // MXC 6.5 mm PRIMARYWEAPON"
	"arifle_MXC_Holo_pointer_snds_F", // MXC 6.5 mm PRIMARYWEAPON"
	"arifle_MXC_khk_ACO_F", // MXC 6.5 mm (Khaki) PRIMARYWEAPON"
	"arifle_MXC_khk_ACO_Pointer_Snds_F", // MXC 6.5 mm (Khaki) PRIMARYWEAPON"
	"arifle_MXC_khk_F", // MXC 6.5 mm (Khaki) PRIMARYWEAPON"
	"arifle_MXC_khk_Holo_Pointer_F", // MXC 6.5 mm (Khaki) PRIMARYWEAPON"
	"arifle_MXC_SOS_point_snds_F", // MXC 6.5 mm PRIMARYWEAPON"
	"arifle_MXM_Black_F", // MXM 6.5 mm (Black) PRIMARYWEAPON"
	"arifle_MXM_DMS_F", // MXM 6.5 mm PRIMARYWEAPON"
	"arifle_MXM_DMS_LP_BI_snds_F", // MXM 6.5 mm PRIMARYWEAPON"
	"arifle_MXM_F", // MXM 6.5 mm PRIMARYWEAPON"
	"arifle_MXM_Hamr_LP_BI_F", // MXM 6.5 mm PRIMARYWEAPON"
	"arifle_MXM_Hamr_pointer_F", // MXM 6.5 mm PRIMARYWEAPON"
	"arifle_MXM_khk_F", // MXM 6.5 mm (Khaki) PRIMARYWEAPON"
	"arifle_MXM_khk_MOS_Pointer_Bipod_F", // MXM 6.5 mm (Khaki) PRIMARYWEAPON"
	"arifle_MXM_RCO_pointer_snds_F", // MXM 6.5 mm PRIMARYWEAPON"
	"arifle_MXM_SOS_pointer_F", // MXM 6.5 mm PRIMARYWEAPON"
	"arifle_MX_ACO_F", // MX 6.5 mm PRIMARYWEAPON"
	"arifle_MX_ACO_pointer_F", // MX 6.5 mm PRIMARYWEAPON"
	"arifle_MX_ACO_pointer_snds_F", // MX 6.5 mm PRIMARYWEAPON"
	"arifle_MX_Black_F", // MX 6.5 mm (Black) PRIMARYWEAPON"
	"arifle_MX_Black_Hamr_pointer_F", // MX 6.5 mm (Black) PRIMARYWEAPON"
	"arifle_MX_F", // MX 6.5 mm PRIMARYWEAPON"
	"arifle_MX_GL_ACO_F", // MX 3GL 6.5 mm PRIMARYWEAPON"
	"arifle_MX_GL_ACO_pointer_F", // MX 3GL 6.5 mm PRIMARYWEAPON"
	"arifle_MX_GL_Black_F", // MX 3GL 6.5 mm (Black) PRIMARYWEAPON"
	"arifle_MX_GL_Black_Hamr_pointer_F", // MX 3GL 6.5 mm (Black) PRIMARYWEAPON"
	"arifle_MX_GL_F", // MX 3GL 6.5 mm PRIMARYWEAPON"
	"arifle_MX_GL_Hamr_pointer_F", // MX 3GL 6.5 mm PRIMARYWEAPON"
	"arifle_MX_GL_Holo_pointer_snds_F", // MX 3GL 6.5 mm PRIMARYWEAPON"
	"arifle_MX_GL_khk_ACO_F", // MX 3GL 6.5 mm (Khaki) PRIMARYWEAPON"
	"arifle_MX_GL_khk_F", // MX 3GL 6.5 mm (Khaki) PRIMARYWEAPON"
	"arifle_MX_GL_khk_Hamr_Pointer_F", // MX 3GL 6.5 mm (Khaki) PRIMARYWEAPON"
	"arifle_MX_GL_khk_Holo_Pointer_Snds_F", // MX 3GL 6.5 mm (Khaki) PRIMARYWEAPON"
	"arifle_MX_Hamr_pointer_F", // MX 6.5 mm PRIMARYWEAPON"
	"arifle_MX_Holo_pointer_F", // MX 6.5 mm PRIMARYWEAPON"
	"arifle_MX_khk_ACO_Pointer_F", // MX 6.5 mm (Khaki) PRIMARYWEAPON"
	"arifle_MX_khk_ACO_Pointer_Snds_F", // MX 6.5 mm (Khaki) PRIMARYWEAPON"
	"arifle_MX_khk_F", // MX 6.5 mm (Khaki) PRIMARYWEAPON"
	"arifle_MX_khk_Hamr_Pointer_F", // MX 6.5 mm (Khaki) PRIMARYWEAPON"
	"arifle_MX_khk_Hamr_Pointer_Snds_F", // MX 6.5 mm (Khaki) PRIMARYWEAPON"
	"arifle_MX_khk_Holo_Pointer_F", // MX 6.5 mm (Khaki) PRIMARYWEAPON"
	"arifle_MX_khk_Pointer_F", // MX 6.5 mm (Khaki) PRIMARYWEAPON"
	"arifle_MX_pointer_F", // MX 6.5 mm PRIMARYWEAPON"
	"arifle_MX_RCO_pointer_snds_F", // MX 6.5 mm PRIMARYWEAPON"
	"arifle_MX_SW_Black_F", // MX SW 6.5 mm (Black) PRIMARYWEAPON"
	"arifle_MX_SW_Black_Hamr_pointer_F", // MX SW 6.5 mm (Black) PRIMARYWEAPON"
	"arifle_MX_SW_F", // MX SW 6.5 mm PRIMARYWEAPON"
	"arifle_MX_SW_Hamr_pointer_F", // MX SW 6.5 mm PRIMARYWEAPON"
	"arifle_MX_SW_khk_F", // MX SW 6.5 mm (Khaki) PRIMARYWEAPON"
	"arifle_MX_SW_khk_Pointer_F", // MX SW 6.5 mm (Khaki) PRIMARYWEAPON"
	"arifle_MX_SW_pointer_F", // MX SW 6.5 mm PRIMARYWEAPON"
	"arifle_SDAR_F", // SDAR 5.56 mm PRIMARYWEAPON"
	"arifle_SPAR_01_blk_F", // SPAR-16 5.56 mm (Black) PRIMARYWEAPON"
	"arifle_SPAR_01_GL_blk_F", // SPAR-16 GL 5.56 mm (Black) PRIMARYWEAPON"
	"arifle_SPAR_01_GL_khk_F", // SPAR-16 GL 5.56 mm (Khaki) PRIMARYWEAPON"
	"arifle_SPAR_01_GL_snd_F", // SPAR-16 GL 5.56 mm (Sand) PRIMARYWEAPON"
	"arifle_SPAR_01_khk_F", // SPAR-16 5.56 mm (Khaki) PRIMARYWEAPON"
	"arifle_SPAR_01_snd_F", // SPAR-16 5.56 mm (Sand) PRIMARYWEAPON"
	"arifle_SPAR_02_blk_F", // SPAR-16S 5.56 mm (Black) PRIMARYWEAPON"
	"arifle_SPAR_02_khk_F", // SPAR-16S 5.56 mm (Khaki) PRIMARYWEAPON"
	"arifle_SPAR_02_snd_F", // SPAR-16S 5.56 mm (Sand) PRIMARYWEAPON"
	"arifle_SPAR_03_blk_F", // SPAR-17 7.62 mm (Black) PRIMARYWEAPON"
	"arifle_SPAR_03_khk_F", // SPAR-17 7.62 mm (Khaki) PRIMARYWEAPON"
	"arifle_SPAR_03_snd_F", // SPAR-17 7.62 mm (Sand) PRIMARYWEAPON"
	"arifle_TRG20_ACO_F", // TRG-20 5.56 mm PRIMARYWEAPON"
	"arifle_TRG20_ACO_Flash_F", // TRG-20 5.56 mm PRIMARYWEAPON"
	"arifle_TRG20_ACO_pointer_F", // TRG-20 5.56 mm PRIMARYWEAPON"
	"arifle_TRG20_F", // TRG-20 5.56 mm PRIMARYWEAPON"
	"arifle_TRG20_Holo_F", // TRG-20 5.56 mm PRIMARYWEAPON"
	"arifle_TRG21_ACO_pointer_F", // TRG-21 5.56 mm PRIMARYWEAPON"
	"arifle_TRG21_ARCO_pointer_F", // TRG-21 5.56 mm PRIMARYWEAPON"
	"arifle_TRG21_F", // TRG-21 5.56 mm PRIMARYWEAPON"
	"arifle_TRG21_GL_ACO_pointer_F", // TRG-21 EGLM 5.56 mm PRIMARYWEAPON"
	"arifle_TRG21_GL_F", // TRG-21 EGLM 5.56 mm PRIMARYWEAPON"
	"arifle_TRG21_GL_MRCO_F", // TRG-21 EGLM 5.56 mm PRIMARYWEAPON"
	"arifle_TRG21_MRCO_F", // TRG-21 5.56 mm PRIMARYWEAPON"
	"hgun_PDW2000_F", // PDW2000 9 mm PRIMARYWEAPON"
	"hgun_PDW2000_Holo_F", // PDW2000 9 mm PRIMARYWEAPON"
	"hgun_PDW2000_Holo_snds_F", // PDW2000 9 mm PRIMARYWEAPON"
	"hgun_PDW2000_snds_F", // PDW2000 9 mm PRIMARYWEAPON"
	"LMG_03_F", // LIM-85 5.56 mm PRIMARYWEAPON"
	"LMG_Mk200_BI_F", // Mk200 6.5 mm PRIMARYWEAPON"
	"LMG_Mk200_F", // Mk200 6.5 mm PRIMARYWEAPON"
	"LMG_Mk200_LP_BI_F", // Mk200 6.5 mm PRIMARYWEAPON"
	"LMG_Mk200_MRCO_F", // Mk200 6.5 mm PRIMARYWEAPON"
	"LMG_Mk200_pointer_F", // Mk200 6.5 mm PRIMARYWEAPON"
	"LMG_Zafir_ARCO_F", // Zafir 7.62 mm PRIMARYWEAPON"
	"LMG_Zafir_F", // Zafir 7.62 mm PRIMARYWEAPON"
	"LMG_Zafir_pointer_F", // Zafir 7.62 mm PRIMARYWEAPON"
	"MMG_01_hex_ARCO_LP_F", // Navid 9.3 mm (Hex) PRIMARYWEAPON"
	"MMG_01_hex_F", // Navid 9.3 mm (Hex) PRIMARYWEAPON"
	"MMG_01_tan_F", // Navid 9.3 mm (Tan) PRIMARYWEAPON"
	"MMG_02_black_F", // SPMG .338 (Black) PRIMARYWEAPON"
	"MMG_02_black_RCO_BI_F", // SPMG .338 (Black) PRIMARYWEAPON"
	"MMG_02_camo_F", // SPMG .338 (MTP) PRIMARYWEAPON"
	"MMG_02_sand_F", // SPMG .338 (Sand) PRIMARYWEAPON"
	"MMG_02_sand_RCO_LP_F", // SPMG .338 (Sand) PRIMARYWEAPON"
	"SMG_01_ACO_F", // Vermin SMG .45 ACP PRIMARYWEAPON"
	"SMG_01_F", // Vermin SMG .45 ACP PRIMARYWEAPON"
	"SMG_01_Holo_F", // Vermin SMG .45 ACP PRIMARYWEAPON"
	"SMG_01_Holo_pointer_snds_F", // Vermin SMG .45 ACP PRIMARYWEAPON"
	"SMG_02_ACO_F", // Sting 9 mm PRIMARYWEAPON"
	"SMG_02_ARCO_pointg_F", // Sting 9 mm PRIMARYWEAPON"
	"SMG_02_F", // Sting 9 mm PRIMARYWEAPON"
	"SMG_05_F", // Protector 9 mm PRIMARYWEAPON"
	"srifle_DMR_01_ACO_F", // Rahim 7.62 mm PRIMARYWEAPON"
	"srifle_DMR_01_ARCO_F", // Rahim 7.62 mm PRIMARYWEAPON"
	"srifle_DMR_01_DMS_BI_F", // Rahim 7.62 mm PRIMARYWEAPON"
	"srifle_DMR_01_DMS_F", // Rahim 7.62 mm PRIMARYWEAPON"
	"srifle_DMR_01_DMS_snds_BI_F", // Rahim 7.62 mm PRIMARYWEAPON"
	"srifle_DMR_01_DMS_snds_F", // Rahim 7.62 mm PRIMARYWEAPON"
	"srifle_DMR_01_F", // Rahim 7.62 mm PRIMARYWEAPON"
	"srifle_DMR_01_MRCO_F", // Rahim 7.62 mm PRIMARYWEAPON"
	"srifle_DMR_01_SOS_F", // Rahim 7.62 mm PRIMARYWEAPON"
	"srifle_DMR_02_ACO_F", // MAR-10 .338 (Black) PRIMARYWEAPON"
	"srifle_DMR_02_ARCO_F", // MAR-10 .338 (Black) PRIMARYWEAPON"
	"srifle_DMR_02_camo_AMS_LP_F", // MAR-10 .338 (Camo) PRIMARYWEAPON"
	"srifle_DMR_02_camo_F", // MAR-10 .338 (Camo) PRIMARYWEAPON"
	"srifle_DMR_02_DMS_F", // MAR-10 .338 (Black) PRIMARYWEAPON"
	"srifle_DMR_02_F", // MAR-10 .338 (Black) PRIMARYWEAPON"
	"srifle_DMR_02_MRCO_F", // MAR-10 .338 (Black) PRIMARYWEAPON"
	"srifle_DMR_02_sniper_AMS_LP_S_F", // MAR-10 .338 (Sand) PRIMARYWEAPON"
	"srifle_DMR_02_sniper_F", // MAR-10 .338 (Sand) PRIMARYWEAPON"
	"srifle_DMR_02_SOS_F", // MAR-10 .338 (Black) PRIMARYWEAPON"
	"srifle_DMR_03_ACO_F", // Mk-I EMR 7.62 mm (Black) PRIMARYWEAPON"
	"srifle_DMR_03_AMS_F", // Mk-I EMR 7.62 mm (Black) PRIMARYWEAPON"
	"srifle_DMR_03_ARCO_F", // Mk-I EMR 7.62 mm (Black) PRIMARYWEAPON"
	"srifle_DMR_03_DMS_F", // Mk-I EMR 7.62 mm (Black) PRIMARYWEAPON"
	"srifle_DMR_03_DMS_snds_F", // Mk-I EMR 7.62 mm (Black) PRIMARYWEAPON"
	"srifle_DMR_03_F", // Mk-I EMR 7.62 mm (Black) PRIMARYWEAPON"
	"srifle_DMR_03_khaki_F", // Mk-I EMR 7.62 mm (Khaki) PRIMARYWEAPON"
	"srifle_DMR_03_MRCO_F", // Mk-I EMR 7.62 mm (Black) PRIMARYWEAPON"
	"srifle_DMR_03_multicam_F", // Mk-I EMR 7.62 mm (Camo) PRIMARYWEAPON"
	"srifle_DMR_03_SOS_F", // Mk-I EMR 7.62 mm (Black) PRIMARYWEAPON"
	"srifle_DMR_03_tan_AMS_LP_F", // Mk-I EMR 7.62 mm (Sand) PRIMARYWEAPON"
	"srifle_DMR_03_tan_F", // Mk-I EMR 7.62 mm (Sand) PRIMARYWEAPON"
	"srifle_DMR_03_woodland_F", // Mk-I EMR 7.62 mm (Woodland) PRIMARYWEAPON"
	"srifle_DMR_04_ACO_F", // ASP-1 Kir 12.7 mm (Black) PRIMARYWEAPON"
	"srifle_DMR_04_ARCO_F", // ASP-1 Kir 12.7 mm (Black) PRIMARYWEAPON"
	"srifle_DMR_04_DMS_F", // ASP-1 Kir 12.7 mm (Black) PRIMARYWEAPON"
	"srifle_DMR_04_F", // ASP-1 Kir 12.7 mm (Black) PRIMARYWEAPON"
	"srifle_DMR_04_MRCO_F", // ASP-1 Kir 12.7 mm (Black) PRIMARYWEAPON"
	"srifle_DMR_04_NS_LP_F", // ASP-1 Kir 12.7 mm (Black) PRIMARYWEAPON"
	"srifle_DMR_04_SOS_F", // ASP-1 Kir 12.7 mm (Black) PRIMARYWEAPON"
	"srifle_DMR_04_Tan_F", // ASP-1 Kir 12.7 mm (Tan) PRIMARYWEAPON"
	"srifle_DMR_05_ACO_F", // Cyrus 9.3 mm (Black) PRIMARYWEAPON"
	"srifle_DMR_05_ARCO_F", // Cyrus 9.3 mm (Black) PRIMARYWEAPON"
	"srifle_DMR_05_blk_F", // Cyrus 9.3 mm (Black) PRIMARYWEAPON"
	"srifle_DMR_05_DMS_F", // Cyrus 9.3 mm (Black) PRIMARYWEAPON"
	"srifle_DMR_05_DMS_snds_F", // Cyrus 9.3 mm (Black) PRIMARYWEAPON"
	"srifle_DMR_05_hex_F", // Cyrus 9.3 mm (Hex) PRIMARYWEAPON"
	"srifle_DMR_05_KHS_LP_F", // Cyrus 9.3 mm (Black) PRIMARYWEAPON"
	"srifle_DMR_05_MRCO_F", // Cyrus 9.3 mm (Black) PRIMARYWEAPON"
	"srifle_DMR_05_SOS_F", // Cyrus 9.3 mm (Black) PRIMARYWEAPON"
	"srifle_DMR_05_tan_f", // Cyrus 9.3 mm (Tan) PRIMARYWEAPON"
	"srifle_DMR_06_camo_F", // Mk14 7.62 mm (Camo) PRIMARYWEAPON"
	"srifle_DMR_06_camo_khs_F", // Mk14 7.62 mm (Camo) PRIMARYWEAPON"
	"srifle_DMR_06_olive_F", // Mk14 7.62 mm (Olive) PRIMARYWEAPON"
	"srifle_DMR_07_blk_DMS_F", // CMR-76 6.5 mm (Black) PRIMARYWEAPON"
	"srifle_DMR_07_blk_DMS_Snds_F", // CMR-76 6.5 mm (Black) PRIMARYWEAPON"
	"srifle_DMR_07_blk_F", // CMR-76 6.5 mm (Black) PRIMARYWEAPON"
	"srifle_DMR_07_ghex_F", // CMR-76 6.5 mm (Green Hex) PRIMARYWEAPON"
	"srifle_DMR_07_hex_F", // CMR-76 6.5 mm (Hex) PRIMARYWEAPON"
	"srifle_EBR_ACO_F", // Mk18 ABR 7.62 mm PRIMARYWEAPON"
	"srifle_EBR_ARCO_pointer_F", // Mk18 ABR 7.62 mm PRIMARYWEAPON"
	"srifle_EBR_ARCO_pointer_snds_F", // Mk18 ABR 7.62 mm PRIMARYWEAPON"
	"srifle_EBR_DMS_F", // Mk18 ABR 7.62 mm PRIMARYWEAPON"
	"srifle_EBR_DMS_pointer_snds_F", // Mk18 ABR 7.62 mm PRIMARYWEAPON"
	"srifle_EBR_F", // Mk18 ABR 7.62 mm PRIMARYWEAPON"
	"srifle_EBR_Hamr_pointer_F", // Mk18 ABR 7.62 mm PRIMARYWEAPON"
	"srifle_EBR_MRCO_LP_BI_F", // Mk18 ABR 7.62 mm PRIMARYWEAPON"
	"srifle_EBR_MRCO_pointer_F", // Mk18 ABR 7.62 mm PRIMARYWEAPON"
	"srifle_EBR_SOS_F", // Mk18 ABR 7.62 mm PRIMARYWEAPON"
	"srifle_GM6_camo_F", // GM6 Lynx 12.7 mm (Camo) PRIMARYWEAPON"
	"srifle_GM6_camo_LRPS_F", // GM6 Lynx 12.7 mm (Camo) PRIMARYWEAPON"
	"srifle_GM6_camo_SOS_F", // GM6 Lynx 12.7 mm (Camo) PRIMARYWEAPON"
	"srifle_GM6_F", // GM6 Lynx 12.7 mm PRIMARYWEAPON"
	"srifle_GM6_ghex_F", // GM6 Lynx 12.7 mm (Green Hex) PRIMARYWEAPON"
	"srifle_GM6_ghex_LRPS_F", // GM6 Lynx 12.7 mm (Green Hex) PRIMARYWEAPON"
	"srifle_GM6_LRPS_F", // GM6 Lynx 12.7 mm PRIMARYWEAPON"
	"srifle_GM6_SOS_F", // GM6 Lynx 12.7 mm PRIMARYWEAPON"
	"srifle_LRR_camo_F", // M320 LRR .408 (Camo) PRIMARYWEAPON"
	"srifle_LRR_camo_LRPS_F", // M320 LRR .408 (Camo) PRIMARYWEAPON"
	"srifle_LRR_camo_SOS_F", // M320 LRR .408 (Camo) PRIMARYWEAPON"
	"srifle_LRR_F", // M320 LRR .408 PRIMARYWEAPON"
	"srifle_LRR_LRPS_F", // M320 LRR .408 PRIMARYWEAPON"
	"srifle_LRR_SOS_F", // M320 LRR .408 PRIMARYWEAPON"
	"srifle_LRR_tna_F", // M320 LRR .408 (Tropic) PRIMARYWEAPON"
	"srifle_LRR_tna_LRPS_F" // M320 LRR .408 (Tropic) PRIMARYWEAPON"
	*/
];

_secondaryWeapons =
[
	"CUP_hgun_Glock17", // ACP-C2 .45 ACP SECONDARYWEAPON"
	"CUP_hgun_M9", // ACP-C2 .45 ACP SECONDARYWEAPON"
	"CUP_hgun_Colt1911", // P07 9 mm SECONDARYWEAPON"
	"CUP_hgun_PB6P9", // P07 9 mm (Khaki) SECONDARYWEAPON"
	"CUP_hgun_Duty", // P07 9 mm SECONDARYWEAPON"
	"CUP_hgun_Phantom", // PM 9 mm SECONDARYWEAPON"
	"CUP_hgun_Makarov", // 4-five .45 ACP SECONDARYWEAPON"
	"CUP_hgun_MicroUzi", // 4-five .45 ACP SECONDARYWEAPON"
	"CUP_hgun_SA61"
];

_uniforms =
[
	"U_B_Wetsuit", 
	"U_O_Wetsuit", 
	"U_I_Wetsuit", 
	"U_B_GhillieSuit", 
	"U_O_GhillieSuit", 
	"U_I_GhillieSuit", 
	"U_B_T_Sniper_F", 
	"U_O_T_Sniper_F", 
	"U_B_FullGhillie_ard", 
	"U_O_FullGhillie_ard", 
	"U_I_FullGhillie_ard", 
	"U_B_FullGhillie_lsh", 
	"U_O_FullGhillie_lsh", 
	"U_I_FullGhillie_lsh", 
	"U_B_FullGhillie_sard", 
	"U_O_FullGhillie_sard", 
	"U_I_FullGhillie_sard", 
	"U_B_T_FullGhillie_tna_F", 
	"U_O_T_FullGhillie_tna_F", 
	"U_B_CTRG_Soldier_F", 
	"U_O_V_Soldier_Viper_hex_F", 
	"U_O_V_Soldier_Viper_F", 
	"U_B_survival_uniform", 
	"U_B_CombatUniform_mcam", 
	"U_O_OfficerUniform_ocamo", 
	"U_I_CombatUniform", 
	"U_B_CombatUniform_mcam_vest", 
	"U_B_T_Soldier_F", 
	"U_B_CombatUniform_mcam_tshirt", 
	"U_I_G_resistanceLeader_F", 
	"U_I_CombatUniform_shortsleeve", 
	"U_B_CTRG_1", 
	"U_B_CTRG_2", 
	"U_B_CTRG_3", 
	"U_O_CombatUniform_ocamo", 
	"U_O_CombatUniform_oucamo", 
	"U_O_T_Soldier_F", 
	"U_I_OfficerUniform", 
	"U_B_PilotCoveralls", 
	"U_O_PilotCoveralls", 
	"U_I_pilotCoveralls", 
	"U_B_HeliPilotCoveralls", 
	"U_I_HeliPilotCoveralls", 
	"U_BG_Guerilla1_1", 
	"U_BG_Guerilla2_2", 
	"U_BG_Guerilla3_1", 
	"U_BG_Guerrilla_6_1", 
	"U_BG_leader", 
	"U_OG_Guerilla1_1", 
	"U_OG_Guerilla2_2", 
	"U_OG_Guerilla3_1", 
	"U_OG_Guerrilla_6_1", 
	"U_OG_leader", 
	"U_IG_Guerilla1_1", 
	"U_IG_Guerilla2_2", 
	"U_IG_Guerilla3_1", 
	"U_IG_Guerrilla_6_1", 
	"U_IG_leader", 
	"U_B_Protagonist_VR", 
	"U_O_Protagonist_VR", 
	"U_I_Protagonist_VR", 
	"CUP_U_B_USArmy_Base", 
	"CUP_U_B_USArmy_TwoKnee", 
	"CUP_U_B_USArmy_UBACS", 
	"CUP_U_B_USArmy_PilotOverall", 
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

	/*
	"U_BG_Guerilla1_1", // Guerilla Garment UNIFORM"
	"U_BG_Guerilla2_1", // Guerilla Outfit (Plain, Dark) UNIFORM"
	"U_BG_Guerilla2_2", // Guerilla Outfit (Pattern) UNIFORM"
	"U_BG_Guerilla2_3", // Guerilla Outfit (Plain, Light) UNIFORM"
	"U_BG_Guerilla3_1", // Guerilla Smocks UNIFORM"
	"U_BG_Guerrilla_6_1", // Guerilla Apparel UNIFORM"
	"U_BG_leader", // Guerilla Uniform UNIFORM"
	"U_B_CombatUniform_mcam", // Combat Fatigues (MTP) UNIFORM"
	"U_B_CombatUniform_mcam_tshirt", // Combat Fatigues (MTP) (Tee) UNIFORM"
	"U_B_CombatUniform_mcam_vest", // Recon Fatigues (MTP) UNIFORM"
	"U_B_CombatUniform_mcam_worn", // Worn Combat Fatigues (MTP) UNIFORM"
	"U_B_CTRG_1", // CTRG Combat Uniform UNIFORM"
	"U_B_CTRG_2", // CTRG Combat Uniform (Tee) UNIFORM"
	"U_B_CTRG_3", // CTRG Combat Uniform (Rolled-up) UNIFORM"
	"U_B_CTRG_Soldier_2_F", // CTRG Stealth Uniform (Tee) UNIFORM"
	"U_B_CTRG_Soldier_3_F", // CTRG Stealth Uniform (Rolled-up) UNIFORM"
	"U_B_CTRG_Soldier_F", // CTRG Stealth Uniform UNIFORM"
	"U_B_CTRG_Soldier_urb_1_F", // CTRG Urban Uniform UNIFORM"
	"U_B_CTRG_Soldier_urb_2_F", // CTRG Urban Uniform (Tee) UNIFORM"
	"U_B_CTRG_Soldier_urb_3_F", // CTRG Urban Uniform (Rolled-up) UNIFORM"
	"U_B_FullGhillie_ard", // Full Ghillie (Arid) [NATO] UNIFORM"
	"U_B_FullGhillie_lsh", // Full Ghillie (Lush) [NATO] UNIFORM"
	"U_B_FullGhillie_sard", // Full Ghillie (Semi-Arid) [NATO] UNIFORM"
	"U_B_GEN_Commander_F", // Gendarmerie Commander Uniform UNIFORM"
	"U_B_GEN_Soldier_F", // Gendarmerie Uniform UNIFORM"
	"U_B_GhillieSuit", // Ghillie Suit [NATO] UNIFORM"
	"U_B_HeliPilotCoveralls", // Heli Pilot Coveralls [NATO] UNIFORM"
	"U_B_PilotCoveralls", // Pilot Coveralls [NATO] UNIFORM"
	"U_B_Protagonist_VR", // VR Suit [NATO] UNIFORM"
	"U_B_survival_uniform", // Survival Fatigues UNIFORM"
	"U_B_T_FullGhillie_tna_F", // Full Ghillie (Jungle) [NATO] UNIFORM"
	"U_B_T_Sniper_F", // Ghillie Suit (Tropic) [NATO] UNIFORM"
	"U_B_T_Soldier_AR_F", // Combat Fatigues (Tropic, Tee) UNIFORM"
	"U_B_T_Soldier_F", // Combat Fatigues (Tropic) UNIFORM"
	"U_B_T_Soldier_SL_F", // Recon Fatigues (Tropic) UNIFORM"
	"U_B_Wetsuit", // Wetsuit [NATO] UNIFORM"
	// "U_Competitor", // Competitor Suit UNIFORM"
	// "U_C_Driver_1", // Driver Coverall (Fuel) UNIFORM"
	// "U_C_Driver_1_black", // Driver Coverall (Black) UNIFORM"
	// "U_C_Driver_1_blue", // Driver Coverall (Blue) UNIFORM"
	// "U_C_Driver_1_green", // Driver Coverall (Green) UNIFORM"
	// "U_C_Driver_1_orange", // Driver Coverall (Orange) UNIFORM"
	// "U_C_Driver_1_red", // Driver Coverall (Red) UNIFORM"
	// "U_C_Driver_1_white", // Driver Coverall (White) UNIFORM"
	// "U_C_Driver_1_yellow", // Driver Coverall (Yellow) UNIFORM"
	// "U_C_Driver_2", // Driver Coverall (Bluking) UNIFORM"
	// "U_C_Driver_3", // Driver Coverall (Redstone) UNIFORM"
	// "U_C_Driver_4", // Driver Coverall (Vrana) UNIFORM"
	// "U_C_HunterBody_grn", // Hunting Clothes UNIFORM"
	// "U_C_Journalist", // Journalist Clothes UNIFORM"
	// "U_C_Man_casual_1_F", // Casual Clothes (Navy) UNIFORM"
	// "U_C_Man_casual_2_F", // Casual Clothes (Blue) UNIFORM"
	// "U_C_Man_casual_3_F", // Casual Clothes (Green) UNIFORM"
	// "U_C_Man_casual_4_F", // Summer Clothes (Sky) UNIFORM"
	// "U_C_Man_casual_5_F", // Summer Clothes (Yellow) UNIFORM"
	// "U_C_Man_casual_6_F", // Summer Clothes (Red) UNIFORM"
	// "U_C_man_sport_1_F", // Sport Clothes (Beach) UNIFORM"
	// "U_C_man_sport_2_F", // Sport Clothes (Orange) UNIFORM"
	// "U_C_man_sport_3_F", // Sport Clothes (Blue) UNIFORM"
	// "U_C_Poloshirt_blue", // Commoner Clothes (Blue) UNIFORM"
	// "U_C_Poloshirt_burgundy", // Commoner Clothes (Burgundy) UNIFORM"
	// "U_C_Poloshirt_redwhite", // Commoner Clothes (Red-White) UNIFORM"
	// "U_C_Poloshirt_salmon", // Commoner Clothes (Salmon) UNIFORM"
	// "U_C_Poloshirt_stripped", // Commoner Clothes (Striped) UNIFORM"
	// "U_C_Poloshirt_tricolour", // Commoner Clothes (Tricolor) UNIFORM"
	// "U_C_Poor_1", // Worn Clothes UNIFORM"
	// "U_C_Scientist", // Scientist Clothes UNIFORM"
	// "U_C_WorkerCoveralls", // Worker Coveralls UNIFORM"
	"U_I_CombatUniform", // Combat Fatigues [AAF] UNIFORM"
	"U_I_CombatUniform_shortsleeve", // Combat Fatigues [AAF] (Rolled-up) UNIFORM"
	// "U_I_C_Soldier_Bandit_1_F", // Bandit Clothes (Polo Shirt) UNIFORM"
	// "U_I_C_Soldier_Bandit_2_F", // Bandit Clothes (Skull) UNIFORM"
	// "U_I_C_Soldier_Bandit_3_F", // Bandit Clothes (Tee) UNIFORM"
	// "U_I_C_Soldier_Bandit_4_F", // Bandit Clothes (Checkered) UNIFORM"
	// "U_I_C_Soldier_Bandit_5_F", // Bandit Clothes (Tank Top) UNIFORM"
	"U_I_C_Soldier_Camo_F", // Syndikat Uniform UNIFORM"
	"U_I_C_Soldier_Para_1_F", // Paramilitary Garb (Tee) UNIFORM"
	"U_I_C_Soldier_Para_2_F", // Paramilitary Garb (Jacket) UNIFORM"
	"U_I_C_Soldier_Para_3_F", // Paramilitary Garb (Shirt) UNIFORM"
	"U_I_C_Soldier_Para_4_F", // Paramilitary Garb (Tank Top) UNIFORM"
	"U_I_C_Soldier_Para_5_F", // Paramilitary Garb (Shorts) UNIFORM"
	"U_I_FullGhillie_ard", // Full Ghillie (Arid) [AAF] UNIFORM"
	"U_I_FullGhillie_lsh", // Full Ghillie (Lush) [AAF] UNIFORM"
	"U_I_FullGhillie_sard", // Full Ghillie (Semi-Arid) [AAF] UNIFORM"
	"U_I_GhillieSuit", // Ghillie Suit [AAF] UNIFORM"
	"U_I_G_resistanceLeader_F", // Combat Fatigues (Stavrou) UNIFORM"
	// "U_I_G_Story_Protagonist_F", // Worn Combat Fatigues (Kerry) UNIFORM"
	"U_I_HeliPilotCoveralls", // Heli Pilot Coveralls [AAF] UNIFORM"
	"U_I_OfficerUniform", // Combat Fatigues [AAF] (Officer) UNIFORM"
	"U_I_pilotCoveralls", // Pilot Coveralls [AAF] UNIFORM"
	"U_I_Protagonist_VR", // VR Suit [AAF] UNIFORM"
	"U_I_Wetsuit", // Wetsuit [AAF] UNIFORM"
	// "U_Marshal", // Marshal Clothes UNIFORM"
	// "U_OrestesBody", // Jacket and Shorts UNIFORM"
	"U_O_CombatUniform_ocamo", // Fatigues (Hex) [CSAT] UNIFORM"
	"U_O_CombatUniform_oucamo", // Fatigues (Urban) [CSAT] UNIFORM"
	"U_O_FullGhillie_ard", // Full Ghillie (Arid) [CSAT] UNIFORM"
	"U_O_FullGhillie_lsh", // Full Ghillie (Lush) [CSAT] UNIFORM"
	"U_O_FullGhillie_sard", // Full Ghillie (Semi-Arid) [CSAT] UNIFORM"
	"U_O_GhillieSuit", // Ghillie Suit [CSAT] UNIFORM"
	"U_O_OfficerUniform_ocamo", // Officer Fatigues (Hex) UNIFORM"
	"U_O_PilotCoveralls", // Pilot Coveralls [CSAT] UNIFORM"
	"U_O_Protagonist_VR", // VR Suit [CSAT] UNIFORM"
	"U_O_SpecopsUniform_ocamo", // Recon Fatigues (Hex) UNIFORM"
	"U_O_T_FullGhillie_tna_F", // Full Ghillie (Jungle) [CSAT] UNIFORM"
	"U_O_T_Officer_F", // Officer Fatigues (Green Hex) [CSAT] UNIFORM"
	"U_O_T_Sniper_F", // Ghillie Suit (Green Hex) [CSAT] UNIFORM"
	"U_O_T_Soldier_F", // Fatigues (Green Hex) [CSAT] UNIFORM"
	"U_O_V_Soldier_Viper_F", // Special Purpose Suit (Green Hex) UNIFORM"
	"U_O_V_Soldier_Viper_hex_F", // Special Purpose Suit (Hex) UNIFORM"
	"U_O_Wetsuit", // Wetsuit [CSAT] UNIFORM"
	"U_Rangemaster" // Rangemaster Suit UNIFORM"
	*/
];

_vests =
[
	"V_RebreatherB", 
	"V_RebreatherIR", 
	"V_RebreatherIA", 
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


	/*
	"V_BandollierB_blk", // Slash Bandolier (Black) VEST"
	"V_BandollierB_cbr", // Slash Bandolier (Coyote) VEST"
	"V_BandollierB_ghex_F", // Slash Bandolier (Green Hex) VEST"
	"V_BandollierB_khk", // Slash Bandolier (Khaki) VEST"
	"V_BandollierB_oli", // Slash Bandolier (Olive) VEST"
	"V_BandollierB_rgr", // Slash Bandolier (Green) VEST"
	"V_Chestrig_blk", // Chest Rig (Black) VEST"
	"V_Chestrig_khk", // Chest Rig (Khaki) VEST"
	"V_Chestrig_oli", // Chest Rig (Olive) VEST"
	"V_Chestrig_rgr", // Chest Rig (Green) VEST"
	"V_HarnessOGL_brn", // LBV Grenadier Harness VEST"
	"V_HarnessOGL_ghex_F", // LBV Grenadier Harness (Green Hex) VEST"
	"V_HarnessOGL_gry", // LBV Grenadier Harness (Grey) VEST"
	"V_HarnessO_brn", // LBV Harness VEST"
	"V_HarnessO_ghex_F", // LBV Harness (Green Hex) VEST"
	"V_HarnessO_gry", // LBV Harness (Grey) VEST"
	"V_I_G_resistanceLeader_F", // Tactical Vest (Stavrou) VEST"
	"V_PlateCarrier1_blk", // Carrier Lite (Black) VEST"
	"V_PlateCarrier1_rgr", // Carrier Lite (Green) VEST"
	"V_PlateCarrier1_rgr_noflag_F", // Carrier Lite (Green, No Flag) VEST"
	"V_PlateCarrier1_tna_F", // Carrier Lite (Tropic) VEST"
	"V_PlateCarrier2_blk", // Carrier Rig (Black) VEST"
	"V_PlateCarrier2_rgr", // Carrier Rig (Green) VEST"
	"V_PlateCarrier2_rgr_noflag_F", // Carrier Rig (Green, No Flag) VEST"
	"V_PlateCarrier2_tna_F", // Carrier Rig (Tropic) VEST"
	"V_PlateCarrierGL_blk", // Carrier GL Rig (Black) VEST"
	"V_PlateCarrierGL_mtp", // Carrier GL Rig (MTP) VEST"
	"V_PlateCarrierGL_rgr", // Carrier GL Rig (Green) VEST"
	"V_PlateCarrierGL_tna_F", // Carrier GL Rig (Tropic) VEST"
	"V_PlateCarrierH_CTRG", // CTRG Plate Carrier Rig Mk.2 (Heavy) VEST"
	"V_PlateCarrierIA1_dgtl", // GA Carrier Lite (Digi) VEST"
	"V_PlateCarrierIA2_dgtl", // GA Carrier Rig (Digi) VEST"
	"V_PlateCarrierIAGL_dgtl", // GA Carrier GL Rig (Digi) VEST"
	"V_PlateCarrierIAGL_oli", // GA Carrier GL Rig (Olive) VEST"
	"V_PlateCarrierL_CTRG", // CTRG Plate Carrier Rig Mk.1 (Light) VEST"
	"V_PlateCarrierSpec_blk", // Carrier Special Rig (Black) VEST"
	"V_PlateCarrierSpec_mtp", // Carrier Special Rig (MTP) VEST"
	"V_PlateCarrierSpec_rgr", // Carrier Special Rig (Green) VEST"
	"V_PlateCarrierSpec_tna_F", // Carrier Special Rig (Tropic) VEST"
	"V_PlateCarrier_Kerry", // US Plate Carrier Rig (Kerry) VEST"
	// "V_Press_F", // Vest (Press) VEST"
	"V_Rangemaster_belt", // Rangemaster Belt VEST"
	"V_RebreatherB", // Rebreather [NATO] VEST"
	"V_RebreatherIA", // Rebreather [AAF] VEST"
	"V_RebreatherIR", // Rebreather [CSAT] VEST"
	"V_TacChestrig_cbr_F", // Tactical Chest Rig (Coyote) VEST"
	"V_TacChestrig_grn_F", // Tactical Chest Rig (Green) VEST"
	"V_TacChestrig_oli_F", // Tactical Chest Rig (Olive) VEST"
	"V_TacVestIR_blk", // Raven Vest VEST"
	"V_TacVest_blk", // Tactical Vest (Black) VEST"
	// "V_TacVest_blk_POLICE", // Tactical Vest (Police) VEST"
	"V_TacVest_brn", // Tactical Vest (Brown) VEST"
	"V_TacVest_camo", // Tactical Vest (Camo) VEST"
	"V_TacVest_gen_F", // Gendarmerie Vest VEST"
	"V_TacVest_khk", // Tactical Vest (Khaki) VEST"
	"V_TacVest_oli" // Tactical Vest (Olive) VEST"
	*/
];
	
_weaponAccessories =
[
	"CUP_acc_ANPEQ_2", // Flashlight WEAPONLIGHT"
	"CUP_acc_ANPEQ_2_camo", // Flashlight WEAPONLIGHT"
	"CUP_acc_ANPEQ_2_desert", // Flashlight WEAPONLIGHT"
	"CUP_acc_ANPEQ_2_grey", // Flashlight WEAPONLIGHT"
	"CUP_acc_Flashlight", // Flashlight WEAPONLIGHT"
	"CUP_acc_Flashlight_wdl", // Flashlight WEAPONLIGHT"
	"CUP_acc_Flashlight_desert", // Flashlight WEAPONLIGHT"
	"CUP_Mxx_camo", // Flashlight WEAPONLIGHT"
	"CUP_Mxx_camo_half", // Flashlight WEAPONLIGHT"
	"CUP_SVD_camo_g", // Flashlight WEAPONLIGHT"
	"CUP_SVD_camo_d", // Flashlight WEAPONLIGHT"
	"CUP_SVD_camo_g_half", // Flashlight WEAPONLIGHT"
	"CUP_SVD_camo_d_half", // Flashlight WEAPONLIGHT"	
	"acc_flashlight", // Flashlight WEAPONLIGHT"
	"acc_pointer_IR" // IR Laser Pointer WEAPONLIGHT"
];

_mines =
[
	"APERSBoundingMine_Range_Mag", // APERS Bounding Mine MAGAZINE"
	"APERSMine_Range_Mag", // APERS Mine MAGAZINE"
	"APERSTripMine_Wire_Mag", // APERS Tripwire Mine MAGAZINE"
	"ATMine_Range_Mag", // AT Mine MAGAZINE"
	"ClaymoreDirectionalMine_Remote_Mag", // Claymore Charge MAGAZINE"
	"DemoCharge_Remote_Mag", // Explosive Charge MAGAZINE"
	"IEDLandBig_Remote_Mag", // Large IED (Dug-in) MAGAZINE"
	"IEDLandSmall_Remote_Mag", // Small IED (Dug-in) MAGAZINE"
	"IEDUrbanBig_Remote_Mag", // Large IED (Urban) MAGAZINE"
	"IEDUrbanSmall_Remote_Mag", // Small IED (Urban) MAGAZINE"
	"SatchelCharge_Remote_Mag", // Explosive Satchel MAGAZINE"
	"SLAMDirectionalMine_Wire_Mag" // M6 SLAM Mine MAGAZINE"
];

_goggles =
[

	"G_Diving"
	/*
	"G_B_Diving", // Diving Goggles [NATO]
	"G_Balaclava_blk", // Balaclava (Black)
	"G_Balaclava_combat", // Balaclava (Combat Goggles)
	"G_Balaclava_lowprofile", // Balaclava (Low Profile Goggles)
	"G_Balaclava_oli", // Balaclava (Olive)
	"G_Balaclava_TI_blk_F", // Stealth Balaclava (Black)
	"G_Balaclava_TI_G_blk_F", // Stealth Balaclava (Black, Goggles)
	"G_Balaclava_TI_G_tna_F", // Stealth Balaclava (Green, Goggles)
	"G_Balaclava_TI_tna_F", // Stealth Balaclava (Green)
	"G_Combat", // Combat Goggles
	"G_Combat_Goggles_tna_F", // Combat Goggles (Green)
	"G_Diving", // Diving Goggles
	"G_Lowprofile" // "Low Profile Goggles
	*/
];

_overallLoopAmount = floor (round (random 6) + 4); // minimum 2, maximum 10

_backPackAmount = floor (round (random 3) + 3); // minimum 3, maximum 6
_binocularAmount = floor (round (random 5) + 2); // minimum 3, maximum 7
_bipodAmount = floor (round (random 3) + 2); // minimum 2, maximum 5
_headGearAmount = floor (round (random 3) + 5); // minimum 5, maximum 8
_itemAmount = floor (round (random 3) + 5); // minimum 5, maximum 8
_launcherAmount = floor (round (random 3) + 2); // minimum 2, maximum 5
_magazineAmount = floor (round (random 5) + 5); // minimum 5, maximum 10
_throwableAmount = floor (round (random 3) + 3); // minimum 3, maximum 6
_muzzleAmount = floor (round (random 2) + 2); // minimum 2, maximum 4
_opticAmount = floor (round (random 4) + 5); // minimum 5, maximum 9
_primaryWeaponAmount = floor (round (random 5) + 5); // minimum 5, maximum 10
_secondaryWeaponAmount = floor (round (random 3) + 2); // minimum 2, maximum 5
_uniformAmount = floor (round (random 4) + 3); // minimum 3, maximum 7
_vestAmount = floor (round (random 4) + 3); // minimum 3, maximum 7
_weaponAccessoryAmount = floor (round (random 3) + 2); // minimum 2, maximum 5
_minesAmount = floor (round (random 2) + 2); // minimum 2, maximum 4
_goggleAmount = floor (round (random 2) + 2); // minimum 2, maximum 4

_loadCrateWithWhatArray =
[
	"_backPacks",
	"_binoculars",
	"_bipods",
	"_headGear",
	"_items",
	"_launcherWeapons",
	"_magazines",
	"_throwables",
	"_muzzles",
	"_optics",
	"_primaryWeapons",
	"_secondaryWeapons",
	//"_uniforms",
	"_vests",
	"_weaponAccessories",
	"_mines"
];

/*	------------------------------------------------------------------------------------------
	DO NOT EDIT BELOW HERE!
	------------------------------------------------------------------------------------------	*/

params ["_crate"];

_crate allowDamage false;
_crate setVariable ["A3W_inventoryLockR3F", true, true];

clearBackpackCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;

_loadCrateAmount = 0;
_loadCrateWithWhat = "";

#ifdef __DEBUG__
	diag_log "----------------------------------------------------";
#endif

for [{_i = 0},{_i < _overallLoopAmount},{_i = _i + 1}] do
{
	_loadCrateWithWhat = selectRandom _loadCrateWithWhatArray;
	
	#ifdef __DEBUG__
		diag_log format ["%1 -> %2",(_i + 1),_loadCrateWithWhat];
	#endif
	
	switch (_loadCrateWithWhat) do
	{
		case "_backPacks": {
			_loadCrateAmount = _backPackAmount;
			for [{_lootCount = 0 },{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _backPacks;
				_crate addBackpackCargoGlobal [_loadCrateItem, 1];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> 1x %2",_loadCrateWithWhat,_loadCrateItem];
				#endif
			};
		};
		case "_binoculars": {
			_loadCrateAmount = _binocularAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _binoculars;
				_crate addItemCargoGlobal [_loadCrateItem, 1];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> 1x %2",_loadCrateWithWhat,_loadCrateItem];
				#endif
			};
		};
		case "_bipods": {
			_loadCrateAmount = _bipodAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _bipods;
				_crate addItemCargoGlobal [_loadCrateItem, 1];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> 1x %2",_loadCrateWithWhat,_loadCrateItem];
				#endif
			};
		};
		case "_headGear": {
			_loadCrateAmount = _headGearAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _headGear;
				_crate addItemCargoGlobal [_loadCrateItem, 1];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> 1x %2",_loadCrateWithWhat,_loadCrateItem];
				#endif

			};
		};
		case "_items": {
			_loadCrateAmount = _itemAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _items;
				_crate addItemCargoGlobal [_loadCrateItem, 1];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> 1x %2",_loadCrateWithWhat,_loadCrateItem];
				#endif

			};
		};
		case "_launcherWeapons": {
			_loadCrateAmount = _launcherAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _launcherWeapons;
				_loadCrateLootMagazine = getArray (configFile / "CfgWeapons" / _loadCrateItem / "magazines");
				_loadCrateLootMagazineClass = selectRandom _loadCrateLootMagazine;
				_loadCrateLootMagazineNum = floor (round (random 4) + 2); // minimum 2, maximum 6
				_crate addMagazineCargoGlobal [_loadCrateLootMagazineClass, _loadCrateLootMagazineNum];
				_crate addWeaponCargoGlobal [_loadCrateItem, 1];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> 1x %2 with %3x %4 rockets",_loadCrateWithWhat,_loadCrateItem,_loadCrateLootMagazineNum,_loadCrateLootMagazineClass];
				#endif

			};
		};
		case "_magazines": {
			_loadCrateAmount = _magazineAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _magazines;
				_loadCrateLootMagazineNum = floor (round (random 4) + 2); // minimum 2, maximum 6
				_crate addMagazineCargoGlobal [_loadCrateItem, _loadCrateLootMagazineNum];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> %2x %3 magazines",_loadCrateWithWhat,_loadCrateLootMagazineNum,_loadCrateItem];
				#endif

			};
		};
		case "_throwables": {
			_loadCrateAmount = _throwableAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _throwables;
				_loadCrateLootMagazineNum = floor (round (random 8) + 2); // minimum 2, maximum 10
				_crate addMagazineCargoGlobal [_loadCrateItem, _loadCrateLootMagazineNum];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> %2x %3",_loadCrateWithWhat,_loadCrateLootMagazineNum,_loadCrateItem];
				#endif
			};
		};
		case "_muzzles": {
			_loadCrateAmount = _muzzleAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _muzzles;
				_crate addItemCargoGlobal [_loadCrateItem, 1];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> 1x %2",_loadCrateWithWhat,_loadCrateItem];
				#endif
			};
		};
		case "_optics": {
			_loadCrateAmount = _opticAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _optics;
				_crate addItemCargoGlobal [_loadCrateItem, 1];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> 1x %2",_loadCrateWithWhat,_loadCrateItem];
				#endif
			};
		};
		case "_primaryWeapons": {
			_loadCrateAmount = _primaryWeaponAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _primaryWeapons;
				_loadCrateLootMagazine = getArray (configFile / "CfgWeapons" / _loadCrateItem / "magazines");
				_loadCrateLootMagazineClass = selectRandom _loadCrateLootMagazine;
				_loadCrateLootMagazineNum = floor (round (random 6) + 4); // minimum 4, maximum 10
				_crate addMagazineCargoGlobal [_loadCrateLootMagazineClass, _loadCrateLootMagazineNum];
				_crate addWeaponCargoGlobal [_loadCrateItem, 1];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> 1x %2 with %3x %4 magazines",_loadCrateWithWhat,_loadCrateItem,_loadCrateLootMagazineNum,_loadCrateLootMagazineClass];
				#endif
			};
		};
		case "_secondaryWeapons": {
			_loadCrateAmount = _secondaryWeaponAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _secondaryWeapons;
				_loadCrateLootMagazine = getArray (configFile / "CfgWeapons" / _loadCrateItem / "magazines");
				_loadCrateLootMagazineClass = selectRandom _loadCrateLootMagazine;
				_loadCrateLootMagazineNum = floor (round (random 4) + 2); // minimum 2, maximum 6
				_crate addMagazineCargoGlobal [_loadCrateLootMagazineClass, _loadCrateLootMagazineNum];
				_crate addWeaponCargoGlobal [_loadCrateItem, 1];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> 1x %2 with %3x %4 magazines",_loadCrateWithWhat,_loadCrateItem,_loadCrateLootMagazineNum,_loadCrateLootMagazineClass];
				#endif
			};
		};
		case "_uniforms": {
			_loadCrateAmount = _uniformAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _uniforms;
				_crate addItemCargoGlobal [_loadCrateItem, 1];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> 1x %2",_loadCrateWithWhat,_loadCrateItem];
				#endif
			};
		};
		case "_vests": {
			_loadCrateAmount = _vestAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _vests;
				_crate addItemCargoGlobal [_loadCrateItem, 1];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> 1x %2",_loadCrateWithWhat,_loadCrateItem];
				#endif
			};
		};
		case "_weaponAccessories": {
			_loadCrateAmount = _weaponAccessoryAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _weaponAccessories;
				_crate addItemCargoGlobal [_loadCrateItem, 1];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> 1x %2",_loadCrateWithWhat,_loadCrateItem];
				#endif
			};
		};
		case "_mines": {
			_loadCrateAmount = _minesAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _mines;
				_loadCrateLootMagazineNum = floor (round (random 2) + 2); // minimum 2, maximum 4
				_crate addMagazineCargoGlobal [_loadCrateItem, _loadCrateLootMagazineNum];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> %2x %3",_loadCrateWithWhat,_loadCrateLootMagazineNum,_loadCrateItem];
				#endif
			};
		};
		case "_goggles": {
			_loadCrateAmount = _goggleAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _goggles;
				_loadCrateLootMagazineNum = floor (round (random 2) + 2); // minimum 2, maximum 4
				_crate addItemCargoGlobal [_loadCrateItem, _loadCrateLootMagazineNum];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> %2x %3",_loadCrateWithWhat,_loadCrateLootMagazineNum,_loadCrateItem];
				#endif
			};
		};
	};
};
#ifdef __DEBUG__
	diag_log "----------------------------------------------------";
#endif