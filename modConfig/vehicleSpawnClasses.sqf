// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2016 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: vehicleSpawnClasses.sqf
//	@file Author: AgentRev

A3W_smallVehicles =
[
	"C_Quadbike_01_F",
	["B_Quadbike_01_F", "O_Quadbike_01_F", "I_Quadbike_01_F", "I_G_Quadbike_01_F"]
];

//Civilian Vehicle List - Random Spawns
civilianVehicles =
[
	"CUP_C_UAZ_Unarmed_TK_CIV",
	"CUP_C_Octavia_CIV",
	"CUP_C_Octavia_CIV",
	"CUP_C_LR_Transport_CTK",
	["CUP_C_Ural_Open_Civ_01", "CUP_C_Ural_Open_Civ_01"]
];

//Light Military Vehicle List - Random Spawns
lightMilitaryVehicles =
[
	["CUP_C_LR_Transport_CTK", "CUP_C_Octavia_CIV"]
];

//Medium Military Vehicle List - Random Spawns
mediumMilitaryVehicles =
[
	"CUP_I_LR_Transport_AAF",
	"CUP_B_Dingo_GL_GER_Des"
];

//Water Vehicles - Random Spawns
waterVehicles =
[
	"CUP_C_Fishing_Boat_Chernarus",
	"C_Boat_Transport_02_F",
	["C_Boat_Civil_01_police_F", "C_Boat_Civil_01_rescue_F"],
	["B_Boat_Armed_01_minigun_F", "O_Boat_Armed_01_hmg_F", "I_Boat_Armed_01_minigun_F"]
];

//Object List - Random Spawns.
staticWeaponsList =
[
	"B_Mortar_01_F",
	"O_Mortar_01_F",
	"I_Mortar_01_F",
	"I_G_Mortar_01_F"
];

//Object List - Random Helis.
staticHeliList =
[
	"CUP_B_C130J_USMC",
	"CUP_C_AN2_CIV",
	"CUP_C_AN2_AIRTAK_TK_CIV",
	"CUP_C_AN2_AEROSCHROT_TK_CIV"
	// don't put cargo helicopters here, it doesn't make sense to find them in towns; they spawn in the CivHeli mission
];

//Object List - Random Planes.
staticPlaneList =
[
	//["B_Plane_CAS_01_F", "O_Plane_CAS_02_F"],
	"I_Plane_Fighter_03_CAS_F"
];

A3W_planeSpawnOdds = 0.25; // 0.0 to 1.0

//Random Weapon List - Change this to what you want to spawn in cars.
vehicleWeapons =
[
	["CUP_sgun_M1014", "CUP_arifle_AK47", "CUP_arifle_FNFAL"],
	["CUP_arifle_AK74M_kobra", "CUP_sgun_M1014"]
];

vehicleAddition =
[
	"muzzle_snds_L", // 9mm
	"optic_Hamr",
	"optic_Aco",
	"optic_ACO_grn",
	"optic_aco_smg",
	"optic_Holosight"
];

vehicleAddition2 =
[
	"Chemlight_blue",
	"Chemlight_green",
	"Chemlight_yellow",
	"Chemlight_red"
];
