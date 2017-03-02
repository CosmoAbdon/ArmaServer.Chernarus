// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: fn_refillbox.sqf  "fn_refillbox"
//	@file Author: [404] Pulse , [404] Costlyy , [404] Deadbeat, AgentRev
//	@file Created: 22/1/2012 00:00
//	@file Args: [OBJECT (Weapons box that needs filling), STRING (Name of the fill to give to object)]

if (!isServer) exitWith {};

#define RANDOM_BETWEEN(START,END) ((START) + floor random ((END) - (START) + 1))
#define RANDOM_ODDS(ODDS) ([0,1] select (random 1 < (ODDS))) // between 0.0 and 1.0

private ["_box", "_boxType", "_boxItems", "_item", "_qty", "_mag"];
_box = _this select 0;
_boxType = _this select 1;

_box setVariable [call vChecksum, true];

_box allowDamage false; // No more fucking busted crates
_box setVariable ["allowDamage", false, true];
_box setVariable ["A3W_inventoryLockR3F", true, true];

// Clear pre-existing cargo first
//clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;

if (_boxType == "mission_USSpecial2") then { _boxType = "mission_USSpecial" };

switch (_boxType) do
{
	case "mission_USLaunchers":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", ["CUP_launch_M47", "CUP_launch_Mk153Mod0", "CUP_optic_SMAW_Scope"], RANDOM_BETWEEN(3,5), RANDOM_BETWEEN(1,2)],
			["wep", "CUP_launch_RPG18", RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(1,2)],
			["mag", ["ClaymoreDirectionalMine_Remote_Mag", "CUP_PG7VL_M", "ATMine_Range_Mag", "DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], RANDOM_BETWEEN(3,8)]
		];
	};
	case "mission_USSpecial":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", ["CUP_srifle_AS50_SBPMII", "CUP_srifle_AWM_des_SBPMII", "CUP_srifle_AWM_wdl_SBPMII", "CUP_srifle_M107_LeupoldVX3"], RANDOM_BETWEEN(3,5), RANDOM_BETWEEN(5,7)],
			["wep", ["CUP_srifle_CZ750", "CUP_srifle_M24_des", "CUP_srifle_M24_wdl", "CUP_srifle_G22_des", "CUP_arifle_Mk20", "CUP_arifle_Mk20"], RANDOM_BETWEEN(8,10), RANDOM_BETWEEN(6,10)],
			
			["wep", ["Laserdesignator_03", "Rangefinder"], RANDOM_BETWEEN(5,10)],
			["itm", "Medikit", 5],
			["itm", "Toolkit", 5],
			["itm", ["CUP_optic_HoloBlack", "CUP_optic_HoloWdl", "CUP_optic_HoloDesert", "CUP_optic_CompM2_Black", "CUP_optic_CompM2_Woodland", "CUP_optic_CompM2_Desert"], RANDOM_BETWEEN(10,15)],
			["itm", ["CUP_optic_RCO", "CUP_optic_RCO_desert", "CUP_optic_ACOG", "CUP_optic_Elcan_reflex", "CUP_optic_SB_11_4x20_PM", "CUP_optic_LeupoldMk4_MRT_tan", "CUP_optic_LeupoldM3LR", "CUP_optic_SUSAT"], RANDOM_BETWEEN(10,15)],
			
			["mag", "CUP_30Rnd_556x45_Stanag", RANDOM_BETWEEN(10,20)],
			["mag", "CUP_30Rnd_556x45_G36", RANDOM_BETWEEN(5,10)],
			["mag", "CUP_100Rnd_556x45_BetaCMag", RANDOM_BETWEEN(4,8)],
			["mag", "CUP_200Rnd_TE4_Green_Tracer_556x45_M249", 20],
			["mag", "CUP_200Rnd_TE4_Green_Tracer_556x45_L110A1", 20],

			["mag", "CUP_20Rnd_762x51_DMR", RANDOM_BETWEEN(10,20)],
			["mag", "CUP_30Rnd_Sa58_M", RANDOM_BETWEEN(5,10)],
			
			["wep", ["CUP_launch_Javelin", "CUP_launch_FIM92Stinger", "CUP_launch_MAAWS", "CUP_launch_Mk153Mod0", "CUP_launch_M47"], RANDOM_BETWEEN(5,10), RANDOM_BETWEEN(5,7)],
			
			["mag", "CUP_1Rnd_StarCluster_Red_M203", RANDOM_BETWEEN(15,15)],
			["mag", "CUP_1Rnd_StarFlare_White_M203", RANDOM_BETWEEN(15,15)],
			
			["mag", "CUP_HandGrenade_M67", RANDOM_BETWEEN(10,10)],
			["mag", "SmokeShellPurple", RANDOM_BETWEEN(10,10)]

		];
	};
	case "mission_Main_A3snipers":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", ["CUP_srifle_M40A3", "CUP_srifle_M24_des_LeupoldMk4LRT", "CUP_srifle_M24_ghillie_bipod", "CUP_srifle_M40A3_bipod", "CUP_srifle_CZ550"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(4,6)],
			["wep", ["CUP_srifle_CZ750", "CUP_srifle_CZ750_SOS_bipod", "CUP_srifle_SVD_pso", "CUP_srifle_VSSVintorez_pso", "CUP_srifle_SVD_wdl_ghillie"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(4,6)],
			["itm", ["Rangefinder", "Laserdesignator"], RANDOM_BETWEEN(1,2)],
			["itm", ["CUP_optic_PSO_1", "CUP_Mxx_camo", "CUP_optic_LeupoldMk4_10x40_LRT_Woodland", "CUP_optic_PSO_3", "CUP_optic_Kobra", "CUP_muzzle_PBS4", "CUP_optic_SB_3_12x50_PMII"], RANDOM_BETWEEN(1,2)],
			["itm", ["acc_pointer_IR", "acc_flashlight"], RANDOM_BETWEEN(1,3)],
			["itm", ["CUP_optic_LeupoldMk4_MRT_tan", "CUP_optic_Leupold_VX3", "CUP_optic_ACOG"], RANDOM_BETWEEN(1,2)]
		];
	};
};

[_box, _boxItems] call processItems;
