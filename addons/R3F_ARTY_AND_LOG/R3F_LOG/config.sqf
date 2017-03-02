/****** TOW WITH VEHICLE  ******/

/**
 * List of class names of vehicles which can tow towables objects.
 */
R3F_LOG_CFG_remorqueurs =
[
	//CUP Vehicles
	
	"CUP_AAV_Base",
	"CUP_LAV25_Base", 
	"CUP_M2Bradley_Base",
	"CUP_StrykerBase",
	"CUP_M113_Base",
	"CUP_M163_Base",
	"CUP_HMMWV_Base",
	"CUP_RG31_BASE",
	"CUP_FV510_Base",
	"CUP_MCV80_Base",
	"CUP_SUV_Base",
	"CUP_Datsun_Base",
	"CUP_V3S_Open_Base",
	"CUP_T34_Base",
	"CUP_T55_Base",
	"CUP_BMP1_base",
	"CUP_BMP2_base",
	"CUP_BMP3_Base",
	"CUP_BRDM2_Base",
	"CUP_GAZ_Vodnik_Base",
	"CUP_BTR60_Base",
	"CUP_BTR90_Base",
	"CUP_UAZ_Base",
	"CUP_TowingTractor_Base",
	"CUP_BAF_Jackal2_BASE_D",
	"CUP_BAF_Coyote_BASE_D",
	"CUP_Ural_BaseTurret",
	"CUP_Ural_Base",
	"CUP_MTVR_Base",
	"CUP_LR_Base",
	
	"Boat_Armed_01_base_F"
	
	/*
	//"SUV_01_base_F",
	//"Offroad_01_base_F",
	//"Van_01_base_F",
	"MRAP_01_base_F",
	//"MRAP_02_base_F",
	//"MRAP_03_base_F",
	"Boat_Armed_01_base_F"
	*/
];

/**
 * List of class names of HEAVY vehicles which can tow heavy towables objects. Takes precedence over R3F_LOG_CFG_remorqueurs
 */
R3F_LOG_CFG_remorqueursH =
[
	"CUP_M1_Abrams_base",
	"CUP_T90_Base",
	"CUP_Challenger2_base"
	
	//"CUP_TowingTractor_Base",
	//"CUP_Ural_BaseTurret",
	//"CUP_Ural_Base",
	//"CUP_MTVR_Base"
	
	//Vanilla
	/*"Truck_01_base_F",
	"Truck_02_base_F",
	"Truck_03_base_F",
	"Wheeled_APC_F",
	"Tank_F"
	*/
];

R3F_LOG_CFG_remorqueurs append R3F_LOG_CFG_remorqueursH;

/**
 * List of class names of towables objects.
 */
R3F_LOG_CFG_objets_remorquables =
[
	//CUP Vehicles
	"CUP_HMMWV_Base",
	"CUP_RG31_BASE",
	"CUP_StrykerBase",
	"CUP_LAV25_Base",
	"CUP_RG31_BASE",
	"CUP_TowingTractor_Base",
	"CUP_BAF_Coyote_BASE_D",
	"CUP_BAF_Jackal2_BASE_D",
	"CUP_LR_Base",
	"CUP_Mastiff_Base",
	"CUP_Ridgback_Base",
	"CUP_Wolfhound_Base",
	"CUP_AH64_base",
	"CUP_AW159_Unarmed_Base",
	"CUP_SUV_Base",
	"CUP_Datsun_Base",
	"CUP_V3S_Open_Base",
	"CUP_BRDM2_Base",
	"CUP_GAZ_Vodnik_Base",
	"CUP_BTR60_Base",
	"CUP_BTR90_Base",
	"CUP_UAZ_Base",
	"CUP_KA50_Base",
	"CUP_Ka52_Base",
	"CUP_Ka60_Base",
	"CUP_Mi24_Base",

	"CUP_L39_base",
	"CUP_AV8B_Base",
	"CUP_F35B_base",
	"CUP_A10_Base",
	"CUP_Su25_base",
	"CUP_SU34_BASE",
	"CUP_DC3_Base",
	"CUP_AH6_BASE",
	"CUP_MTVR_Base",
	"CUP_Ural_BaseTurret",
	"CUP_Ural_Base",
	"CUP_ZU23_base",
	
	"Ship_F"
	
	//Vanilla
	/*"Car_F",
	"Ship_F",
	"Plane_F",
	"Heli_Light_01_base_F",
	"Heli_Light_02_base_F",
	"Heli_light_03_base_F",
	"Heli_Attack_01_base_F",
	"B_UAV_02_F",
	"B_T_UAV_03_F",
	"O_UAV_02_F",
	"O_UAV_02_CAS_F",
	"B_UAV_02_CAS_F",
	"I_UAV_02_F",
	"I_UAV_02_CAS_F",
	"O_T_UAV_04_CAS_F"
	*/
];

/**
 * List of class names of HEAVY towables objects. Takes precedence over R3F_LOG_CFG_objets_remorquables
 */
R3F_LOG_CFG_objets_remorquablesH =
[
	//CUP Vehicles
	"CUP_M2Bradley_Base",
	"CUP_FV510_Base",
	"CUP_MCV80_Base",
	"CUP_T34_Base",
	"CUP_T55_Base",
	"CUP_BMP1_base",
	"CUP_BMP2_base",
	"CUP_BMP3_Base",
	"CUP_SA330_Base",
	//"CUP_Ural_BaseTurret",
	"CUP_2S6_Base",
	"CUP_ZSU23_Base",
	//"CUP_MTVR_Base",
	"CUP_CH47F_base",
	"CUP_Mi8_base",
	//"CUP_Ural_Base",
	"CUP_CH53E_Base"
	
	//Vanilla
	/*
	"Wheeled_APC_F",
	"Tank_F",
	"Heli_Attack_02_base_F",
	"Heli_Transport_01_base_F",
	"Heli_Transport_02_base_F",
	"Heli_Transport_03_base_F",
	"Heli_Transport_04_base_F",
	"Plane_CAS_01_base_F",
	"Plane_CAS_02_base_F"
	*/
];

R3F_LOG_CFG_objets_remorquables append R3F_LOG_CFG_objets_remorquablesH;

/****** LIFT WITH VEHICLE  ******/

/**
 * List of class names of air vehicles which can lift liftables objects.
 */
R3F_LOG_CFG_heliporteurs =
[
	//CUP Vehicles
	"CUP_Uh60_Base",
	"CUP_MH60S_Base",
	"CUP_B_UH1Y_Base",
	"CUP_UH1H_base",
	"CUP_SA330_Base",
	"CUP_Merlin_HC3_Base"
	
	//Vanilla
	/*
	//"Helicopter_Base_F"
	//"Heli_Light_01_base_F",
	"Heli_Light_02_base_F",
	"Heli_light_03_base_F",
	"Heli_Attack_01_base_F",
	"Heli_Attack_02_base_F",
	"Heli_Transport_01_base_F"
	*/
];

/**
 * List of class names of HEAVY air vehicles which can lift heavy liftables objects. Takes precedence over R3F_LOG_CFG_objets_remorquables
 */
R3F_LOG_CFG_heliporteursH =
[
	//CUP Vehicles
	"CUP_CH47F_base",
	"CUP_Mi8_base",
	"CUP_CH53E_Base"
	
	//Vanilla
	//"Heli_Transport_02_base_F",
	//"Heli_Transport_03_base_F",
	//"Heli_Transport_04_base_F"
];

R3F_LOG_CFG_heliporteurs append R3F_LOG_CFG_heliporteursH;

/**
 * List of class names of liftables objects.
 */
R3F_LOG_CFG_objets_heliportables =
[
	//CUP Vehicles
	"CUP_TowingTractor_Base",
	"CUP_HMMWV_Base",
	"CUP_RG31_BASE",
	"CUP_StrykerBase",
	"CUP_LAV25_Base",
	"CUP_RG31_BASE",
	"CUP_BAF_Coyote_BASE_D",
	"CUP_BAF_Jackal2_BASE_D",
	"CUP_LR_Base",
	"CUP_Mastiff_Base",
	"CUP_Ridgback_Base",
	"CUP_Wolfhound_Base",
	"CUP_SUV_Base",
	"CUP_Datsun_Base",
	"CUP_V3S_Open_Base",
	"CUP_BRDM2_Base",
	"CUP_GAZ_Vodnik_Base",
	"CUP_UAZ_Base",
	"CUP_ZU23_base",
	"CUP_AH6_BASE"
	
	/*
	//Vanilla - leaving out so there are no surprises
	"Car_F",
	"Ship_F",
	"Plane_F",
	"Heli_Light_01_base_F"
	*/
];

/**
 * List of class names of HEAVY liftables objects. Takes precedence over R3F_LOG_CFG_objets_heliportables
 */
R3F_LOG_CFG_objets_heliportablesH =
[
	//CUP Vehicles
	//"CUP_MTVR_Base",
	"CUP_LAV25_Base",
	"CUP_M2Bradley_Base",
	"CUP_StrykerBase",
	"CUP_M113_Base",
	"CUP_M163_Base",
	"CUP_T34_Base",
	"CUP_T55_Base",
	"CUP_2S6_Base",
	"CUP_ZSU23_Base",
	"CUP_BMP1_base",
	"CUP_BMP2_base",
	//"CUP_Ural_BaseTurret",
	//"CUP_Ural_Base",
	"CUP_BTR60_Base",
	"CUP_BTR90_Base",
	"CUP_L39_base",
	"CUP_AV8B_Base",
	"CUP_F35B_base"
	
	/*
	//Vanilla - leaving out so there are no surprises
	"Wheeled_APC_F",
	"Tank_F",
	"Heli_Light_02_base_F",
	"Heli_light_03_base_F",
	"Heli_Attack_01_base_F",
	"Heli_Attack_02_base_F",
	"Heli_Transport_01_base_F",
	"Heli_Transport_02_base_F",
	"Heli_Transport_03_base_F",
	"Heli_Transport_04_base_F",
	"Plane_CAS_01_base_F",
	"Plane_CAS_02_base_F",
	"Plane_Fighter_03_base_F"
	*/
];

R3F_LOG_CFG_objets_heliportables append R3F_LOG_CFG_objets_heliportablesH;


/****** LOAD IN VEHICLE / CHARGER DANS LE VEHICULE ******/


/**
 * List of class names of (ground or air) vehicles which can transport transportables objects.
 * The second element of the arrays is the load capacity (in relation with the capacity cost of the objects).
 */
R3F_LOG_CFG_transporteurs =
[
	["Quadbike_01_base_F", 5],
	["Truck_F", 75],
	["Wheeled_APC_F", 30],
	["Wheeled_APC", 30],
	["Tank_F", 30],
	
	["CUP_HMMWV_Base", 20],
	["CUP_RG31_BASE", 20],
	["CUP_StrykerBase", 30],
	["CUP_LAV25_Base", 30],
	["CUP_TowingTractor_Base", 5],
	["CUP_BAF_Coyote_BASE_D", 30],
	["CUP_BAF_Jackal2_BASE_D", 20],
	["CUP_LR_Base", 20],
	["CUP_Mastiff_Base", 20],
	["CUP_Ridgback_Base", 20],
	["CUP_Wolfhound_Base", 30],
	["CUP_AH64_base", 20],
	["CUP_AW159_Unarmed_Base", 20],
	["CUP_SUV_Base", 30],
	["CUP_Datsun_Base", 35],
	["CUP_V3S_Open_Base", 75],
	["CUP_BRDM2_Base", 20],
	["CUP_GAZ_Vodnik_Base", 30],
	["CUP_BTR60_Base", 30],
	["CUP_BTR90_Base", 35],
	["CUP_UAZ_Base", 15],
	["CUP_KA50_Base", 20],
	["CUP_Ka52_Base", 20],
	["CUP_Ka60_Base", 20],
	["CUP_Mi24_Base", 20],
	["CUP_DC3_Base", 75],
	["CUP_AH6_BASE", 5],
	["CUP_AAV_Base", 30],
	["CUP_M2Bradley_Base", 30],
	["CUP_M113_Base", 30],
	["CUP_M163_Base", 20],
	["CUP_FV510_Base", 30],
	["CUP_MCV80_Base", 30],
	["CUP_T34_Base", 30],
	["CUP_T55_Base", 30],
	["CUP_BMP1_base", 30],
	["CUP_BMP2_base", 30],
	["CUP_BMP3_Base", 30],
	["CUP_Ural_BaseTurret", 150],
	["CUP_2S6_Base", 30],
	["CUP_ZSU23_Base", 30],
	["CUP_MTVR_Base", 150],
	["CUP_SA330_Base", 40],
	["CUP_CH47F_base", 50],
	["CUP_Mi8_base", 50],
	["CUP_CH53E_Base", 50],
	["CUP_Uh60_Base", 20],
	["CUP_MH60S_Base", 20],
	["CUP_B_UH1Y_Base", 20],
	["CUP_UH1H_base", 20],
	["CUP_Merlin_HC3_Base", 30],
	["CUP_Ural_Base", 150],
	["CUP_T72_Base", 25],
	["CUP_T90_Base", 25],
	["CUP_M1_Abrams_base", 25],
	["CUP_Challenger2_base", 25]

	
	/*
	["UGV_01_base_F", 10],
	["Hatchback_01_base_F", 10],
	["SUV_01_base_F", 20],
	["Offroad_01_base_F", 30],
	["Van_01_base_F", 40],
	["MRAP_01_base_F", 20],
	["MRAP_02_base_F", 20],
	["MRAP_03_base_F", 20],
	["B_Truck_01_box_F", 150],
	["Truck_F", 75],
	["Wheeled_APC_F", 30],
	["Tank_F", 30],
	["Rubber_duck_base_F", 10],
	["Boat_Civil_01_base_F", 10],
	["Boat_Armed_01_base_F", 20],
	["Heli_Light_01_base_F", 10],
	["Heli_Light_02_base_F", 20],
	["Heli_light_03_base_F", 20],
	["Heli_Transport_01_base_F", 25],
	["Heli_Transport_02_base_F", 30],
	["Heli_Transport_03_base_F", 30],
	["Heli_Transport_04_base_F", 30],
	["Heli_Attack_01_base_F", 10],
	["Heli_Attack_02_base_F", 20]
	*/
];


R3F_LOG_CFG_objets_transportables =
[
	["Static_Designator_01_base_F", 2],
	["Static_Designator_02_base_F", 2],
	["StaticWeapon", 5],
	["CUP_ZU23_base", 10],
	["Box_NATO_AmmoVeh_F", 10],
	["B_supplyCrate_F", 5],
	["ReammoBox_F", 3],
	["Kart_01_Base_F", 5],
	["Quadbike_01_base_F", 10],
	["Rubber_duck_base_F", 10],
	["UAV_01_base_F", 2],
	["Land_BagBunker_Large_F", 10],
	["Land_BagBunker_Small_F", 5],
	["Land_BagBunker_Tower_F", 7],
	["Land_BagFence_Corner_F", 2],
	["Land_BagFence_End_F", 2],
	["Land_BagFence_Long_F", 3],
	["Land_BagFence_Round_F", 2],
	["Land_BagFence_Short_F", 2],
	["Land_BarGate_F", 3],
	["Land_Canal_WallSmall_10m_F", 4],
	["Land_Canal_Wall_Stairs_F", 3],
	["Land_CargoBox_V1_F", 5],
	["Land_Cargo_Patrol_V1_F", 7],
	["Land_Cargo_Tower_V1_F", 30],
	["Land_CncBarrier_F", 4],
	["Land_CncBarrierMedium_F", 4],
	["Land_CncBarrierMedium4_F", 4],
	["Land_CncShelter_F", 2],
	["Land_CncWall1_F", 3],
	["Land_CncWall4_F", 5],
	["Land_Crash_barrier_F", 5],
	["Land_HBarrierBig_F", 5],
	["Land_HBarrierTower_F", 8],
	["Land_HBarrierWall4_F", 4],
	["Land_HBarrierWall6_F", 6],
	["Land_HBarrier_1_F", 3],
	["Land_HBarrier_3_F", 4],
	["Land_HBarrier_5_F", 5],
	["Land_LampHarbour_F", 2],
	["Land_LampShabby_F", 2],
	["Land_MetalBarrel_F", 2],
	["Land_Mil_ConcreteWall_F", 5],
	["Land_Mil_WallBig_4m_F", 5],
	["Land_Obstacle_Ramp_F", 5],
	["Land_Pipes_large_F", 5],
	["Land_RampConcreteHigh_F", 6],
	["Land_RampConcrete_F", 5],
	["Land_Razorwire_F", 5],
	["Land_Sacks_goods_F", 2],
	["Land_Scaffolding_F", 5],
	["Land_Shoot_House_Wall_F", 3],
	["Land_Stone_8m_F", 5],
	["Land_ToiletBox_F", 2],
	["Land_Pier_F", 150],  
	["Land_FuelStation_Feed_F",2],
	["Barrels",5],
	["Land_BarrelWater_F", 2]
];

/****** MOVABLE-BY-PLAYER OBJECTS / OBJETS DEPLACABLES PAR LE JOUEUR ******/

R3F_LOG_CFG_objets_deplacables =
[
	"StaticWeapon",
	"ReammoBox_F",
	"Kart_01_Base_F",
	"Quadbike_01_base_F",
	"Rubber_duck_base_F",
	"SDV_01_base_F",
	"UAV_01_base_F",
	"Land_BagBunker_Large_F",
	"Land_BagBunker_Small_F",
	"Land_BagBunker_Tower_F",
	"Land_BagFence_Corner_F",
	"Land_BagFence_End_F",
	"Land_BagFence_Long_F",
	"Land_BagFence_Round_F",
	"Land_BagFence_Short_F",
	"Land_BarGate_F",
	"Land_Canal_WallSmall_10m_F",
	"Land_Canal_Wall_Stairs_F",
	"Land_CargoBox_V1_F",
	"Land_Cargo_Patrol_V1_F",
	"Land_Cargo_Tower_V1_F",
	"Land_CncBarrier_F",
	"Land_CncBarrierMedium_F",
	"Land_CncBarrierMedium4_F",
	"Land_CncShelter_F",
	"Land_CncWall1_F",
	"Land_CncWall4_F",
	"Land_Crash_barrier_F",
	"Land_HBarrierBig_F",
	"Land_HBarrierTower_F",
	"Land_HBarrierWall4_F",
	"Land_HBarrierWall6_F",
	"Land_HBarrier_1_F",
	"Land_HBarrier_3_F",
	"Land_HBarrier_5_F",
	"Land_LampHarbour_F",
	"Land_LampShabby_F",
	"Land_MetalBarrel_F",
	"Land_Mil_ConcreteWall_F",
	"Land_Mil_WallBig_4m_F",
	"Land_Obstacle_Ramp_F",
	"Land_Pipes_large_F",
	"Land_RampConcreteHigh_F",
	"Land_RampConcrete_F",
	"Land_Razorwire_F",
	"Land_Sacks_goods_F",
	"Land_Scaffolding_F",
	"Land_Shoot_House_Wall_F",
	"Land_Stone_8m_F",
	"Land_ToiletBox_F",
	"Land_FuelStation_Feed_F",
	"Land_Pier_F",  
	"Land_FuelStation_Feed_F",
	"Barrels",
	"Land_BarrelWater_F"
];
