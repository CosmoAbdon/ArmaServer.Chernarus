// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	Lootspawner junction lists for classes to spawn-/lootable items
//	Author: Na_Palm (BIS forums)
//-------------------------------------------------------------------------------------
//here place Weapons an usable items (ex.: Binocular, ...)
//used with addWeaponCargoGlobal
//"lootWeapon_list" array of [class, [weaponlist]]
//                              class       : 0-civil, 1-military, ... (add more as you wish)
//                              weaponlist  : list of weapon class names
lootWeapon_list =
[
	[ // CIVIL
		0,
		[
			"CUP_arifle_AK74M_GL",
			"CUP_arifle_AKS_Gold"
		]
	],
	[ // MILITARY
		1,
		[
			"CUP_arifle_AK74M_GL",
			"CUP_arifle_AKS_Gold",
			"CUP_srifle_AS50",
			"CUP_arifle_AK107_pso",
			"CUP_arifle_CZ805_GL"
		]
	],
	[ // INDUSTRIAL
		2,
		[
			"CUP_arifle_AK74M_GL",
			"CUP_arifle_AKS_Gold",
			"CUP_srifle_AS50",
			"CUP_arifle_AK107_pso",
			"CUP_arifle_CZ805_GL"
		]
	],
	[ // RESEARCH
		3,
		[
			"CUP_arifle_AK74M_GL",
			"CUP_arifle_AKS_Gold",
			"CUP_srifle_AS50",
			"CUP_arifle_AK107_pso",
			"CUP_arifle_CZ805_GL",
			"CUP_arifle_G36A"
		]
	]
];

//here place magazines, weaponattachments and bodyitems(ex.: ItemGPS, ItemMap, Medikit, FirstAidKit, Binoculars, ...)
//used with addMagazineCargoGlobal
//"lootMagazine_list" array of [class, [magazinelist]]
//                              class       : 0-civil, 1-military, ... (add more as you wish)
//                              magazinelist: list of magazine class names
lootMagazine_list =
[
	[ // CIVIL
		0,
		[
			//"16Rnd_9x21_Mag",
			"CUP_30Rnd_556x45_Stanag",
			"CUP_100Rnd_556x45_BetaCMag",
			"CUP_30Rnd_545x39_AK_M",
			"CUP_30Rnd_Subsonic_545x39_AK_M",
			"CUP_30Rnd_545x39_AK_M",
			"CUP_5Rnd_127x99_as50_M",
			"CUP_30Rnd_556x45_G36"
		]
	],
	[ // MILITARY
		1,
		[
			//"16Rnd_9x21_Mag",
			"CUP_30Rnd_556x45_Stanag",
			"CUP_100Rnd_556x45_BetaCMag",
			"CUP_30Rnd_545x39_AK_M",
			"CUP_30Rnd_Subsonic_545x39_AK_M",
			"CUP_30Rnd_545x39_AK_M",
			"CUP_5Rnd_127x99_as50_M",
			"CUP_30Rnd_556x45_G36"
			"HandGrenade",
			"MiniGrenade",
			"SatchelCharge_Remote_Mag",
			"SLAMDirectionalMine_Wire_Mag"
		]
	],
	[ // INDUSTRIAL
		2,
		[
			//"16Rnd_9x21_Mag",
			"CUP_30Rnd_556x45_Stanag",
			"CUP_100Rnd_556x45_BetaCMag",
			"CUP_30Rnd_545x39_AK_M",
			"CUP_30Rnd_Subsonic_545x39_AK_M",
			"CUP_30Rnd_545x39_AK_M",
			"CUP_5Rnd_127x99_as50_M",
			"CUP_30Rnd_556x45_G36"
		]
	],
	[ // RESEARCH
		3,
		[
			//"16Rnd_9x21_Mag",
			"CUP_30Rnd_556x45_Stanag",
			"CUP_100Rnd_556x45_BetaCMag",
			"CUP_30Rnd_545x39_AK_M",
			"CUP_30Rnd_Subsonic_545x39_AK_M",
			"CUP_30Rnd_545x39_AK_M",
			"CUP_5Rnd_127x99_as50_M",
			"CUP_30Rnd_556x45_G36"
		]
	]
];

//here place hats, glasses, clothes, uniforms, vests
//used with addItemCargoGlobal
//"lootItem_list" array of [class, [itemlist]]
//                              class       : 0-civil, 1-military, ... (add more as you wish)
//                              itemlist    : list of item class names
lootItem_list =
[
	[ // CIVIL
		0,
		[
			"acc_flashlight",
			"FirstAidKit",
			"FirstAidKit",
			"FirstAidKit",
			"muzzle_snds_acp",                  // .45 ACP
			"muzzle_snds_L",                    // 9mm
			"optic_Aco",
			"optic_ACO_grn",
			"optic_aco_smg",
			"optic_Holosight",
			"optic_Holosight_smg"
		]
	],
	[ // MILITARY
		1,
		[
			"CUP_muzzle_snds_SCAR_H",
			"CUP_optic_PGO7V",
			"CUP_muzzle_snds_G36_desert",
			"CUP_acc_Flashlight_desert",
			"CUP_optic_TrijiconRx01_black",
			"CUP_optic_LeupoldMk4_10x40_LRT_Woodland",                  // .45 ACP
			"CUP_optic_HoloWdl",                    // 7.62mm
			"CUP_muzzle_Bizon"
		]
	],
	[ // INDUSTRIAL
		2,
		[
			"CUP_muzzle_snds_SCAR_H",
			"CUP_optic_PGO7V",
			"CUP_muzzle_snds_G36_desert",
			"CUP_acc_Flashlight_desert",
			"CUP_optic_TrijiconRx01_black",
			"CUP_optic_LeupoldMk4_10x40_LRT_Woodland",                  // .45 ACP
			"CUP_optic_HoloWdl",                    // 7.62mm
			"CUP_muzzle_Bizon"
		]
	],
	[ // RESEARCH
		3,
		[
			"CUP_muzzle_snds_SCAR_H",
			"CUP_optic_PGO7V",
			"CUP_muzzle_snds_G36_desert",
			"CUP_acc_Flashlight_desert",
			"CUP_optic_TrijiconRx01_black",
			"CUP_optic_LeupoldMk4_10x40_LRT_Woodland",                  // .45 ACP
			"CUP_optic_HoloWdl",                    // 7.62mm
			"CUP_muzzle_Bizon"
		]
	]
];

//here place backpacks, parachutes and packed drones/stationary
//used with addBackpackCargoGlobal
//"lootBackpack_list" array of [class, [backpacklist]]
//                              class       : 0-civil, 1-military, ... (add more as you wish)
//                              backpacklist: list of backpack class names
lootBackpack_list =
[
	[ // CIVIL
		0,
		[
			"CUP_B_USPack_Black",
			"CUP_B_USPack_Coyote",
			"CUP_B_AssaultPack_ACU"
		]
	],
	[ // MILITARY
		1,
		[
			"CUP_B_USPack_Black",
			"CUP_B_USPack_Coyote",
			"CUP_B_AssaultPack_ACU",
			"CUP_B_CivPack_WDL",
			"CUP_B_USMC_MOLLE_WDL",
			"CUP_B_GER_Pack_Tropentarn",
			"CUP_B_GER_Medic_FLecktarn"
		]
	],
	[ // INDUSTRIAL
		2,
		[
			"CUP_B_USPack_Black",
			"CUP_B_USPack_Coyote",
			"CUP_B_AssaultPack_ACU",
			"CUP_B_CivPack_WDL",
			"CUP_B_USMC_MOLLE_WDL",
			"CUP_B_GER_Pack_Tropentarn",
			"CUP_B_GER_Medic_FLecktarn"
		]
	],
	[ // RESEARCH
		3,
		[
			"CUP_B_USPack_Black",
			"CUP_B_USPack_Coyote",
			"CUP_B_AssaultPack_ACU",
			"CUP_B_CivPack_WDL",
			"CUP_B_USMC_MOLLE_WDL",
			"CUP_B_GER_Pack_Tropentarn",
			"CUP_B_GER_Medic_FLecktarn"
		]
	]
];

//here place any other objects(ex.: Land_Basket_F, Box_East_Wps_F, Land_Can_V3_F, ...)
//used with createVehicle directly
//"lootworldObject_list" array of [class, [objectlist]]
//                              class       : 0-civil, 1-military, ... (add more as you wish)
//                              objectlist  : list of worldobject class names
lootworldObject_list =
[
	[ // CIVIL
		0,
		[
			"Land_BakedBeans_F",                // food
			"Land_BakedBeans_F",                // food
			"Land_BottlePlastic_V2_F",          // water
			"Land_BottlePlastic_V2_F",          // water
			"Land_Can_V3_F",                    // energydrink
			"Land_Suitcase_F",                  // repairkit
			"Land_CanisterOil_F",               // syphon hose
			"Land_CanisterFuel_F"               // jerrycan
		]
	],
	[ // MILITARY
		1,
		[
			"Land_BakedBeans_F",                // food
			"Land_BottlePlastic_V2_F",          // water
			"Land_Can_V3_F",                    // energydrink
			"Land_Suitcase_F",                  // repairkit
			"Land_CanisterOil_F",               // syphon hose
			"Land_CanisterFuel_F"               // jerrycan
		]
	],
	[ // INDUSTRIAL
		2,
		[
			"Land_BakedBeans_F",                // food
			"Land_BottlePlastic_V2_F",          // water
			"Land_Can_V3_F",                    // energydrink
			"Land_Suitcase_F",                  // repairkit
			"Land_Suitcase_F",                  // repairkit
			"Land_CanisterOil_F",               // syphon hose
			"Land_CanisterOil_F",               // syphon hose
			"Land_CanisterFuel_F",              // jerrycan
			"Land_CanisterFuel_F"               // jerrycan
		]
	],
	[ // RESEARCH
		3,
		[
			"Land_BakedBeans_F",                // food
			"Land_BottlePlastic_V2_F",          // water
			"Land_Can_V3_F",                    // energydrink
			"Land_Suitcase_F",                  // repairkit
			"Land_CanisterOil_F",               // syphon hose
			"Land_CanisterFuel_F"               // jerrycan
		]
	]
];
