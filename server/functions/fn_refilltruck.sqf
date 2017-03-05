// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: fn_refilltruck.sqf
//	@file Author: AgentRev
//	@file Created: 30/06/2013 15:28

if (!isServer) exitWith {};

#define RANDOM_BETWEEN(START,END) (START + floor random ((END - START) + 1))

private ["_truck", "_truckItems", "_item", "_qty", "_mag"];
_truck = _this;

// Clear prexisting cargo first
clearMagazineCargoGlobal _truck;
clearWeaponCargoGlobal _truck;
clearItemCargoGlobal _truck;

// Item type, Item, # of items, # of magazines per weapon
_truckItems =
[
	["itm", ["CUP_muzzle_Bizon", "CUP_optic_AN_PAS_13c2", "CUP_optic_LeupoldMk4", "CUP_optic_HoloDesert"], RANDOM_BETWEEN(2,4)],
	["wep", ["SMG_01_F", "SMG_02_F"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(3,5)],
	["wep", ["CUP_arifle_G36K", "CUP_arifle_G36C", "CUP_arifle_MG36_holo", "CUP_arifle_L85A2_G"], RANDOM_BETWEEN(2,5), RANDOM_BETWEEN(4,5)],
	["wep", ["CUP_launch_Mk153Mod0_SMAWOptics", "CUP_launch_MAAWS_Scope"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(1,2)],
	["mag", "HandGrenade", RANDOM_BETWEEN(0,5)]
];

[_truck, _truckItems] call processItems;
