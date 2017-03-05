// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
/*********************************************************#
# @@ScriptName: storeConfig.sqf
# @@Author: His_Shadow, AgentRev
# @@Create Date: 2013-09-16 20:40:58
#*********************************************************/
 
// This tracks which store owner the client is interacting with
currentOwnerName = "";
 
// Gunstore Weapon List - Gun Store Base List updated
// Text name, classname, buy cost
 
hiddenArray = compileFinal str
[
//This allows mission vehicles to be sold for a good price without being directly purchasable. Keep all your hidden things in one place.
 
    ["CWS NV/TWS", "CUP_optic_CWS", 10000, "item"],
    //["AN/PAS 13C1 TWS (MR)", "CUP_optic_AN_PAS_13c1", 10000, "item"],
    //["AN/PAS 13C2 HTWS (LR)", "CUP_optic_AN_PAS_13c2", 10000, "item"],
    ["GOSHAWK TWS", "GOSHAWK TWS", 10000, "item"],
   
    ["Ural Ammo Truck", "CUP_O_Ural_Reammo_RU", 8000,"vehicle"],
    ["Ural Fuel Truck", "CUP_O_Ural_Refuel_CHDKZ", 8000, "vehicle"],
    ["Ural Repair Truck", "CUP_O_Ural_Repair_CHDKZ", 8000, "vehicle"],
    ["MTVR Ammo Truck", "CUP_B_MTVR_Ammo_USA", 8000,"vehicle"],
    ["MTVR Fuel Truck", "CUP_B_MTVR_Refuel_USA", 8000, "vehicle"],
    ["MTVR Repair Truck", "CUP_B_MTVR_Repair_USA", 8000, "vehicle"],
   
    ["Ural Transport 1", "CUP_C_Ural_Civ_01", 15000,"vehicle"],
    ["Ural Transport 2", "CUP_C_Ural_Civ_02", 15000, "vehicle"],
    ["Ural (Takistan Army)", "CUP_O_Ural_TKA", 15000, "vehicle"],
   
    ["A-10 Thunderbolt II (CAS)", "CUP_B_A10_CAS_USA", 55000,"vehicle"],
    ["A-10 Thunderbolt II (AT)", "CUP_B_A10_AT_USA", 57000, "vehicle"],
    ["F-35B AA", "CUP_B_F35B_AA_USMC", 60000, "vehicle"],
    ["F-35B CAS", "CUP_B_F35B_CAS_USMC", 60000, "vehicle"],
    ["F-35B GBU", "CUP_B_F35B_LGB_USMC", 60000, "vehicle"],
    ["Su-34 AGM", "CUP_O_SU34_AGM_RU", 65000, "vehicle"], //2-seater - needs co-pilot for bombs/AGMS/AA missiles
    ["AV-8B Harrier AGM", "CUP_B_AV8B_AGM_USMC", 60000, "vehicle"],
   
    ["HC-1 Puma", "CUP_B_SA330_Puma_HC1_BAF", 10000, "vehicle"],
    ["HC-2 Puma", "CUP_B_SA330_Puma_HC2_BAF", 10000, "vehicle"],
   
    ["Intel", "CUP_item_Moscow_Bombing_File", 100000, "item"], //Proof that Russia was operating inside Ukraine...er, I mean, Chernarus...
    ["Intel", "CUP_item_Cobalt_File", 90000, "item"],
    ["Intel", "CUP_item_Kostey_photos", 80000, "item"],
    ["Intel", "CUP_item_Kostey_map_case", 70000, "item"],  
    ["Intel", "CUP_item_Kostey_notebook", 60000, "item"],
   
    ["T-90", "CUP_O_T90_RU", 10000, "vehicle"],
    ["2S6M Tunguska", "CUP_O_2S6M_RU", 8000, "vehicle"],  
    ["M1A1 Abrams (Camo)", "CUP_B_M1A1_Woodland_US_Army", 8000, "vehicle"],
    ["M1A1 Abrams (Desert)", "CUP_B_M1A1_DES_US_Army", 8000, "vehicle"],
    ["M1A2 Abrams TUSK (Camo)", "CUP_B_M1A2_TUSK_MG_US_Army", 8000, "vehicle"],
    ["M1A2 Abrams TUSK (Desert)", "CUP_B_M1A2_TUSK_MG_DES_US_Army", 8000, "vehicle"],
    ["FV-4034 Challenger 2 (Camo)", "CUP_B_Challenger2_Woodland_BAF", 8000, "vehicle"],
    ["FV-4034 Challenger 2 (Desert)", "CUP_B_Challenger2_Desert_BAF", 8000, "vehicle"],
    ["Mi-24D", "CUP_O_Mi24_D_TK", 8000, "vehicle"],
    ["Ka-52", "CUP_O_Ka52_RU", 50000, "vehicle"],
    ["Ka-52 (Black)", "CUP_O_Ka52_Blk_RU", 50000, "vehicle"],
    ["Mi-24 Mk.III Superhind", "CUP_I_Mi24_Mk3_S8_GSh_AAF", 60000, "vehicle"],
    ["AH-1Z Viper", "CUP_B_AH1Z_USMC", 50000, "vehicle"],   //Standard Ah1Z
    ["AH-64D Apache Longbow", "CUP_B_AH64D_USA", 60000, "vehicle"], // Default Apache
    ["AH-64D Apache Escort", "CUP_B_AH64D_ES_USA", 60000, "vehicle"] //No AGM but more FFAR
 
];
pistolArray = compileFinal str
[
    // Handguns
    ["Glock 17", "CUP_hgun_Glock17", 30],
    ["M9", "CUP_hgun_M9", 30],
    ["Colt .45", "CUP_hgun_Colt1911", 30],
    ["PB6P9", "CUP_hgun_PB6P9", 10],
    ["CZ 75 Duty", "CUP_hgun_Duty", 20],
    ["CZ 75 Phantom", "CUP_hgun_Phantom", 20],
    ["Makarov (No Mods)", "CUP_hgun_Makarov", 20],
    ["Micro Uzi", "CUP_hgun_MicroUzi", 70],
    ["Jesus Christ (Pure Gold)", "CUP_hgun_TaurusTracker455_gold", 40],
    ["Sa-61 (No Mods)", "CUP_hgun_SA61", 50]
];
 
smgArray = compileFinal str
[
    ["MP5A5 (No Mods)", "CUP_smg_MP5A5", 70],
    ["MP5SD6 (No Mods)", "CUP_smg_MP5SD6", 90],
    ["Bizon PP-19", "CUP_smg_bizon", 70],
    ["AA-12", "CUP_sgun_AA12", 70],
    ["M1014", "CUP_sgun_M1014", 40],
    ["CZ Scorpion EVO", "CUP_smg_EVO", 60]
];
 
rifleArray = compileFinal str
[
    // Underwater Gun
    ["SDAR Underwater Rifle", "arifle_SDAR_F", 150],
 
    ["Izhmash Saiga12K", "CUP_sgun_Saiga12K", 50],
    ["M1014 Auto Shotgun", "CUP_sgun_M1014", 40],
    ["AA-12 Auto Shotgun", "CUP_sgun_AA12", 70],
//Russian
    ["AK-47", "CUP_arifle_AK47", 125],
    ["AK-74M", "CUP_arifle_AK74M", 150],
    ["AK-74M GL", "CUP_arifle_AK74M_GL", 180],
    ["AK-107", "CUP_arifle_AK107", 150],
    ["AK-107 GL", "CUP_arifle_AK107_GL", 180],
    ["AKS-74", "CUP_arifle_AKS74", 140],
    ["AKS-74U", "CUP_arifle_AKS74U", 150],
    ["AKM", "CUP_arifle_AKM", 130],
    ["AKS", "CUP_arifle_AKS", 130],
//US
    ["M16A2", "CUP_arifle_M16A2", 140],
    ["M16A4", "CUP_arifle_M16A4_Base", 140],
    ["M16A4 M203", "CUP_arifle_M16A4_GL", 150],
    ["M4A1 (Black)", "CUP_arifle_M4A1_black", 150],
    ["M4A1 (Camo)", "CUP_arifle_M4A1_camo", 150],
    ["M4A1 (Desert)", "CUP_arifle_M4A1_desert", 150],
    ["M4A1 M203 (Black)", "CUP_arifle_M4A1_BUIS_GL", 180],
    ["M4A1 M203 (Camo)", "CUP_arifle_M4A1_BUIS_camo_GL", 180],
    ["M4A1 M203 (Desert)", "CUP_arifle_M4A1_BUIS_desert_GL", 180],
    ["M4A3 (Desert)", "CUP_arifle_M4A3_desert", 150],  
    ["Mk.16 CQC", "CUP_arifle_Mk16_CQC", 180],
    ["Mk.16 CQC EGLM", "CUP_arifle_Mk16_CQC_EGLM", 210],
    ["Mk.16", "CUP_arifle_Mk16_STD", 190],
    ["Mk.16 EGLM", "CUP_arifle_Mk16_STD_EGLM", 220],
    ["Mk.16 Marksman", "CUP_arifle_Mk16_SV", 200],
    ["Mk.17 CQC", "CUP_arifle_Mk17_CQC", 210],
    ["Mk.17 CQC EGLM", "CUP_arifle_Mk17_CQC_EGLM", 240],
    ["Mk.17", "CUP_arifle_Mk17_STD", 220],
    ["Mk.17 EGLM", "CUP_arifle_Mk17_STD_EGLM", 250],
    ["Mk.17 Sniper", "CUP_arifle_Mk20", 230],
//Other
    ["G36C", "CUP_arifle_G36C", 200],
    ["G36C (Camo)", "CUP_arifle_G36C_camo", 500],
    ["FN FAL", "CUP_arifle_FNFAL_railed", 190],
    ["L85A2", "CUP_arifle_L85A2", 190],
    ["L85A2 GL", "CUP_arifle_L85A2_GL", 220],  
    ["Sa-58 RIS1", "CUP_arifle_Sa58RIS1", 150],
    ["Sa-58 RIS1 (Desert)", "CUP_arifle_Sa58RIS1_des", 150],
    ["Sa-58 RIS2", "CUP_arifle_Sa58RIS2", 150],
    ["Sa-58 RIS2 (Camo)", "CUP_arifle_Sa58RIS2_camo", 150],
    ["Sa-58 RIS2 GL", "CUP_arifle_Sa58RIS2_gl", 180],
// Sniper Rifles
 
    ["CZ550 Hunting Rifle", "CUP_srifle_CZ550", 250],
    ["Mk.12 SPR", "CUP_srifle_Mk12SPR", 200],
    ["Lee Enfield Bolt-Action Rifle(Rail)", "CUP_srifle_LeeEnfield_rail", 150],
    ["M14 DMR", "CUP_srifle_M14_DMR", 225],
    ["M110 Sniper Rifle", "CUP_srifle_M110", 250],
	["M24", "CUP_srifle_M24_wdl", 250],
	["M24 Desert", "CUP_srifle_M24_des", 250],
    ["L129A1 DMR", "CUP_srifle_L129A1", 250],
    ["G22 Scout Rifle", "CUP_srifle_G22_des", 280],
    ["CZ750 Scout Rifle", "CUP_srifle_CZ750", 250],
    ["L115/AWM .338 LRR (Desert)", "CUP_srifle_AWM_des", 400],
    ["L115/AWM .338 LRR (Camo)", "CUP_srifle_AWM_wdl", 400],
   
       
//Russian
   
    ["VSS Vintorez", "CUP_srifle_VSSVintorez", 200],
    ["SVD Dragunov", "CUP_srifle_SVD", 270],
    ["SVD Dragunov (Desert)", "CUP_srifle_SVD_des", 270]
];
 
lmgArray = compileFinal str
[
    ["M240B", "CUP_lmg_M240", 300],
    ["M249 Para", "CUP_lmg_m249_pip2", 250],
    ["M249 SAW", "CUP_lmg_m249_pip1", 250],
    ["Mk.48 (Desert)", "CUP_lmg_Mk48_des", 290],
    ["Mk.48 (Camo)", "CUP_lmg_Mk48_wdl", 290],
    ["M60E4", "CUP_lmg_M60E4", 280],
    ["PKP", "CUP_lmg_Pecheneg", 300],
    ["RPK-74", "CUP_arifle_RPK74_45", 230],
    ["RPK-74M", "CUP_arifle_RPK74M", 230],
    ["RPK-74 (Drum)", "CUP_arifle_RPK74", 230],
    ["L110A1 LMG", "CUP_lmg_L110A1", 250],
    ["FN Minimi", "CUP_lmg_minimi_railed", 250]
];
 
launcherArray = compileFinal str
[
    ["FGM-148 Javelin", "CUP_launch_Javelin", 2500],
    //["FIM-92F", "CUP_launch_FIM92Stinger", 1250],
    ["M136", "CUP_launch_M136", 650],
    //["M47 Dragon", "CUP_launch_M47", 2000],
    ["MAAWS", "CUP_launch_MAAWS", 1500],
    ["Mk153 SMAW", "CUP_launch_Mk153Mod0", 700],
    //["AT-13 Metis", "CUP_launch_Metis", 2500],
    ["RPG-18", "CUP_launch_RPG18", 600],  
    ["9K32 Strela", "CUP_launch_9K32Strela", 800],
    //["9K38 Igla", "CUP_launch_Igla", 800],
    ["RPG-7V", "CUP_launch_RPG7V", 300]
    //["NLAW", "CUP_launch_NLAW", 2000]
];
 
allGunStoreFirearms = compileFinal str (call pistolArray + call smgArray + call rifleArray + call lmgArray + call launcherArray);
 
staticGunsArray = compileFinal str
[
//BLU
    ["M2 Heavy MG Low Tripod", "CUP_B_M2StaticMG_MiniTripod_US", 350],
    ["M2 Heavy MG High Tripod", "CUP_B_M2StaticMG_US", 350],
    ["DSHkM Low Tripod", "CUP_B_DSHkM_MiniTriPod_CDF", 300],
    ["DSHkM High Tripod", "CUP_B_DSHKM_CDF", 300],
    ["AGS-30 Tripod", "CUP_B_AGS_CDF", 400],
    ["ZU-23 AA Emplacement", "CUP_B_ZU23_CDF", 450],
    ["Podnos 2B14 Mortar", "CUP_B_2b14_82mm_ACR", 4000],
 
//RED  
    ["KORD Heavy MG Low Tripod", "CUP_O_KORD_RU", 350],
    ["KORD Heavy MG High Tripod", "CUP_O_KORD_high_RU", 350],
    ["DSHkM Low Tripod", "CUP_O_DSHkM_MiniTriPod_ChDKZ", 300],
    ["DSHkM High Tripod", "CUP_O_DSHKM_ChDKZ", 300],
    ["AGS-30 Tripod", "CUP_O_AGS_ChDKZ", 400],
    ["ZU-23 AA Emplacement", "CUP_O_ZU23_RU", 450],
    ["Podnos 2B14 Mortar", "CUP_O_2b14_82mm_ChDKZ", 4000],
   
//INDY
    ["M2 Heavy MG Low Tripod", "CUP_I_M2StaticMG_MiniTripod_RACS", 350],
    ["M2 Heavy MG High Tripod", "CUP_I_M2StaticMG_RACS", 350],
    ["DSHkM Low Tripod", "CUP_B_DSHkM_MiniTriPod_NAPA", 300],
    ["DSHkM High Tripod", "CUP_I_DSHKM_NAPA", 300],
    ["AGS-30 Tripod", "CUP_I_AGS_UN", 400],
    ["ZU-23 AA Emplacement", "CUP_I_ZU23_NAPA", 450],
    ["Podnos 2B14 Mortar", "CUP_I_2b14_82mm_TK_GUE", 4000]
   
];
 
throwputArray = compileFinal str
[
    ["M67 Frag Grenade", "CUP_HandGrenade_M67", 20],
    ["M109A1 HE Grenade", "CUP_HandGrenade_L109A1_HE", 20],
    ["M109A2 HE Grenade", "CUP_HandGrenade_L109A2_HE", 20],
    ["RGD-5 Grenade", "CUP_HandGrenade_RGD5", 20],
    ["RGO Grenade", "CUP_HandGrenade_RGO", 20],
 
    ["APERS Tripwire Mine", "APERSTripMine_Wire_Mag", 50],
    ["APERS Bounding Mine", "APERSBoundingMine_Range_Mag", 75],
    ["APERS Mine", "APERSMine_Range_Mag", 75],
    ["Claymore Charge", "ClaymoreDirectionalMine_Remote_Mag", 75],
    ["M6 SLAM Mine", "SLAMDirectionalMine_Wire_Mag", 90],
    ["AT Mine", "ATMine_Range_Mag", 90],
    ["Explosive Charge", "DemoCharge_Remote_Mag", 100],
    ["Explosive Satchel", "SatchelCharge_Remote_Mag", 200],
    ["Smoke Grenade (White)", "SmokeShell", 10],
    ["Smoke Grenade (Purple)", "SmokeShellPurple", 10],
    ["Smoke Grenade (Blue)", "SmokeShellBlue", 10],
    ["Smoke Grenade (Green)", "SmokeShellGreen", 10],
    ["Smoke Grenade (Yellow)", "SmokeShellYellow", 10],
    ["Smoke Grenade (Orange)", "SmokeShellOrange", 100],
    ["Smoke Grenade (Red)", "SmokeShellRed", 10]
];
 
//Gun Store Ammo List
//Text name, classname, buy cost
ammoArray = compileFinal str
[
/*
    ["9mm 10Rnd Mag", "10Rnd_9x21_Mag", 5],
    ["9mm 16Rnd Mag", "16Rnd_9x21_Mag", 5],
    ["9mm 30Rnd Mag", "30Rnd_9x21_Mag", 15],
    ["9mm 30Rnd SMG Mag", "30Rnd_9x21_Mag_SMG_02", 15],
   
    [".45 ACP 6Rnd Cylinder", "6Rnd_45ACP_Cylinder", 10],
    [".45 ACP 9Rnd Mag", "9Rnd_45ACP_Mag", 15],
    [".45 ACP 11Rnd Mag", "11Rnd_45ACP_Mag", 20],
    [".45 ACP 30Rnd Vermin Mag", "30Rnd_45ACP_MAG_SMG_01", 30],
    [".45 ACP 30Rnd Tracer (Green) Mag", "30Rnd_45ACP_Mag_SMG_01_tracer_green", 30],
   
    ["5.45mm 30Rnd Mag", "30Rnd_545x39_Mag_F", 20],
    ["5.45mm 30Rnd Tracer (Yellow) Mag", "30Rnd_545x39_Mag_Tracer_F", 20],
    ["5.45mm 30Rnd Tracer (Green) Mag", "30Rnd_545x39_Mag_Tracer_Green_F", 20],
   
	["5.56mm 20Rnd Underwater Mag", "20Rnd_556x45_UW_mag", 20],
    ["5.56mm 30Rnd STANAG Mag", "30Rnd_556x45_Stanag", 20],
    ["5.56mm 30Rnd Tracer (Green) Mag", "30Rnd_556x45_Stanag_Tracer_Green", 60],
    ["5.56mm 30Rnd Tracer (Yellow) Mag", "30Rnd_556x45_Stanag_Tracer_Yellow", 60],
    ["5.56mm 30Rnd Tracer (Red) Mag", "30Rnd_556x45_Stanag_Tracer_Red", 60],
    ["5.56mm 150Rnd Mag", "150Rnd_556x45_Drum_Mag_F", 300],
    ["5.56mm 150Rnd Tracer (Red) Mag", "150Rnd_556x45_Drum_Mag_Tracer_F", 300],
    ["5.56mm 200Rnd Box", "200Rnd_556x45_Box_F", 400],
    ["5.56mm 200Rnd Tracer (Yellow) Box", "200Rnd_556x45_Box_Tracer_F", 400],
    ["5.56mm 200Rnd Tracer (Red) Box", "200Rnd_556x45_Box_Tracer_Red_F", 400],
   
    ["5.8mm 30Rnd Mag", "30Rnd_580x42_Mag_F", 60],
    ["5.8mm 30Rnd Tracer (Green) Mag", "30Rnd_580x42_Mag_Tracer_F", 60],
    ["5.8mm 100Rnd Mag", "100Rnd_580x42_Mag_F", 200],
    ["5.8mm 100Rnd Tracer (Green) Mag", "100Rnd_580x42_Mag_Tracer_F", 200],
   
    ["6.5mm 20Rnd Mag", "20Rnd_650x39_Cased_Mag_F", 40],
    ["6.5mm 30Rnd STANAG Mag", "30Rnd_65x39_caseless_mag", 60],
    ["6.5mm 30Rnd Tracer (Red) Mag", "30Rnd_65x39_caseless_mag_Tracer", 60],
    ["6.5mm 30Rnd Caseless Mag", "30Rnd_65x39_caseless_green", 60],
    ["6.5mm 30Rnd Tracer (Green) Mag", "30Rnd_65x39_caseless_green_mag_Tracer", 60],
    ["6.5mm 100Rnd Belt Case", "100Rnd_65x39_caseless_mag", 200],
    ["6.5mm 100Rnd Tracer (Red) Belt Case", "100Rnd_65x39_caseless_mag_Tracer", 200],
    ["6.5mm 200Rnd Belt Case", "200Rnd_65x39_cased_Box", 400],
    ["6.5mm 200Rnd Tracer (Yellow) Belt Case", "200Rnd_65x39_cased_Box_Tracer", 400],
   
    ["7.62mm 10Rnd Mag", "10Rnd_762x54_Mag", 30],
    ["7.62mm 20Rnd Mag", "20Rnd_762x51_Mag", 60],
    ["7.62mm 30Rnd Mag", "30Rnd_762x39_Mag_F", 90],
    ["7.62mm 30Rnd Tracer (Yellow) Mag", "30Rnd_762x39_Mag_Tracer_F", 90],
    ["7.62mm 30Rnd Tracer (Green) Mag", "30Rnd_762x39_Mag_Tracer_Green_F", 90],
    ["7.62mm 150Rnd Box", "150Rnd_762x54_Box", 450],
    ["7.62mm 150Rnd Tracer (Green) Box", "150Rnd_762x54_Box_Tracer", 450],
   
    [".408 7Rnd Cheetah Mag", "7Rnd_408_Mag", 50],
   
    ["12.7mm 5Rnd Mag", "5Rnd_127x108_Mag", 50],
    ["12.7mm 5Rnd Armor-Piercing Mag", "5Rnd_127x108_APDS_Mag", 75],
    ["12.7mm 10Rnd Mag [DLC]", "10Rnd_127x54_Mag", 50],
   
    [".50 BW 10Rnd Mag", "10Rnd_50BW_Mag_F", 50],
   
    ["PG-7VM HEAT Rocket", "RPG7_F", 300],                   // Direct damage: medium    | Splash damage: low    | Guidance: none
   
    ["RPG-42 Anti-Tank Rocket", "RPG32_F", 400],              // Direct damage: high      | Splash damage: low    | Guidance: none
    ["RPG-42 High-Explosive Rocket", "RPG32_HE_F", 400],      // Direct damage: medium    | Splash damage: medium | Guidance: none
   
    ["PCML Anti-Tank Missile", "NLAW_F", 750],                // Direct damage: very high | Splash damage: low    | Guidance: laser, ground vehicles
   
    ["Titan Anti-Tank Missile", "Titan_AT", 1000],             // Direct damage: high      | Splash damage: low    | Guidance: mouse, laser, ground vehicles  
    ["Titan Anti-Personnel Missile", "Titan_AP", 1000],        // Direct damage: low       | Splash damage: high   | Guidance: mouse, laser
    ["Titan Anti-Air Missile", "Titan_AA", 1000],   // Direct damage: low       | Splash damage: medium | Guidance: aircraft
    */
   
    //5.45mm - 5.56mm = $2 per round
	["5.56mm 20Rnd Underwater Mag", "20Rnd_556x45_UW_mag", 20],
    ["5.45mm 30Rnd Mag", "CUP_30Rnd_545x39_AK_M", 20],
    ["5.45mm 30Rnd Tracer Mag (Green)", "CUP_30Rnd_TE1_Green_Tracer_545x39_AK_M", 20],
    ["5.45mm 30Rnd Tracer Mag (Green)", "CUP_30Rnd_TE1_Red_Tracer_545x39_AK_M", 20],
    ["5.45mm 30Rnd Tracer Mag (Green)", "CUP_30Rnd_TE1_White_Tracer_545x39_AK_M", 20],
    ["5.45mm 30Rnd Tracer Mag (Green)", "CUP_30Rnd_TE1_Yellow_Tracer_545x39_AK_M", 20],
    ["5.45mm 30Rnd Subsonic Mag", "CUP_30Rnd_Subsonic_545x39_AK_M", 20],
    ["5.45mm 75Rnd RPK Tracer Drum (Green)", "CUP_75Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M", 50],
    ["5.45mm 45Rnd RPK Tracer Mag (Green)", "CUP_45Rnd_TE4_LRT4_Green_Tracer_545x39_RPK_M", 40],
    [".22LR 5Rnd Hunting Rifle Mag", "CUP_5x_22_LR_17_HMR_M", 40],
    ["5.56mm 30Rnd STANAG", "CUP_30Rnd_556x45_Stanag", 20],
    ["5.56mm 30Rnd G36 Mag", "CUP_30Rnd_556x45_G36", 20],
    ["5.56mm 30Rnd G36 Tracer Mag(Red)", "CUP_30Rnd_TE1_Red_Tracer_556x45_G36", 20],
    ["5.56mm 30Rnd G36 Tracer Mag(Red)", "CUP_30Rnd_TE1_Green_Tracer_556x45_G36", 20],
    ["5.56mm 30Rnd G36 Tracer Mag(Red)", "CUP_30Rnd_TE1_Yellow_Tracer_556x45_G36", 20],
    ["5.56mm 100Rnd BetaC Mag", "CUP_100Rnd_556x45_BetaCMag", 60],
    ["5.56mm 100Rnd BetaC Tracer Mag (Red)", "CUP_100Rnd_TE1_Red_Tracer_556x45_BetaCMag", 60],
    ["5.56mm 100Rnd BetaC Tracer Mag (Red)", "CUP_100Rnd_TE1_Green_Tracer_556x45_BetaCMag", 60],
    ["5.56mm 100Rnd BetaC Tracer Mag (Red)", "CUP_100Rnd_TE1_Yellow_Tracer_556x45_BetaCMag", 60],
    ["5.56mm 200Rnd M249 Tracer Belt (Green)", "CUP_200Rnd_TE4_Green_Tracer_556x45_M249", 120],
    ["5.56mm 200Rnd M249 Tracer Belt (Red)", "CUP_200Rnd_TE4_Red_Tracer_556x45_M249", 120],
    ["5.56mm 200Rnd M249 Tracer Belt (Yellow)", "CUP_200Rnd_TE4_Yellow_Tracer_556x45_M249", 120],
    ["5.56mm 200Rnd M249 Tracer Belt (Red)", "CUP_200Rnd_TE1_Red_Tracer_556x45_M249", 120],
    ["5.56mm 100Rnd M249 Tracer Belt (Green)", "CUP_100Rnd_TE4_Green_Tracer_556x45_M249", 60],
    ["5.56mm 100Rnd M249 Tracer Belt (Red)", "CUP_100Rnd_TE4_Red_Tracer_556x45_M249", 60],
    ["5.56mm 100Rnd M249 Tracer Belt (Yellow)", "CUP_100Rnd_TE4_Yellow_Tracer_556x45_M249", 60],
    ["5.56mm 200Rnd L110A1 Tracer Belt (Green)", "CUP_200Rnd_TE4_Green_Tracer_556x45_L110A1", 120],
    ["5.56mm 200Rnd L110A1 Tracer Belt (Red)", "CUP_200Rnd_TE4_Red_Tracer_556x45_L110A1", 120],
    ["5.56mm 200Rnd L110A1 Tracer Belt (Yellow)", "CUP_200Rnd_TE4_Yellow_Tracer_556x45_L110A1", 120],
   
    //Battle Rifle = $3 per round
   
    [".303 10Rnd Mag", "CUP_10x_303_M", 30],
   
    ["7.62mm 30Rnd AK Mag", "CUP_30Rnd_762x39_AK47_M", 25],
    ["7.62mm 30Rnd Sa58 Mag", "CUP_30Rnd_Sa58_M", 30],
    ["7.62mm 30Rnd Sa58 Tracer Mag", "CUP_30Rnd_Sa58_M_TracerG", 30],
    ["7.62mm 20Rnd FN FAL Mag", "CUP_20Rnd_762x51_FNFAL_M", 30],
    ["7.62mm 20Rnd L129 Mag", "CUP_20Rnd_762x51_L129_M", 30],
    ["7.62mm 20Rnd Mk.17 Mag", "CUP_20Rnd_762x51_B_SCAR", 30],
    ["7.62mm 20Rnd Mk.17 Tracer Mag (Yellow)", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_SCAR", 30],
    ["7.62mm 20Rnd Mk.17 Tracer Mag (Yellow)", "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR", 30],
    ["7.62mm 20Rnd Mk.17 Tracer Mag (Yellow)", "CUP_20Rnd_TE1_Green_Tracer_762x51_SCAR", 30],
    ["7.62mm 20Rnd Mk.17 Tracer Mag (Yellow)", "CUP_20Rnd_TE1_White_Tracer_762x51_SCAR", 30],
    ["7.62mm 100Rnd Tracer Belt (White)", "CUP_100Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M", 90],
    ["7.62mm 100Rnd Tracer Belt (Red)", "CUP_100Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", 90],
    ["7.62mm 200Rnd Tracer Belt (White)", "CUP_200Rnd_TE4_LRT4_White_Tracer_762x51_Belt_M", 600],
    ["7.62mm 200Rnd Tracer Belt (Red)", "CUP_200Rnd_TE4_LRT4_Red_Tracer_762x51_Belt_M", 600],
    ["7.62mm 100Rnd PK Tracer Belt (Green)", "CUP_100Rnd_TE4_LRT4_762x54_PK_Tracer_Green_M", 60],
   
   
    //Marksman ammo = $4 per round
    ["7.62mm 20Rnd M110 Mag", "CUP_20Rnd_762x51_B_M110", 30],
    ["7.62mm 20Rnd M110 Mag", "CUP_20Rnd_762x51_DMR", 30],
    ["7.62mm 20Rnd M110 Tracer Mag (Yellow)", "CUP_20Rnd_TE1_Yellow_Tracer_762x51_M110", 30],
    ["7.62mm 20Rnd M110 Tracer Mag (Red)", "CUP_20Rnd_TE1_Red_Tracer_762x51_M110", 30],
    ["7.62mm 20Rnd M110 Tracer Mag (Green)", "CUP_20Rnd_TE1_Green_Tracer_762x51_M110", 30],
    ["7.62mm 20Rnd M110 Tracer Mag (White)", "CUP_20Rnd_TE1_White_Tracer_762x51_M110", 30],
    ["7.62mm 10Rnd CZ750 Mag", "CUP_10Rnd_762x51_CZ750", 30],
    ["7.62mm 10Rnd CZ750 Tracer Mag (Red)", "CUP_10Rnd_762x51_CZ750_Tracer", 30],
    ["7.62mm 5Rnd G22 Mag", "CUP_5Rnd_762x67_G22", 40],
    ["7.62mm 5Rnd SVD Mag", "CUP_10Rnd_762x54_SVD_M", 30],
    ["7.62mm 5Rnd M24 Mag", "CUP_5Rnd_762x51_M24", 30],
   
   
    //Anti-personelle/material ammo = $10 per round
    [".338 5Rnd Lapua Mag", "CUP_5Rnd_86x70_L115A1", 50],
    ["12.7mm 5Rnd KSVK Mag", "CUP_5Rnd_127x108_KSVK_M", 50],
    ["12.7mm 5Rnd AS50 Mag", "CUP_5Rnd_127x99_as50_M", 50],
    ["12.7mm 10Rnd M107 Mag", "CUP_10Rnd_127x99_M107", 100],
   
   
    //Shozza ammo = ~$4 per cartridge
    ["8Rnd Saiga-12 Slugs", "CUP_8Rnd_B_Saiga12_74Slug_M", 10],
    ["8Rnd Saiga-12 Pellet", "CUP_8Rnd_B_Saiga12_74Pellets_M", 10],
   
    ["8Rnd M1014 Slugs", "CUP_8Rnd_B_Beneli_74Slug", 10],
    ["8Rnd M1014 Pellet", "CUP_8Rnd_B_Beneli_74Pellets", 10],
   
    ["20Rnd AA12 Slugs", "CUP_20Rnd_B_AA12_74Slug", 10],
   
    //All pistol/smg ammo = $1 per round
    ["9mm 64Rnd Bizon Mag", "CUP_64Rnd_9x19_Bizon_M", 25],
    ["9mm 64Rnd Bizon Tracer Mag (Green)", "CUP_64Rnd_Green_Tracer_9x19_Bizon_M", 25],
    ["9mm 64Rnd Bizon Tracer Mag (Red)", "CUP_64Rnd_Red_Tracer_9x19_Bizon_M", 25],
    ["9mm 64Rnd Bizon Tracer Mag (White)", "CUP_64Rnd_White_Tracer_9x19_Bizon_M", 25],
    ["9mm 64Rnd Bizon Tracer Mag (Yellow)", "CUP_64Rnd_Yellow_Tracer_9x19_Bizon_M", 25],
    ["9mm 30Rnd MP5 Mag", "CUP_30Rnd_9x19_MP5", 15],
    ["9mm 30Rnd EVO Mag", "CUP_30Rnd_9x19_EVO", 10],
    ["9mm 30Rnd Uzi Mag", "CUP_30Rnd_9x19_UZI", 15],
    ["9mm 10Rnd VSS Mag", "CUP_10Rnd_9x39_SP5_VSS_M", 10],
    ["9mm 20Rnd VSS Mag", "CUP_20Rnd_9x39_SP5_VSS_M", 20],
    ["9mm 8Rnd Makarov Clip", "CUP_8Rnd_9x18_Makarov_M", 5],
    ["9mm 8Rnd Makarov Subsonic Clip", "CUP_8Rnd_9x18_MakarovSD_M", 5],
    ["9mm 17Rnd Glock17 Mag", "CUP_17Rnd_9x19_glock17", 5],
    ["9mm 10Rnd Compact Mag", "CUP_10Rnd_9x19_Compact", 10],
    ["9mm 18Rnd Phantom Mag", "CUP_18Rnd_9x19_Phantom", 5],
    ["9mm 15Rnd M9 Mag", "CUP_15Rnd_9x19_M9", 5],
   
    ["7.65mm 10Rnd Sa-61 Mag", "CUP_10Rnd_B_765x17_Ball_M", 15],
    ["7.65mm 20Rnd Sa-61 Mag", "CUP_20Rnd_B_765x17_Ball_M", 15],
   
    [".45 ACP 6Rnd Reloader", "CUP_6Rnd_45ACP_M", 5],
    [".45 ACP 7Rnd Clip", "CUP_7Rnd_45ACP_1911", 5],
   
    //Tube-launcher grenades = $100 each, smoke or flares = $50 each
    ["GP25 HE Shell 1Rnd", "CUP_1Rnd_HE_GP25_M", 25],
    ["GP25 Flare (White) 1Rnd", "CUP_FlareWhite_GP25_M", 25],
    ["GP25 Flare (Green) 1Rnd", "CUP_FlareGreen_GP25_M", 25],
    ["GP25 Flare (Red) 1Rnd", "CUP_FlareRed_GP25_M", 25],
    ["GP25 Flare (Yellow) 1Rnd", "CUP_FlareYellow_GP25_M", 25],
    ["GP25 Illumination Flare (White) 1Rnd", "CUP_IlumFlareWhite_GP25_M", 25],
    ["GP25 Illumination Flare (Red) 1Rnd", "CUP_IlumFlareRed_GP25_M", 25],
    ["GP25 Illumination Flare (Green) 1Rnd", "CUP_IlumFlareGreen_GP25_M", 50],
    ["GP25 Smoke (White) 1Rnd", "CUP_1Rnd_SMOKE_GP25_M", 25],
    ["GP25 Smoke (Red) 1Rnd", "CUP_1Rnd_SmokeRed_GP25_M", 25],
    ["GP25 Smoke (Green) 1Rnd", "CUP_1Rnd_SmokeGreen_GP25_M", 25],
    ["GP25 Smoke (Yellow) 1Rnd", "CUP_1Rnd_SmokeYellow_GP25_M", 25],
   
    ["G630 6Rnd HE Shells", "CUP_6Rnd_HE_GP25_M", 600],
    ["M203 HE Shell 1Rnd", "CUP_1Rnd_HE_M203", 25],
    ["M203 HEDP Shell 1Rnd", "CUP_1Rnd_HEDP_M203", 25],
    ["Mk. 13 1Rnd HE Shell", "1Rnd_HE_Grenade_shell", 100],
    ["M203 Star Cluster (White) 1Rnd", "CUP_1Rnd_StarCluster_White_M203", 25],
    ["M203 Star Cluster (Red) 1Rnd", "CUP_1Rnd_StarCluster_Red_M203", 25],
    ["M203 Star Cluster (Green) 1Rnd", "CUP_1Rnd_StarCluster_Green_M203", 25],
    ["M203 Star Flare (White) 1Rnd", "CUP_1Rnd_StarFlare_White_M203", 25],
    ["M203 Star Flare (Red) 1Rnd", "CUP_1Rnd_StarFlare_Red_M203", 25],
    ["M203 Star Flare (Green) 1Rnd", "CUP_1Rnd_StarFlare_Green_M203", 25],
    ["M203 Flare (White) 1Rnd", "CUP_FlareWhite_M203", 25],
    ["M203 Flare (Green) 1Rnd", "CUP_FlareGreen_M203", 25],
    ["M203 Flare (Red) 1Rnd", "CUP_FlareRed_M203", 25],
    ["M203 Flare (Yellow) 1Rnd", "CUP_FlareYellow_M203", 25],
    ["M203 Smoke (White) 1Rnd", "CUP_1Rnd_Smoke_M203", 25],
    ["M203 Smoke (Red) 1Rnd", "CUP_1Rnd_SmokeRed_M203", 25],
    ["M203 Smoke (Green) 1Rnd", "CUP_1Rnd_SmokeGreen_M203", 25],
    ["M203 Smoke (Yellow) 1Rnd", "CUP_1Rnd_SmokeYellow_M203", 25],
    ["40mm UGL Flare (White)", "UGL_FlareWhite_F", 50],
    ["40mm UGL Flare (Green)", "UGL_FlareGreen_F", 50],
    ["40mm UGL Flare (Red)", "UGL_FlareRed_F", 50],
    ["40mm UGL Flare (Yellow)", "UGL_FlareYellow_F", 50],
    ["40mm UGL Flare (IR)", "UGL_FlareCIR_F", 50],
    ["40mm Smoke Shell 1Rnd (White)", "1Rnd_Smoke_Grenade_shell", 50],
    ["40mm Smoke Shell 1Rnd (Red)", "1Rnd_SmokeRed_Grenade_shell", 50],
    ["40mm Smoke Shell 1Rnd (Green)", "1Rnd_SmokeGreen_Grenade_shell", 50],
    ["40mm Smoke Shell 1Rnd (Yellow)", "1Rnd_SmokeYellow_Grenade_shell", 50],
    ["40mm Smoke Shell 1Rnd (Purple)", "1Rnd_SmokePurple_Grenade_shell", 50],
    ["40mm Smoke Shell 1Rnd (Blue)", "1Rnd_SmokeBlue_Grenade_shell", 50],
    ["40mm Smoke Shell 1Rnd (Orange)", "1Rnd_SmokeOrange_Grenade_shell", 50],
    ["40mm HE Grenade Round", "1Rnd_HE_Grenade_shell", 25],
    ["40mm 3Rnd HE Grenades", "3Rnd_HE_Grenade_shell", 300],
    ["40mm Smoke Round (White)", "1Rnd_Smoke_Grenade_shell", 50],
    ["40mm Smoke Round (Purple)", "1Rnd_SmokePurple_Grenade_shell", 50],
    ["40mm Smoke Round (Blue)", "1Rnd_SmokeBlue_Grenade_shell", 50],
    ["40mm Smoke Round (Green)", "1Rnd_SmokeGreen_Grenade_shell", 50],
    ["40mm Smoke Round (Yellow)", "1Rnd_SmokeYellow_Grenade_shell", 50],
    ["40mm Smoke Round (Orange)", "1Rnd_SmokeOrange_Grenade_shell", 50],
    ["40mm Smoke Round (Red)", "1Rnd_SmokeRed_Grenade_shell", 50],
    ["40mm 3Rnd Smokes (White)", "3Rnd_Smoke_Grenade_shell", 150],
    ["40mm 3Rnd Smokes (Purple)", "3Rnd_SmokePurple_Grenade_shell", 150],
    ["40mm 3Rnd Smokes (Blue)", "3Rnd_SmokeBlue_Grenade_shell", 150],
    ["40mm 3Rnd Smokes (Green)", "3Rnd_SmokeGreen_Grenade_shell", 150],
    ["40mm 3Rnd Smokes (Yellow)", "3Rnd_SmokeYellow_Grenade_shell", 150],
    ["40mm 3Rnd Smokes (Orange)", "3Rnd_SmokeOrange_Grenade_shell", 150],
    ["40mm 3Rnd Smokes (Red)", "3Rnd_SmokeRed_Grenade_shell", 150],
    ["40mm Flare Round (White)", "UGL_FlareWhite_F", 50],
    ["40mm Flare Round (Green)", "UGL_FlareGreen_F", 50],
    ["40mm Flare Round (Yellow)", "UGL_FlareYellow_F", 50],
    ["40mm Flare Round (Red)", "UGL_FlareRed_F", 50],
    ["40mm Flare Round (IR)", "UGL_FlareCIR_F", 50],
    ["40mm 3Rnd Flares (White)", "3Rnd_UGL_FlareWhite_F", 150],
    ["40mm 3Rnd Flares (Green)", "3Rnd_UGL_FlareGreen_F", 150],
    ["40mm 3Rnd Flares (Yellow)", "3Rnd_UGL_FlareYellow_F", 150],
    ["40mm 3Rnd Flares (Red)", "3Rnd_UGL_FlareRed_F", 150],
    ["40mm 3Rnd Flares (IR)", "3Rnd_UGL_FlareCIR_F", 150],
   
    //High-impact Homing missiles = $1k each, low-impact homing (NLAW,9K32) or wire-guided (M47) = $750, unguided = $400
    ["9K32 Strela-2 Missile", "CUP_Strela_2_M", 350],
    //["9K38 Igla Missile", "CUP_Igla_M", 350],
    //["FIM-92F Stinger Missile", "CUP_Stinger_M", 500],
    ["FGM-148 Javelin Missile", "CUP_Javelin_M", 1000],
    ["M136 Rocket", "CUP_M136_M", 250],
    //["M47 Dragon Missile", "CUP_Dragon_EP1_M", 750],
    ["MAAWS HEDP Rocket", "CUP_MAAWS_HEDP_M", 400],
    ["MAAWS HEAT Rocket", "CUP_MAAWS_HEAT_M", 400],
    //["AT-13 Metis Missile", "CUP_AT13_M", 1000],
    //["NLAW Guided Rocket", "CUP_NLAW_M", 750],
   
    ["PG7VL Rocket", "CUP_PG7VL_M", 200],
    ["PG7VR Rocket", "CUP_PG7VR_M", 200],
    ["TPG7V Rocket", "CUP_TBG7V_M", 200],
   
    ["PG18 Rocket", "CUP_RPG18_M", 250],
    ["PG7V Rocket", "CUP_PG7V_M", 100],
    ["OG7 Rocket", "CUP_OG7_M", 200],
    ["SMAW HEDP Rocket", "CUP_SMAW_HEDP_M", 250],
    ["SMAW HEAA Rocket", "CUP_SMAW_HEAA_M", 250]  
   
];
 
//Gun Store item List
//Text name, classname, buy cost, item class
accessoriesArray = compileFinal str
[
    //Suppressors
    //Handguns
    ["General 9mm Suppressor", "muzzle_snds_L", 50, "item"],
    ["M9 9mm Suppressor", "CUP_muzzle_snds_M9", 50, "item"],
    ["General .45 ACP Suppressor", "muzzle_snds_acp", 50, "item"],
    ["MicroUzi 9mm Suppressor", "CUP_muzzle_snds_MicroUzi", 50, "item"],
 
    //Rifles & LMGs
    ["FN/CZ/M249 5.56mm Suppressor", "muzzle_snds_M", 50, "item"],
    ["FN/CZ/M24 7.62mm Suppressor", "muzzle_snds_B", 75, "item"],
   
    ["G36 Suppressor (Black)", "CUP_muzzle_snds_G36_black", 50, "item"],
    ["G36 Suppressor (Desert)", "CUP_muzzle_snds_G36_desert", 50, "item"],
   
    ["L85A2 Suppressor", "CUP_muzzle_snds_L85", 50, "item"],
    ["M110 7.62mm Suppressor", "CUP_muzzle_snds_M110", 75, "item"],
    ["Mk.12 SPR 5.56mm Suppressor", "CUP_muzzle_snds_Mk12", 50, "item"],
    ["M16/M4 5.56mm Suppressor", "CUP_muzzle_snds_M16_camo", 50, "item"],
    ["Mk.16/SCAR-L 5.56mm Suppressor", "CUP_muzzle_snds_SCAR_L", 50, "item"],
    ["Mk.17/SCAR-H 7.62mm Suppressor", "CUP_muzzle_snds_SCAR_H", 75, "item"],
    ["M24 7.62mm Suppressor (Black)", "muzzle_snds_B", 75, "item"],
    ["M24 7.62mm Suppressor (Camo)", "muzzle_snds_B_khk_F", 75, "item"],
    ["M24 7.62mm Suppressor (Desert)", "muzzle_snds_B_snd_F", 75, "item"],
   
   
    ["PBS-1 Suppressor", "CUP_muzzle_Bizon", 75, "item"],
    ["PBS-4 Suppressor", "CUP_muzzle_PBS4", 75, "item"],
 
//Ghillie
    ["M24/M40 Ghillie Wrap", "CUP_Mxx_camo", 10, "item"],
    ["M24/M40 Ghillie Half-Wrap", "CUP_Mxx_camo_half", 10, "item"],
   
    ["SVD Dragunov Ghillie Wrap (Green)", "CUP_SVD_camo_g", 10, "item"],
    ["SVD Dragunov Ghillie Wrap (Desert)", "CUP_SVD_camo_d", 10, "item"],
    ["SVD Dragunov Ghillie Half-Wrap (Green)", "CUP_SVD_camo_g_half", 10, "item"],
    ["SVD Dragunov Ghillie Half-Wrap (Desert)", "CUP_SVD_camo_d_half", 10, "item"],
   
//Sights
//Picatinny Rail Mount (NATO)
    ["EoTech Holo (Black)", "CUP_optic_HoloBlack", 5, "item"],
    ["EoTech Holo (Camo)", "CUP_optic_HoloWdl", 5, "item"],
    ["EoTech Holo (Desert)", "CUP_optic_HoloDesert", 5, "item"],
    ["Trijicon RDS (Black)", "CUP_optic_TrijiconRx01_black", 5, "item"],
    ["Trijicon RDS (Desert)", "CUP_optic_TrijiconRx01_desert", 5, "item"],
   
    ["M68 CCO CompM2 (Black)", "CUP_optic_CompM2_Black", 10, "item"],
    ["M68 CCO CompM2 (Camo)", "CUP_optic_CompM2_Woodland", 10, "item"],
    ["M68 CCO CompM2 (Desert)", "CUP_optic_CompM2_Desert", 10, "item"],
    ["Trijicon ACOG (Black)", "CUP_optic_RCO", 10, "item"],
    ["Trijicon ACOG (Desert)", "CUP_optic_RCO_desert", 10, "item"],
    ["Trijicon ACOG TA31F", "CUP_optic_ACOG", 15, "item"],
 
    ["Elcan Optic Reflex", "CUP_optic_Elcan_reflex", 15, "item"],
    ["Schmidt and Bender 1.1-4x20", "CUP_optic_SB_11_4x20_PM", 15, "item"],
    ["Leupold Mk4 MR/T (Tan)", "CUP_optic_LeupoldMk4_MRT_tan", 20, "item"],
   
    ["L9A1 SUSAT", "CUP_optic_SUSAT", 15, "item"],
    ["Leupold VX-3 LROS", "CUP_optic_Leupold_VX3", 25, "item"],
    ["Leupold Mark 4 MR/T", "CUP_optic_LeupoldM3LR", 25, "item"],
    ["Leupold Mark 4 LR/T (Desert)", "CUP_optic_LeupoldMk4_10x40_LRT_Desert", 25, "item"],
    ["Leupold Mark 4 LR/T (Woodland)", "CUP_optic_LeupoldMk4_10x40_LRT_Woodland", 25, "item"],
    ["Schmidt and Bender PM II", "CUP_optic_SB_3_12x50_PMII", 25, "item"],
   
    //Special
   
    ["AN/PVS-10 NV Sight", "CUP_optic_AN_PVS_10", 20, "item"],
    ["AN/PVS-4 Long-Range NV Sight", "CUP_optic_AN_PVS_4", 20, "item"],
   
   
    //Launcher Scopes
    ["MAAWS Optical Sight", "CUP_optic_MAAWS_Scope", 15, "item"],
    ["SMAW Optical Sight", "CUP_optic_SMAW_Scope", 15, "item"],
 
//RU
    ["Kobra Reflex Sight", "CUP_optic_Kobra", 5, "item"],
   
    ["PSO-1 Scope", "CUP_optic_PSO_1", 15, "item"],
    ["PSO-3 Scope", "CUP_optic_PSO_3", 20, "item"],
    ["Pecheneg 1P78 Scope", "CUP_optic_PechenegScope", 15, "item"],
   
    //Special
    ["1PN34 NSPU Scope", "CUP_optic_NSPU", 20, "item"],
   
   
    //Launcher Scopes
    ["PGO-7V RPG Sight", "CUP_optic_PGO7V", 15, "item"],
    ["PGO-7V2 RPG Sight", "CUP_optic_PGO7V2", 15, "item"],
    ["PGO-7V3 RPG Sight", "CUP_optic_PGO7V3", 15, "item"],
    ["1PN58 NSPU (RPG)", "CUP_optic_NSPU_RPG", 15, "item"],
   
//Barrel Attachments
    ["AN/PEQ-2 Laser (Black)", "CUP_acc_ANPEQ_2", 5, "item"],
    ["AN/PEQ-2 Laser (Camo)", "CUP_acc_ANPEQ_2_camo", 5, "item"],
    ["AN/PEQ-2 Laser (Desert)", "CUP_acc_ANPEQ_2_desert", 5, "item"],
    ["AN/PEQ-2 Laser (Grey)", "CUP_acc_ANPEQ_2_grey", 5, "item"],
    ["RIS Flashlight (Black)", "CUP_acc_Flashlight", 5, "item"],
    ["RIS Flashlight (Camo)", "CUP_acc_Flashlight_wdl", 5, "item"],
    ["RIS Flashlight (Desert)", "CUP_acc_Flashlight_desert", 5, "item"],
   
//Bipods
   
    ["Bipod (Black) (AAF) [DLC]", "bipod_03_F_blk", 5, "item"],
    ["Bipod (Black) (CSAT) [DLC]", "bipod_02_F_blk", 5, "item"],
    ["Bipod (Black) (NATO) [DLC]", "bipod_01_F_blk", 5, "item"],
    ["Bipod (Hex) (CSAT) [DLC]", "bipod_02_F_hex", 5, "item"],
    ["Bipod (MTP) (NATO) [DLC]", "bipod_01_F_mtp", 5, "item"],
    ["Bipod (Olive) (AAF) [DLC]", "bipod_03_F_oli", 5, "item"],
    ["Bipod (Sand) (NATO) [DLC]", "bipod_01_F_snd", 5, "item"],
    ["Bipod (Tan) (CSAT) [DLC", "bipod_02_F_tan", 5, "item"],
    ["Bipod (Khaki)", "bipod_01_F_khk", 5, "item"],
    ["Harris 1A2-L Bipod (Worn)", "CUP_bipod_Harris_1A2_L", 5, "item"],
    ["VLTOR Modpod Bipod (Tan)", "CUP_bipod_VLTOR_Modpod", 5, "item"]
 
];
 
// If commented, means the color/camo isn't implemented or is a duplicate of another hat
headArray = compileFinal str
[
    // Stratis Original
   
//CUP Additions
    ["USMC ACVC Helmet (Camo)", "CUP_H_USMC_ACVC_WDL", 25, "hat"],
    ["USMC ACVC Helmet (Desert)", "CUP_H_USMC_ACVC_DES", 25, "hat"],
    ["USMC MICH 2000 (Camo)", "CUP_H_USMC_MICH2000_DEF_ESS_WDL", 25, "hat"],
    ["USMC MICH 2000 (Desert)", "CUP_H_USMC_MICH2000_DEF_ESS_DES", 25, "hat"],
    ["USMC LW Helmet (Camo)", "CUP_H_USMC_LWH_ESS_WDL", 25, "hat"],
    ["USMC LW Helmet (Desert)", "CUP_H_USMC_LWH_ESS_DES", 25, "hat"],
    ["USMC Boonie Hat (Camo)", "CUP_H_USMC_BOONIE_WDL", 10, "hat"],
    ["USMC Boonie Hat (Desert)", "CUP_H_USMC_BOONIE_DES", 10, "hat"],
    ["USMC Pilot Helmet", "CUP_H_USMC_Helmet_Pilot", 25, "hat"],
    ["USMC Crew Helmet", "CUP_H_USMC_Crew_Helmet", 25, "hat"],
 
    ["US Army MICH 2000 (Desert)", "CUP_H_USArmy_HelmetMICH", 25, "hat"],
    ["US Army MICH 2000 (Camo)", "CUP_H_USArmy_HelmetMICH_wdl", 25, "hat"],
    ["US Army ECH (Desert)", "CUP_H_USArmy_Helmet_ECH1_Sand", 25, "hat"],
    ["US Army ECH (Black)", "CUP_H_USArmy_Helmet_ECH1_Black", 25, "hat"],
    ["US Army ECH (Green)", "CUP_H_USArmy_Helmet_ECH1_Green", 25, "hat"],
    ["US Army Delta Helmet", "CUP_H_USArmy_Helmet_Pro", 30, "hat"],
    ["M1 GI Helmet (Olive)", "CUP_H_USArmy_Helmet_M1_Olive", 30, "hat"],
    ["M1 GI Helmet (Leaf)", "CUP_H_USArmy_Helmet_M1_Vine", 30, "hat"],
    ["M1 GI Helmet (M81)", "CUP_H_USArmy_Helmet_M1_m81", 30, "hat"],
    ["M1 GI Helmet (BTP)", "CUP_H_USArmy_Helmet_M1_btp", 30, "hat"],
 
    ["BAF Officer Beret", "CUP_H_BAF_Officer_Beret", 10, "hat"],
    ["BAF Pilot Helmet", "CUP_H_BAF_Helmet_Pilot", 25, "hat"],
    ["Mk.7 Helmet (Desert)", "CUP_H_BAF_Helmet_1_DDPM", 25, "hat"],
    ["Mk.7 Helmet (Camo)", "CUP_H_BAF_Helmet_1_DPM", 25, "hat"],
    ["Mk.7 Helmet (MTP)", "CUP_H_BAF_Helmet_1_MTP", 25, "hat"],
    ["Mk.7 Netted Helmet (Desert)", "CUP_H_BAF_Helmet_Net_2_DDPM", 25, "hat"],
    ["Mk.7 Netted Helmet (Camo)", "CUP_H_BAF_Helmet_Net_2_DPM", 25, "hat"],
    ["Mk.7 Netted Helmet (MTP)", "CUP_H_BAF_Helmet_Net_2_MTP", 25, "hat"],
    ["Mk.7 Crew Helmet (Desert)", "CUP_H_BAF_Crew_Helmet_DDPM", 25, "hat"],
    ["Mk.7 Crew Helmet (Camo)", "CUP_H_BAF_Crew_Helmet_DPM", 25, "hat"],
    ["Mk.7 Crew Helmet (MTP)", "CUP_H_BAF_Crew_Helmet_MTP", 25, "hat"],
 
    ["6B27 Helmet (Light Green)", "CUP_H_RUS_6B27", 25, "hat"],
    ["6B27 Helmet (Olive)", "CUP_H_RUS_6B27_olive", 25, "hat"],
    ["TSh-4 Crew Cap", "CUP_H_RUS_TSH_4_Brown", 15, "hat"],
    ["ZSh-7 Pilot Helmet", "CUP_H_RUS_ZSH_Shield_Down", 30, "hat"],
    ["Russian Military Beret (Spetsnaz)", "CUP_H_RUS_Beret_Spetsnaz", 10, "hat"],
    ["ZSh-1 Combat Helmet (Green)", "CUP_H_RUS_ZSH_1", 25, "hat"]
];
 
uniformArray = compileFinal str
[
    //Kept from Stratis
    ["Tropenatrn 1", "CUP_U_B_GER_Tropentarn_1", 15, "uni"],
    ["Tropenatrn 2", "CUP_U_B_GER_Tropentarn_2", 15, "uni"],
    ["GER Ghillie", "CUP_U_B_GER_Ghillie", 30, "uni"],
	["GER Flecktarn (2)","CUP_U_B_GER_Flecktarn_2",10, "uni"],
    ["GER Fleck Ghillie (Unrolled Sleeve)","CUP_U_B_GER_Fleck_Ghillie",10, "uni"],
    ["Light Ghillie", "CUP_U_O_TK_Officer", 25, "uni"],
    ["Light Ghillie", "CUP_U_O_TK_MixedCamo", 30, "uni"],
    ["Light Ghillie", "CUP_U_O_TK_Green", 30, "uni"],
    ["TK Ghillie", "CUP_U_O_TK_Ghillie", 30, "uni"],
    ["TK Ghillie TOP", "CUP_U_O_TK_Ghillie_Top", 30, "uni"],
    ["USMC Officer", "CUP_U_B_USMC_Officer", 10, "uni"],
    ["USMC MARPAT Rolled UP", "CUP_U_B_USMC_MARPAT_WDL_RolledUp", 10, "uni"],
    ["USMC MARPAT Kneepad", "CUP_U_B_USMC_MARPAT_WDL_Kneepad", 10, "uni"],
    ["USMC Pilot", "CUP_U_B_USMC_PilotOverall", 10, "uni"],
    ["USMC MARPAT RollUp KneePad", "CUP_U_B_USMC_MARPAT_WDL_RollUpKneepad", 10, "uni"],
	["USMC MARPAT (Sleeve)","UP_U_B_USMC_MARPAT_WDL_Sleeves",10, "uni"],
    ["USMC Ghillie", "CUP_U_B_USMC_Ghillie_WDL", 50, "uni"],
	["USMC Navy (Blue)", "CUP_B_USMC_Navy_Blue", 5, "uni"],
    ["USMC Navy (Brown)", "CUP_B_USMC_Navy_Brown", 5, "uni"],
    ["USMC Navy (Green)", "CUP_B_USMC_Navy_Green", 5, "uni"],
    ["USMC Navy (Red)", "CUP_B_USMC_Navy_Red", 5, "uni"],
    ["USMC Navy (Violet)", "CUP_B_USMC_Navy_Violet", 5, "uni", "noDLC"],
    ["USMC Navy (White)", "CUP_B_USMC_Navy_White", 5, "uni"],
	["USMC Navy (Yellow)", "CUP_B_USMC_Navy_Yellow", 5, "uni"],
	["USMC FROG Type I (Camo)","CUP_U_B_USMC_FROG1_WMARPAT",10, "uni"],
    ["USMC FROG Type I (Desert)","CUP_U_B_USMC_FROG1_DMARPAT",10, "uni"],
    ["USMC FROG Type II (Camo)","CUP_U_B_USMC_FROG2_WMARPAT",10, "uni"],
    ["USMC FROG Type II (Desert)","CUP_U_B_USMC_FROG2_DMARPAT",10, "uni"],
    ["USMC FROG Type III (Camo)","CUP_U_B_USMC_FROG3_WMARPAT",10, "uni"],
    ["USMC FROG Type III (Desert)","CUP_U_B_USMC_FROG3_DMARPAT",10, "uni"],
    ["USMC FROG Type IV (Camo)","CUP_U_B_USMC_FROG4_WMARPAT",10, "uni"],
    ["USMC FROG Type IV (Desert)","CUP_U_B_USMC_FROG4_DMARPAT",10, "uni"],
    ["FR SpecOps", "CUP_U_B_FR_SpecOps", 20, "uni"],
    ["FR Scout", "CUP_U_B_FR_Scout", 20, "uni"],
    ["FR Officer", "CUP_U_B_FR_Officer", 20, "uni"],
    ["FR Corpsman", "CUP_U_B_FR_Corpsman", 20, "uni"],
    ["FR DirAction", "CUP_U_B_FR_DirAction", 20, "uni"],
    ["FR Light", "CUP_U_B_FR_Light", 20, "uni"],
    ["FR Scout 1", "CUP_U_B_FR_Scout1", 20, "uni"],
    ["FR Scout 2", "CUP_U_B_FR_Scout2", 20, "uni"],
    ["FR Scout 3", "CUP_U_B_FR_Scout3", 20, "uni"],    
   
//CUP Additions
    //BLUFOR
    ["US Army","CUP_U_B_USArmy_Base",10, "uni"],
    ["US Army Operator (Urban)","CUP_U_B_USArmy_TwoKnee",10, "uni"],
    ["US Army (Urban)","CUP_U_B_USArmy_UBACS",10, "uni"],
    ["US Army Pilot","CUP_U_B_USArmy_PilotOverall",10, "uni"],
	["US Army (Soft)","CUP_U_B_USArmy_soft",10, "uni"],
    ["US Army (Ghillie)","CUP_U_B_USArmy_Ghillie",10, "uni"],

    ["German KSK (Arid)","CUP_U_B_GER_Tropentarn_1",15, "uni"],
    ["German KSK (Camo)","CUP_U_B_GER_Flecktarn_1",15, "uni"],
    ["BAF DDPM (Rolled Sleeve)","CUP_U_B_BAF_DDPM_S1_RolledUp",10, "uni"],
    ["BAF DDPM (Unrolled Sleeve)","CUP_U_B_BAF_DDPM_S2_UnRolled",10, "uni"],
    ["BAF DPM (Rolled Sleeve)","CUP_U_B_BAF_DPM_S1_RolledUp",10, "uni"],
    ["BAF DPM (Unrolled Sleeve)","CUP_U_B_BAF_DPM_S2_UnRolled",10, "uni"],
    ["BAF MTP (Rolled Sleeve)","CUP_U_B_BAF_MTP_S1_RolledUp",10, "uni"],
    ["BAF MTP (Unrolled Sleeve)","CUP_U_B_BAF_MTP_S2_UnRolled",10, "uni"],
	
    ["BAF MTP (Unrolled Sleeve)","CUP_U_B_BAF_MTP_Tshirt",10, "uni"],
    ["BAF MTP (Unrolled Sleeve)","CUP_U_B_BAF_MTP_Ghillie",10, "uni"],
    ["BAF DPM (Unrolled Sleeve)","CUP_U_B_BAF_DPM_Tshirt",10, "uni"],
    ["BAF DPM (Unrolled Sleeve)","CUP_U_B_BAF_DPM_Ghillie",10, "uni"],
    ["BAF DDPM (Unrolled Sleeve)","CUP_U_B_BAF_DDPM_Tshirt",10, "uni"],
    ["BAF DDPM (Unrolled Sleeve)","CUP_U_B_BAF_DDPM_Ghillie",10, "uni"],
   
   
    //OPFOR
    ["Russian Army (Camo)","CUP_U_O_RUS_Flora_1",15, "uni"],
	["Russian Army (Flora 2)","CUP_U_O_RUS_Flora_2",10, "uni"],
	["Russian Army (Flora 1)","CUP_U_O_RUS_Flora_1_VDV",10, "uni"],
    ["Russian Army (Flora 2)","CUP_U_O_RUS_Flora_2_VDV",10, "uni"],
	["Russian Army (EMR 1)","CUP_U_O_RUS_EMR_1_VDV",10, "uni"],
    ["Russian Army (EMR 2)","CUP_U_O_RUS_EMR_2_VDV",10, "uni"],
    ["Russian Army (EMR)","CUP_U_O_RUS_EMR_1",15, "uni"],
	["Russian Army (EMR 2)","CUP_U_O_RUS_EMR_2",10, "uni"],
    ["Russian Army Officer","CUP_U_O_RUS_Commander",15, "uni"],
    ["Russian Army (Partizan)","CUP_U_O_RUS_Gorka_Partizan",15, "uni"],
    ["Russian Army (Green)","CUP_U_O_RUS_Gorka_Green",15, "uni"],
	["Russian Army (Gorka)","CUP_U_O_RUS_Gorka_Partizan_A",10, "uni"],
    ["Russian Army (Ghillie)","CUP_U_O_RUS_Ghillie",10, "uni"],

    ["Chedaki Kamysh Uniform (Type 1)","CUP_U_O_CHDKZ_Kam_01",10, "uni"],
    ["Chedaki Kamysh Uniform (Type 2)","CUP_U_O_CHDKZ_Kam_02",10, "uni"],
    ["Chedaki Kamysh Uniform (Type 3)","CUP_U_O_CHDKZ_Kam_03",10, "uni"],
    ["Chedaki Kamysh Uniform (Type 4)","CUP_U_O_CHDKZ_Kam_04",10, "uni"],
    ["Chedaki Kamysh Uniform (Type 5)","CUP_U_O_CHDKZ_Kam_05",10, "uni"],
    ["Chedaki Kamysh Uniform (Type 6)","CUP_U_O_CHDKZ_Kam_06",10, "uni"],
    ["Chedaki Kamysh Uniform (Type 7)","CUP_U_O_CHDKZ_Kam_07",10, "uni"],
    ["Chedaki Kamysh Uniform (Type 8)","CUP_U_O_CHDKZ_Kam_08",10, "uni"],
    ["Pilot (01)","CUP_U_O_Pilot_01",10, "uni"],
    ["Worker (02)","CUP_U_O_Worker_02",10, "uni"],
    ["Woodman (01)","CUP_U_O_Woodlander_01",10, "uni"],
    ["Woodman (02)","CUP_U_O_Woodlander_02",10, "uni"],
    ["Woodman (03)","CUP_U_O_Woodlander_03",10, "uni"],
    ["Villager (01)","CUP_U_O_Villager_03",10, "uni"],
    ["Villager (02)","CUP_U_O_Villager_04",10, "uni"],
    ["Soldier (Mixed Camo)","CUP_U_O_SLA_MixedCamo",10, "uni"],
    ["Soldier (Tank)","CUP_U_O_sla_overalls_Tank",10, "uni"],
    ["Soldier (Pilot)","CUP_U_O_sla_overalls_Pilot",10, "uni"],
    ["Soldier (Officer)","CUP_U_O_SLA_Officer_suit",10, "uni"],
    ["Soldier (TTSKO Camo)","CUP_U_O_partisan_ttsko_Mixed",10, "uni"],	
   
   
    //INDY
    ["NAPA Guerilla Clothing (Fleck 1)","CUP_U_I_GUE_Flecktarn",10, "uni"],
    ["NAPA Guerilla Clothing (Fleck 2)","CUP_U_I_GUE_Flecktarn2",10, "uni"],
	["NAPA Guerilla Clothing (Fleck 3)","CUP_U_I_GUE_Flecktarn3",10, "uni"],
    ["NAPA Guerilla Clothing (Woodland 1)","CUP_U_I_GUE_Woodland1",10, "uni"],
    ["NAPA Guerilla Half Ghillie","CUP_U_I_Ghillie_Top",20, "uni"],
    ["NAPA Guerilla Anorak (Type 1)","CUP_U_I_GUE_Anorak_01",10, "uni"],
    ["NAPA Guerilla Anorak (Type 2)","CUP_U_I_GUE_Anorak_02",10, "uni"],
    ["NAPA Guerilla Anorak (Type 3)","CUP_U_I_GUE_Anorak_03",10, "uni"],
   
    ["RACS Combat Uniform (Desert 1)","CUP_U_I_RACS_Desert_1",15, "uni"],
    ["RACS Combat Uniform (Des. 2)","CUP_U_I_RACS_Desert_2",15, "uni"],
    ["RACS Combat Uniform (Urban 1)","CUP_U_I_RACS_Urban_1",15, "uni"],
    ["RACS Combat Uniform (Urban 2)","CUP_U_I_RACS_Urban_2",15, "uni"],
    ["RACS Combat Uniform (Woodland 1)","CUP_U_I_RACS_WDL_1",15, "uni"],
    ["RACS Combat Uniform (Woodland 2)","CUP_U_I_RACS_WDL_2",15, "uni"],
    ["RACS Combat Uniform (Mech. 1)","CUP_U_I_RACS_mech_1",15, "uni"],
    ["RACS Combat Uniform (Mech. 2)","CUP_U_I_RACS_mech_2",15, "uni"],
	
	["Pilot","CUP_U_I_Pilot_01",15, "uni"],
	["Leader","CUP_U_I_Leader_01",15, "uni"],
	["Villager (01)","CUP_U_I_Worker_02",15, "uni"],
	["Villager (02)","CUP_U_I_Woodlander_01",15, "uni"],
	["Villager (03))","CUP_U_I_Woodlander_02",15, "uni"],
	["Villager (04))","CUP_U_I_Woodlander_03",15, "uni"],
	["Villager (05)","CUP_U_I_Villager_03",15, "uni"],
	["Villager (06)","CUP_U_I_Villager_04",15, "uni"],
	["TKG Jeans (01)","CUP_I_TKG_Khet_Jeans_01",15, "uni"],
	["TKG Jeans (02)","CUP_I_TKG_Khet_Jeans_02",15, "uni"],
	["TKG Jeans (03)","CUP_I_TKG_Khet_Jeans_03",15, "uni"],
	["TKG Jeans (04)","CUP_I_TKG_Khet_Jeans_04",15, "uni"],
	["TKG Partug (01)","CUP_I_TKG_Khet_Partug_01",15, "uni"],
	["TKG Partug (02)","CUP_I_TKG_Khet_Partug_02",15, "uni"],
	["TKG Partug (03)","CUP_I_TKG_Khet_Partug_03",15, "uni"],
	["TKG Partug (05)","CUP_I_TKG_Khet_Partug_05",15, "uni"],
	["TKG Partug (06)","CUP_I_TKG_Khet_Partug_06",15, "uni"],
	["TKG Partug (07)","CUP_I_TKG_Khet_Partug_07",15, "uni"],
	["TKG Partug (08)","CUP_I_TKG_Khet_Partug_08",15, "uni"]
   
];
 
vestArray = compileFinal str
[
    //Finished
//Kept from Stratis
    ["Rebreather (NATO)", "V_RebreatherB", 100, "vest"],
    ["Rebreather (CSAT)", "V_RebreatherIR", 100, "vest"],
    ["Rebreather (AAF)", "V_RebreatherIA", 100, "vest"],
   
//CUP Additions
    ["IOTV (Squad Lead)", "CUP_V_B_IOTV_SL", 100, "vest"],
    ["IOTV (Medic)","CUP_V_B_IOTV_Medic",100, "vest"],
    ["IOTV (Rifleman)","CUP_V_B_IOTV_Rifleman",100, "vest"],
    ["IOTV (AT)","CUP_V_B_IOTV_AT",100, "vest"],
    ["IOTV (MG)","CUP_V_B_IOTV_MG",100, "vest"],
    ["Interceptor","CUP_V_B_Interceptor_Rifleman",100, "vest"],
    ["Modular Tactical Vest (Patrol)", "CUP_V_B_MTV_Patrol",100, "vest"],
    ["Modular Tactical Vest (Pouches)", "CUP_V_B_MTV_Pouches",140, "vest"],
    ["Modular Tactical Vest (Pistol)", "CUP_V_B_MTV_PistolBlack",120, "vest"],
    ["Modular Tactical Vest (Leg Pouch)", "CUP_V_B_MTV_LegPouch",140, "vest"],
    ["Modular Tactical Vest (MG)", "CUP_V_B_MTV_MG",140, "vest"],
    ["Modular Tactical Vest (TL)", "CUP_V_B_MTV_TL",120, "vest"],
    ["Modular Tactical Vest (TL)", "CUP_V_B_RRV_TL",120, "vest"],
    ["RRV Carrier (Medic)", "CUP_V_B_RRV_Medic",120, "vest"],
    ["RRV Carrier (DA1)", "CUP_V_B_RRV_DA1",120, "vest"],
    ["RRV Carrier (MG)", "CUP_V_B_RRV_MG",120, "vest"],
    ["RRV Carrier (Scout)", "CUP_V_B_RRV_Scout",120, "vest"],
    ["Eagle Spec (Rifleman)", "CUP_V_B_Eagle_SPC_Rifleman",120, "vest"],
    ["Eagle Spec (Patrol", "CUP_V_B_Eagle_SPC_Patrol",140, "vest"],
    ["Eagle Spec (GL)", "CUP_V_B_Eagle_SPC_GL",140, "vest"],
    ["Eagle Spec (MG)", "CUP_V_B_Eagle_SPC_MG",140, "vest"],
    ["Eagle Spec (AT)", "CUP_V_B_Eagle_SPC_AT",120, "vest"],
    ["Eagle Spec (Corpsman)", "CUP_V_B_Eagle_SPC_Corpsman",120, "vest"],
    ["Eagle Spec (Squad Lead)", "CUP_V_B_Eagle_SPC_SL",120, "vest"],
    ["Osprey Mk2 DDPM", "CUP_V_BAF_Osprey_Mk2_DDPM_Soldier1",180, "vest"],
    ["Osprey Mk2 DDPM (Grenadier)", "CUP_V_BAF_Osprey_Mk2_DDPM_Grenadier",180, "vest"],
    ["Osprey Mk2 DDPM (Sapper)", "CUP_V_BAF_Osprey_Mk2_DDPM_Sapper",180, "vest"],
    ["Osprey Mk2 DDPM (Medic)", "CUP_V_BAF_Osprey_Mk2_DDPM_Medic",180, "vest"],
    ["Osprey Mk2 DPM (Rifleman)", "CUP_V_BAF_Osprey_Mk2_DPM_Soldier1",180, "vest"],
    ["Osprey Mk2 DPM (Grenadier)", "CUP_V_BAF_Osprey_Mk2_DPM_Grenadier",180, "vest"],
    ["Osprey Mk2 DPM (Sapper)", "CUP_V_BAF_Osprey_Mk2_DPM_Sapper",180, "vest"],
    ["Osprey Mk2 DPM (Medic)", "CUP_V_BAF_Osprey_Mk2_DPM_Medic",180, "vest"],
    ["Osprey Mk4 MTP (Grenadier)", "CUP_V_BAF_Osprey_Mk4_MTP_Grenadier",200, "vest"],
    ["Osprey Mk4 MTP (MG)", "CUP_V_BAF_Osprey_Mk4_MTP_MachineGunner",200, "vest"],
    ["Osprey Mk4 MTP (Rifleman)", "CUP_V_BAF_Osprey_Mk4_MTP_Rifleman",200, "vest"],
    ["Osprey Mk4 MTP (Squad Lead)", "CUP_V_BAF_Osprey_Mk4_MTP_SquadLeader",200, "vest"],
    ["6B3 (Type I)","CUP_V_RUS_6B3_1",140, "vest"],
    ["6B3 (Type II)", "CUP_V_RUS_6B3_2",140, "vest"],
    ["6B3 (Type III)", "CUP_V_RUS_6B3_3",140, "vest"],
    ["6B3 (Type IV)", "CUP_V_RUS_6B3_4",140, "vest"],
    ["Smersh (Type II)", "CUP_V_RUS_Smersh_1",140, "vest"],
    ["Smersh (Type II)", "CUP_V_RUS_Smersh_2",130, "vest"]
];
 
backpackArray = compileFinal str
[
//Finished
    ["M95 CZ Scout Pack", "CUP_B_ACRScout_m95", 15, "backpack"],
    ["M95 CZ Para Pack", "CUP_B_ACRPara_m95", 100, "backpack"],
   
    ["US Assault Pack (Desert)", "CUP_B_AssaultPack_ACU", 40, "backpack"],
    ["US Assault Pack (Coyote)", "CUP_B_AssaultPack_Coyote", 40, "backpack"],
    ["US Assault Pack (Black)", "CUP_B_AssaultPack_Black", 40, "backpack"],
    ["US Tactical Pack (Coyote)", "CUP_B_USPack_Coyote", 80, "backpack"],
    ["US Tactical Pack (Coyote)", "CUP_B_USPack_Black", 90, "backpack"],
   
    ["Medic Pack (Desert)", "CUP_B_GER_Medic_Desert", 60, "backpack"],
    ["Medic Pack (Arid)", "CUP_B_GER_Medic_Tropentarn", 60, "backpack"],
    ["Medic Pack (Camo)", "CUP_B_GER_Medic_FLecktarn", 60, "backpack"],
    ["Medic Pack (Red Crescent)", "CUP_B_TK_Medic_Desert", 60, "backpack"],
    ["Medic Pack (Satchel)", "CUP_B_SLA_Medicbag", 60, "backpack"],
   
    ["AFRF RPG Pack", "CUP_B_RPGPack_Khaki", 40, "backpack"],
    ["AFRF Combat Pack", "CUP_B_RUS_Backpack", 80, "backpack"],
   
    ["Civilian Day Pack", "CUP_B_CivPack_WDL", 90, "backpack"],
    ["Civilian Hiking Pack", "CUP_B_HikingPack_Civ", 100, "backpack"],
   
    ["KSK Carryall (Arid)", "CUP_B_GER_Pack_Tropentarn", 90, "backpack"],
    ["KSK Carryall (Camo)", "CUP_B_GER_Pack_Flecktarn", 90, "backpack"],
   
    ["BAF Bergen", "CUP_B_Bergen_BAF", 90, "backpack"],
   
    ["ALICE Pack", "CUP_B_AlicePack_Khaki", 100, "backpack"],
    ["ALICE Camping Pack", "CUP_B_AlicePack_Bedroll", 100, "backpack"],
    ["USMC Recon Pack", "CUP_B_USMC_AssaultPack", 60, "backpack"],
    ["USMC MOLLE (Desert)", "CUP_B_USMC_MOLLE", 100, "backpack"],
    ["USMC MOLLE (Camo)", "CUP_B_USMC_MOLLE_WDL", 100, "backpack"]
 
 
/*
    ["Parachute", "B_Parachute", 200, "backpack"],
    ["Assault Pack (Black)", "B_AssaultPack_blk", 150, "backpack"],
    ["Assault Pack (Green)", "B_AssaultPack_rgr", 150, "backpack"],
    ["Assault Pack (MTP)", "B_AssaultPack_mcamo", 150, "backpack"],
    ["Assault Pack (Hex)", "B_AssaultPack_ocamo", 150, "backpack"],
    ["Field Pack (Black)", "B_FieldPack_blk", 200, "backpack"],
    ["Field Pack (Coyote)", "B_FieldPack_cbr", 200, "backpack"],
    ["Field Pack (Khaki)", "B_FieldPack_khk", 200, "backpack"],
    ["Field Pack (Urban)", "B_FieldPack_oucamo", 200, "backpack"],
    ["Kitbag (Coyote)", "B_Kitbag_cbr", 350, "backpack"],
    ["Kitbag (Green)", "B_Kitbag_rgr", 350, "backpack"],
    ["Kitbag (MTP)", "B_Kitbag_mcamo", 350, "backpack"],
    ["Kitbag (Sage)", "B_Kitbag_sgg", 350, "backpack"],
    ["Bergen (Black)", "B_Bergen_blk", 350, "backpack"],
    ["Bergen (Green)", "B_Bergen_rgr", 350, "backpack"],
    ["Bergen (MTP)", "B_Bergen_mcamo", 350, "backpack"],
    ["Bergen (Sage)", "B_Bergen_sgg", 350, "backpack"],
    ["Carryall (Khaki)", "B_Carryall_khk", 500, "backpack"],
    ["Carryall (MTP)", "B_Carryall_mcamo", 500, "backpack"],
    ["Carryall (Olive)", "B_Carryall_oli", 500, "backpack"],
    ["Carryall (Urban)", "B_Carryall_oucamo", 500, "backpack"]
*/
];
 
genItemArray = compileFinal str
[
   
    ["GPS", "ItemGPS", 10, "gps"],
   
    ["First Aid Kit", "FirstAidKit", 5, "item"],
   
    ["Medikit", "Medikit", 15, "item"],
   
    ["Toolkit", "ToolKit", 15, "item"],
   
    ["Mine Detector", "MineDetector", 20, "item"],
   
    ["NV PVS14", "CUP_NVG_PVS14", 20, "nvg"],
    ["NV PVS7", "CUP_NVG_PVS7", 20, "nvg"],
    ["NV HMNVS", "CUP_NVG_HMNVS", 20, "nvg"],
   
    ["Diving Goggles", "G_Diving", 10, "gogg"],
    ["Binoculars", "Binocular", 10, "binoc"],
    ["LRTV", "CUP_LRTV", 10, "binoc"],
    ["SOFLAM", "CUP_SOFLAM", 10, "binoc"],
    ["Vector 21 Nite", "CUP_Vector21Nite", 30, "binoc"], // Increase price to 2500 if A3W_disableBuiltInThermal = 0
   
    ["Chemlight (Blue)", "Chemlight_blue", 5, "mag"],
    ["Chemlight (Green)", "Chemlight_green", 5, "mag"],
    ["Chemlight (Yellow)", "Chemlight_yellow", 5, "mag"],
    ["Chemlight (Red)", "Chemlight_red", 5, "mag"]
];
 
allStoreMagazines = compileFinal str (call ammoArray + call throwputArray + call genItemArray);
allRegularStoreItems = compileFinal str (call allGunStoreFirearms + call allStoreMagazines + call accessoriesArray);
allStoreGear = compileFinal str (call headArray + call uniformArray + call vestArray + call backpackArray + call hiddenArray);
 
genObjectsArray = compileFinal str
[
    ["Empty Ammo Crate", "Box_NATO_Ammo_F", 200, "ammocrate"],
    //["Metal Barrel", "Land_MetalBarrel_F", 25, "object"],
    //["Toilet Box", "Land_ToiletBox_F", 25, "object"],
    ["Lamp Post (Harbour)", "Land_LampHarbour_F", 100, "object"],
    ["Lamp Post (Shabby)", "Land_LampShabby_F", 100, "object"],
    ["Boom Gate", "Land_BarGate_F", 150, "object"],
    ["Pipes", "Land_Pipes_Large_F", 200, "object"],
    ["Concrete Frame", "Land_CncShelter_F", 200, "object"],
    ["Highway Guardrail", "Land_Crash_barrier_F", 200, "object"],
    ["Concrete Barrier", "Land_CncBarrier_F", 200, "object"],
    ["Concrete Barrier (Medium)", "Land_CncBarrierMedium_F", 350, "object"],
    ["Concrete Barrier (Long)", "Land_CncBarrierMedium4_F", 500, "object"],
    ["HBarrier (1 block)", "Land_HBarrier_1_F", 150, "object"],
    ["HBarrier (3 blocks)", "Land_HBarrier_3_F", 200, "object"],
    ["HBarrier (5 blocks)", "Land_HBarrier_5_F", 250, "object"],
    ["HBarrier Big", "Land_HBarrierBig_F", 500, "object"],
    ["HBarrier Wall (4 blocks)", "Land_HBarrierWall4_F", 400, "object"],
    ["HBarrier Wall (6 blocks)", "Land_HBarrierWall6_F", 500, "object"],
    ["HBarrier Watchtower", "Land_HBarrierTower_F", 600, "object"],
    ["Concrete Wall", "Land_CncWall1_F", 400, "object"],
    ["Concrete Military Wall", "Land_Mil_ConcreteWall_F", 400, "object"],
    ["Concrete Wall (Long)", "Land_CncWall4_F", 600, "object"],
    ["Military Wall (Big)", "Land_Mil_WallBig_4m_F", 600, "object"],
    //["Shoot House Wall", "Land_Shoot_House_Wall_F", 180, "object"],
    ["Canal Wall (Small)", "Land_Canal_WallSmall_10m_F", 400, "object"],
    //["Canal Stairs", "Land_Canal_Wall_Stairs_F", 500, "object"],
    ["Bag Fence (Corner)", "Land_BagFence_Corner_F", 150, "object"],
    ["Bag Fence (End)", "Land_BagFence_End_F", 150, "object"],
    ["Bag Fence (Long)", "Land_BagFence_Long_F", 200, "object"],
    ["Bag Fence (Round)", "Land_BagFence_Round_F", 150, "object"],
    ["Bag Fence (Short)", "Land_BagFence_Short_F", 150, "object"],
    ["Bag Bunker (Small)", "Land_BagBunker_Small_F", 250, "object"],
    ["Bag Bunker (Large)", "Land_BagBunker_Large_F", 500, "object"],
    ["Bag Bunker Tower", "Land_BagBunker_Tower_F", 1000, "object"],
    ["Military Cargo Post", "Land_Cargo_Patrol_V1_F", 800, "object"],
    ["Military Cargo Tower", "Land_Cargo_Tower_V1_F", 10000, "object"],
    ["Concrete Ramp", "Land_RampConcrete_F", 350, "object"],
    ["Concrete Ramp (High)", "Land_RampConcreteHigh_F", 500, "object"],
    //["Scaffolding", "Land_Scaffolding_F", 250, "object"]
    ["Land Pier", "Land_Pier_F", 25000, "object"],
    ["Fuel Station", "Land_FuelStation_Feed_F", 10000, "object"]
];
 
//allGenStoreVanillaItems = compileFinal str (call genItemArray + call genObjectsArray + call allStoreGear);
allGenStoreItems = compileFinal str (call genItemArray + call genObjectsArray + call allStoreGear);
 
//Text name, classname, buy cost, spawn type, sell price (selling not implemented) or spawning color
landArray = compileFinal str
[
 
    ["Armoured SUV", "CUP_I_SUV_Armored_ION", 1000, "vehicle"],
 
//AFRF
   
    ["Quadbike (Civilian)", "C_Quadbike_01_F", 100, "vehicle"],
    ["Quadbike (NATO)", "B_Quadbike_01_F", 100, "vehicle"],
    ["Quadbike (CSAT)", "O_Quadbike_01_F", 100, "vehicle"],
    ["Quadbike (AAF)", "I_Quadbike_01_F", 100, "vehicle"],
    ["Quadbike (FIA)", "B_G_Quadbike_01_F", 100, "vehicle"],
   
    ["UAZ (Unarmed)", "CUP_O_UAZ_Unarmed_CHDKZ", 100, "vehicle"],
    ["UAZ Open Frame (Unarmed)", "CUP_O_UAZ_Open_CHDKZ", 100, "vehicle"],
    ["UAZ DSHkM", "CUP_O_UAZ_MG_CHDKZ", 400, "vehicle"],
    ["UAZ AGS-30 GMG", "CUP_O_UAZ_AGS30_CHDKZ", 500, "vehicle"],
    ["UAZ SPG-9", "CUP_O_UAZ_SPG9_CHDKZ", 1000, "vehicle"],
    ["UAZ AT-13 Metis", "CUP_O_UAZ_METIS_CHDKZ", 1200, "vehicle"],
    ["Ural ZU-23 AA", "CUP_O_Ural_ZU23_RU", 1500, "vehicle"],
   
    ["Vodnik Recon (2 x PKT)", "CUP_O_GAZ_Vodnik_PK_RU", 1000, "vehicle"],
    ["Vodnik AGS-30", "CUP_O_GAZ_Vodnik_AGS_RU", 1200, "vehicle"],
    ["Vodnik BPPU", "CUP_O_GAZ_Vodnik_BPPU_RU", 3000, "vehicle"],
    ["BRDM-2 HQ PKT", "CUP_O_BRDM2_HQ_CHDKZ", 1000, "vehicle"],
    ["BRDM-2 KPVT", "CUP_O_BRDM2_CHDKZ", 1800, "vehicle"],
    ["BRDM-2 ATGM", "CUP_O_BRDM2_ATGM_CHDKZ", 2200, "vehicle"],
   
    ["Ural Cargo", "CUP_O_Ural_RU", 300, "vehicle"],
    ["Ural Troop Transport", "CUP_O_Ural_Open_RU", 300, "vehicle"],
 
//USMC Hummers
    ["HMMWV USMC (Unarmed)", "CUP_B_HMMWV_Unarmed_USMC", 500, "vehicle"],
    ["HMMWV M240B", "CUP_B_HMMWV_M1114_USMC", 800, "vehicle"],
    ["HMMWV M2 .50cal", "CUP_B_HMMWV_M2_USMC", 1000, "vehicle"],
    ["HMMWV Mk.19 GMG", "CUP_B_HMMWV_MK19_USMC", 1200, "vehicle"],
    ["HMMWV TOW", "CUP_B_HMMWV_TOW_USMC", 1500, "vehicle"],
    ["HMMWV Recon SOV (AGS-30)", "CUP_B_HMMWV_SOV_USA", 800, "vehicle"],
    ["HMMWV M2 GPK (Desert)", "CUP_B_HMMWV_M2_GPK_USA", 1000, "vehicle"],
    ["HMMWV Avenger AA (Camo)", "CUP_B_HMMWV_Avenger_USMC", 6000, "vehicle"],
    ["HMMWV Avenger AA (Desert)", "CUP_B_HMMWV_Avenger_USA", 6000, "vehicle"],
 
//USMC RG31
    ["RG31 M2 .50cal (Desert)", "CUP_B_RG31_M2_GC_USMC", 1800, "vehicle"],
    ["RG31 M2 .50cal (Camo)", "CUP_B_RG31_M2_OD_USMC", 1800, "vehicle"],
    ["RG31 Mk.19 GMG (Desert)", "CUP_B_RG31_Mk19_USMC", 1800, "vehicle"],
    ["RG31 Mk.19 GMG (Camo)", "CUP_B_RG31_Mk19_OD_USMC", 1800, "vehicle"],
    ["HMMWV Ambulance", "CUP_B_HMMWV_Ambulance_USMC", 300, "vehicle"],
   
    ["MTVR (USMC)", "CUP_B_MTVR_USMC", 300, "vehicle"],
    ["MTRV (US Army)", "CUP_B_MTVR_USA", 300, "vehicle"],
   
//BAF
    ["Jackal L2A1 (Desert)", "CUP_B_Jackal2_L2A1_GB_D", 800, "vehicle"],
    ["Jackal L2A1 (Camo)", "CUP_B_Jackal2_L2A1_GB_W", 800, "vehicle"],
    ["Jackal GMG (Desert)", "CUP_B_Jackal2_GMG_GB_D", 800, "vehicle"],
    ["Jackal GMG (Camo)", "CUP_B_Jackal2_GMG_GB_W", 800, "vehicle"],
    ["Coyote L2A1 (Desert)", "CUP_B_BAF_Coyote_L2A1_GB_D", 3000, "vehicle"],
    ["Coyote L2A1 (Camo)", "CUP_B_BAF_Coyote_L2A1_GB_W", 3000, "vehicle"],
    ["Coyote GMG (Desert)", "CUP_B_BAF_Coyote_GMG_GB_D", 3000, "vehicle"],
    ["Coyote GMG (Camo)", "CUP_B_BAF_Coyote_GMG_GB_W", 3000, "vehicle"],  
    ["Landrover Special Forces M2 (Camo)", "CUP_B_LR_Special_M2_GB_W", 2500, "vehicle"],
    ["Landrover Special Forces M2 (Desert)", "CUP_B_LR_Special_M2_GB_D", 2500, "vehicle"],
    ["Landrover Special Forces AGS-30 (Camo)", "CUP_B_LR_Special_GMG_GB_W", 3500, "vehicle"],
    ["Landrover Special Forces AGS-30 (Desert)", "CUP_B_LR_Special_GMG_GB_D", 3500, "vehicle"],
    ["Landrover Ambulance", "CUP_B_LR_Ambulance_CZ_W", 1000, "vehicle"]
   
    /* These are seemingly too OP. They're harder to destroy than a T-72.
    ["Mastiff L2A1 (Desert)", "CUP_B_Mastiff_HMG_GB_D", 2500, "vehicle"],
    ["Mastiff L2A1 (Camo)", "CUP_B_Mastiff_HMG_GB_W", 2500, "vehicle"],
    ["Mastiff GPMG (Desert)", "CUP_B_Mastiff_LMG_GB_D", 2000, "vehicle"],
    ["Mastiff GPMG (Camo)", "CUP_B_Mastiff_LMG_GB_W", 2000, "vehicle"],
    ["Mastiff GMG (Desert)", "CUP_B_Mastiff_GMG_GB_D", 4500, "vehicle"],
    ["Mastiff GMG (Camo)", "CUP_B_Mastiff_GMG_GB_W", 4500, "vehicle"],
    ["Wolfhound TSV L110A1", "CUP_B_Wolfhound_LMG_GB_W", 3000, "vehicle"],
    ["Wolfhound TSV L7A1", "CUP_B_Wolfhound_HMG_GB_W", 4000, "vehicle"]
    */
   
 
];
 
armoredArray = compileFinal str
[
//Finished
 
//AFRF
    ["BTR-60", "CUP_O_BTR60_CSAT", 5000, "vehicle"],
    ["BMP Medical (Unarmed)", "CUP_I_BMP2_AMB_NAPA", 1000, "vehicle"],
    ["BMP-2 HQ (Russian)", "CUP_O_BMP_HQ_RU", 3000, "vehicle"],
    ["BMP-2 HQ (ChDKZ)", "CUP_O_BMP_HQ_CHDKZ", 3500, "vehicle"], //not sure we need 2 of these
   
    ["BMP-2 ZU-23", "CUP_O_BMP2_ZU_TKA", 5000, "vehicle"],
 
//USAF
    ["M113 Medical (Unarmed)", "CUP_I_M113_Med_AAF", 1000, "vehicle"],
    ["M113 M2 .50cal", "CUP_I_M113_RACS", 1500, "vehicle"],  
    ["AAVP7/A1", "CUP_B_AAV_USMC", 4000, "vehicle"],
    ["LAV25 HQ", "CUP_B_LAV25_HQ_USMC", 2500, "vehicle"],
    ["LAV25 M2 CROWS (Camo)", "CUP_B_M1126_ICV_M2_Woodland", 3000, "vehicle"],
    ["LAV25 M2 CROWS (Desert)", "CUP_B_M1126_ICV_M2_Desert", 3000, "vehicle"],
    ["LAV25 M2 CROWS Slat (Camo)", "CUP_B_M1126_ICV_M2_Woodland_Slat", 3500, "vehicle"],//slats offer more protection - harder to kill this vehicle
    ["LAV25 M2 CROWS Slat (Desert)", "CUP_B_M1126_ICV_M2_Desert_Slat", 3500, "vehicle"],//slats offer more protection - harder to kill this vehicle
    ["LAV25 Mk.19 CROWS (Camo)", "CUP_B_M1126_ICV_MK19_Woodland", 3500, "vehicle"],
    ["LAV25 Mk.19 CROWS (Desert)", "CUP_B_M1126_ICV_MK19_Desert", 3500, "vehicle"],
    ["LAV25 Mk.19 CROWS Slat(Camo)", "CUP_B_M1126_ICV_MK19_Woodland_Slat", 4000, "vehicle"], //slats offer more protection - harder to kill this vehicle
    ["LAV25 Mk.19 CROWS Slat(Desert)", "CUP_B_M1126_ICV_MK19_Desert_Slat", 4000, "vehicle"],//slats offer more protection - harder to kill this vehicle
   
//BAF
 
    ["FV-432 Bulldog L110A1 (Desert)", "CUP_B_FV432_Bulldog_GB_D", 2500, "vehicle"],
    ["FV-432 Bulldog L110A1 (Camo)", "CUP_B_FV432_Bulldog_GB_W", 2500, "vehicle"],
    ["FV-432 Bulldog L7A1 (Desert)", "CUP_B_FV432_Bulldog_GB_D_RWS", 3500, "vehicle"],
    ["FV-432 Bulldog L7A1 (Camo)", "CUP_B_FV432_Bulldog_GB_W_RWS", 3500, "vehicle"]
   
 
/*
    ["Hunter", "B_MRAP_01_F", 4000, "vehicle"],
    ["Hunter HMG", "B_MRAP_01_hmg_F", 15000, "vehicle"],
    ["Hunter GMG", "B_MRAP_01_gmg_F", 17500, "vehicle"],
    ["Ifrit", "O_MRAP_02_F", 4000, "vehicle"],
    ["Ifrit HMG", "O_MRAP_02_hmg_F", 15000, "vehicle"],
    ["Ifrit GMG", "O_MRAP_02_gmg_F", 17500, "vehicle"],
    ["Strider", "I_MRAP_03_F", 4000, "vehicle"],
    ["Strider HMG", "I_MRAP_03_hmg_F", 15000, "vehicle"],
    ["Strider GMG", "I_MRAP_03_gmg_F", 17500, "vehicle"],
    ["MSE-3 Marid", "O_APC_Wheeled_02_rcws_F", 22500, "vehicle"],
    ["AMV-7 Marshall", "B_APC_Wheeled_01_cannon_F", 27500, "vehicle"],
    ["AFV-4 Gorgon", "I_APC_Wheeled_03_cannon_F", 30000, "vehicle"]
*/
 
];
 
tanksArray = compileFinal str
[
//FINISHED
   
    ["BMP-2 (Russian)", "CUP_O_BMP2_RU", 7500, "vehicle"],
    ["BMP-2 (ChDKZ)", "CUP_O_BMP2_CHDKZ", 7500, "vehicle"], //not sure we need 2 of these
    ["BMP-3", "CUP_O_BMP3_RU", 8000, "vehicle"],
    ["M6 Linebacker AA (Desert)", "CUP_B_M6LineBacker_USA_D", 10000, "vehicle"],
    ["M6 Lineback AA (Camo)", "CUP_B_M6LineBacker_USA_W", 10000, "vehicle"],
    ["ZSU-23-4 Shilka (ChDKZ)", "CUP_O_ZSU23_ChDKZ", 7500, "vehicle"],//not sure we need 2 of these
    ["ZSU-23-4 Shilka (Takistani)", "CUP_O_ZSU23_TK", 7500, "vehicle"],
   
    ["T-34-85M", "CUP_O_T34_TKA", 9000, "vehicle"],
    ["T-55", "CUP_O_T55_TK", 12000, "vehicle"],
    ["T-72", "CUP_O_T72_RU", 15000, "vehicle"],
   
   
    ["LAV25 MGS (Camo)", "CUP_B_M1128_MGS_Woodland", 8000, "vehicle"],
    ["LAV25 MGS (Desert)", "CUP_B_M1128_MGS_Desert", 8000, "vehicle"],
    ["M2A1 Bradley IFV (Desert)", "CUP_B_M2Bradley_USA_D", 9000, "vehicle"],
    ["M2A1 Bradley IFV (Camo)", "CUP_B_M2Bradley_USA_W", 9000, "vehicle"],
    ["M2A3 ERA Bradley IFV (Desert)", "CUP_B_M2A3Bradley_USA_D", 9500, "vehicle"],
    ["M2A3 ERA Bradley IFV (Camo)", "CUP_B_M2A3Bradley_USA_W", 9500, "vehicle"],
    ["M163 VADS AA", "CUP_B_M163_USA", 7500, "vehicle"],
    ["FV-510 Warrior IFV (Desert)", "CUP_B_FV510_GB_D", 7500, "vehicle"],
    ["FV-510 Warrior IFV (Camo)", "CUP_B_FV510_GB_W", 7500, "vehicle"],
    ["FV-510 Warrior IFV Slat (Desert)", "CUP_B_FV510_GB_D_SLAT", 8000, "vehicle"]
   
   
/*
    ["CRV-6e Bobcat", "B_APC_Tracked_01_CRV_F", 32500, "vehicle"],
    ["IFV-6c Panther", "B_APC_Tracked_01_rcws_F", 35000, "vehicle"],
    ["FV-720 Mora", "I_APC_tracked_03_cannon_F", 37500, "vehicle"],
    ["BTR-K Kamysh", "O_APC_Tracked_02_cannon_F", 40000, "vehicle"],
    ["IFV-6a Cheetah AA", "B_APC_Tracked_01_AA_F", 40000, "vehicle"],
    ["M2A1 Slammer", "B_MBT_01_cannon_F", 50000, "vehicle"],
    ["M2A4 Slammer HMG", "B_MBT_01_TUSK_F", 50000, "vehicle"], // Commander gun variant
    ["T-100 Varsuk", "O_MBT_02_cannon_F", 50000, "vehicle"],
    ["MBT-52 Kuma", "I_MBT_03_cannon_F", 50000, "vehicle"]
*/
 
];
 
 
helicoptersArray = compileFinal str
[
 
    ["Mi-8MT Troop Transport", "CUP_O_Mi8_CHDKZ", 2500, "vehicle"],
    ["Mi-8MTV3 Gunship (RU)", "CUP_O_Mi8_RU", 15000, "vehicle"],
    ["Mi-8MTV3 Gunship (SLA)", "CUP_O_Mi8_SLA_2", 15000, "vehicle"],
   
    ["Ka-50 AT", "CUP_O_Ka50_SLA", 40000, "vehicle"],
    ["Ka-50 AA", "CUP_O_Ka50_AA_SLA", 25000, "vehicle"],
   
   
    ["Ka-60 Air Support (FFAR & GL - Camo)", "CUP_O_Ka60_GL_Hex_CSAT", 5000, "vehicle"],
    ["Ka-60 AT Support (Camo)", "CUP_O_Ka60_Hex_CSAT", 6000, "vehicle"],
    ["Ka-60 Air Support (FFAR & GL - Whale)","CUP_O_Ka60_GL_Whale_CSAT", 5000, "vehicle"],
    ["Ka-60 AT Support (Whale)", "CUP_O_Ka60_Whale_CSAT", 6000, "vehicle"],
 
    ["MH-6J (Black)", "CUP_B_MH6J_USA", 2000, "vehicle"], //Bench seater
    ["AH-6J Escort (Black)", "CUP_B_AH6J_Escort_USA", 7500, "vehicle"], //Standard AH6
    ["AH-6J Escort Mk.II (Large Pods)", "CUP_B_AH6J_Escort19_USA", 10000, "vehicle"], //Large Pods = more rockets
    ["AH-6J Anti-tank", "CUP_B_AH6J_AT_USA", 12000, "vehicle"], //M134 & AGMs - no rockets
    ["AH-6J Multirole", "CUP_B_AH6J_MP_USA", 11000, "vehicle"], // A little bit of everything
   
       
    ["AH-1Z Viper", "CUP_B_AH1Z_USMC", 35000, "vehicle"],
    ["AH-64D Apache", "CUP_B_AH64D_USA", 35000, "vehicle"],
    ["AH-64D Apache (Multirole)", "CUP_B_AH64D_MR_USA", 40000, "vehicle"],
    ["Mi-24 Superhind Mk. IV (ATGM)", "CUP_I_Mi24_Mk4_AT_AAF", 40000, "vehicle"],
    ["Mi-24 Superhind Mk. IV (CAS)", "CUP_I_Mi24_Mk4_S8_GSh_AAF", 35000, "vehicle"],
 
    ["UH-60M Blackhawk", "CUP_B_UH60M_FFV_US", 6000, "vehicle"],
    ["UH-60S Seahawk", "CUP_B_MH60S_FFV_USMC", 6000, "vehicle"],
    ["UH-60M MEV", "CUP_B_UH60M_Unarmed_FFV_MEV_US", 2500, "vehicle"],
    ["UH-1D KSK (Camo)", "CUP_B_UH1D_GER_KSK", 4500, "vehicle"],
    ["UH-1D KSK (Desert)", "CUP_B_UH1D_GER_KSK_Des", 4500, "vehicle"],
    ["UH-1Y Venom", "CUP_B_UH1Y_GUNSHIP_USMC", 10000, "vehicle"],
    ["CH-47 Chinook", "CUP_B_CH47F_USA", 6000, "vehicle"],
   
   
    ["HC-3 Merlin", "CUP_B_Merlin_HC3_Armed_GB", 3000, "vehicle"],
    ["AW-159 Wildcat Troop Transport", "CUP_B_AW159_Unarmed_GB", 3500, "vehicle"],
    ["AW-159 Blackcat Troop Transport", "CUP_B_Wildcat_Unarmed_RN_Blackcat", 3500, "vehicle"],
    ["AW-159 Wildcat CAS", "CUP_B_AW159_Cannon_GB", 18000, "vehicle"],
    ["AW-159 Blackcat CAS", "CUP_B_AW159_Cannon_RN_Blackcat", 18000, "vehicle"],
    ["AW-159 Wildcat Anti-tank", "CUP_B_AW159_Hellfire_GB", 25000, "vehicle"],
    ["AW-159 Blackcat Anti-tank", "CUP_B_AW159_Hellfire_RN_Blackcat", 25000, "vehicle"]
 
/*
    ["M-900 Civilian", "C_Heli_Light_01_civil_F", 4000, "vehicle"], // MH-6, no flares
    ["PO-30 Orca (Black)", "O_Heli_Light_02_unarmed_F", 7000, "vehicle"], // Ka-60
    ["WY-55 Hellcat (Green)", "I_Heli_light_03_unarmed_F", 7000, "vehicle"], // AW159
    ["Mi-290 Taru (Crane) [DLC]", "O_Heli_Transport_04_F", 7500, "vehicle"], // CH-54
    ["Mi-290 Taru (Box) [DLC]", "O_Heli_Transport_04_box_F", 8000, "vehicle"],
    ["Mi-290 Taru (Fuel) [DLC]", "O_Heli_Transport_04_fuel_F", 8500, "vehicle"],
    ["Mi-290 Taru (Bench) [DLC]", "O_Heli_Transport_04_bench_F", 9000, "vehicle"],
    ["Mi-290 Taru (Transport) [DLC]", "O_Heli_Transport_04_covered_F", 9500, "vehicle"],
    ["CH-67 Huron (Black) [DLC]", "B_Heli_Transport_03_unarmed_F", 10000, "vehicle"], // CH-47
    ["CH-49 Mohawk", "I_Heli_Transport_02_F", 10000, "vehicle"], // AW101
    ["Mi-290 Taru (Medical) [DLC]", "O_Heli_Transport_04_medevac_F",12500, "vehicle"],
    ["Mi-290 Taru (Repair) [DLC]", "O_Heli_Transport_04_repair_F", 15000, "vehicle"],
    ["Mi-290 Taru (Ammo) [DLC]", "O_Heli_Transport_04_ammo_F", 25000, "vehicle"],
    ["UH-80 Ghost Hawk (Black)", "B_Heli_Transport_01_F", 25000, "vehicle"], // UH-60 Stealth with 2 side miniguns
    ["UH-80 Ghost Hawk (Green)", "B_Heli_Transport_01_camo_F", 25000, "vehicle"], // UH-60 Stealth with 2 side miniguns (green camo)
    ["CH-67 Huron (Armed) [DLC]", "B_Heli_Transport_03_F", 30000, "vehicle"], // CH-47 with 2 side miniguns
    ["PO-30 Orca (Armed, Black)", "O_Heli_Light_02_v2_F", 30000, "vehicle"], // Armed Ka-60 with orca paintjob
    ["PO-30 Orca (Armed, Hex)", "O_Heli_Light_02_F", 35000, "vehicle"], // Armed Ka-60
    ["WY-55 Hellcat (Armed)", "I_Heli_light_03_F", 40000, "vehicle"], // Armed AW159
    ["AH-99 Blackfoot", "B_Heli_Attack_01_F", 75000, "vehicle"], // RAH-66 with gunner
    ["Mi-48 Kajman (Hex)", "O_Heli_Attack_02_F", 85000, "vehicle"], // Mi-28 with gunner
    ["Mi-48 Kajman (Black)", "O_Heli_Attack_02_black_F", 85000, "vehicle"] // Mi-28 with gunner (black camo)
*/
];
 
planesArray = compileFinal str
[
    ["Caesar BTT", "C_Plane_Civil_01_F", 3000, "vehicle"],
   
    ["AV-8B Harrier AA", "CUP_B_AV8B_CAP_USMC", 55000, "vehicle"],
    ["AV-8B Harrier GBU12", "CUP_B_AV8B_GBU12_USMC", 55000, "vehicle"],  
    ["AV-8B Harrier AGM", "CUP_B_AV8B_AGM_USMC", 60000, "vehicle"],
   
    ["F-35B AA", "CUP_B_F35B_AA_USMC", 60000, "vehicle"],
    ["F-35B CAS", "CUP_B_F35B_CAS_USMC", 60000, "vehicle"],
   
    ["A-10 Thunderbolt II (CAS)", "CUP_B_A10_CAS_USA", 57000,"vehicle"],
    ["A-10 Thunderbolt II (AT)", "CUP_B_A10_AT_USA", 57000, "vehicle"],
   
    ["L-39Z AA (2-seater)", "CUP_B_L39_CAP_CZ", 37500, "vehicle"],//L-39 AA is the cheap plane. It has no missile warning, needs a RO for using AA.
    ["L-39Z CAS (2-seater)", "CUP_B_L39_RKT_CZ", 40000, "vehicle"], //just rockets. RO does nothing
    ["L-39Z Bomber (2-seater)", "CUP_B_L39_BMB_CZ", 40000, "vehicle"], //2-seater but the RO is along for the ride.
   
    ["AC-47 Spooky", "CUP_B_AC47_Spooky_USA", 25000, "vehicle"],
   
    ["Su-34 Bomber", "CUP_O_SU34_LGB_RU", 55000, "vehicle"],//2-seater - needs co-pilot for bombs/AGMS/AA missiles
    ["Su-34 AGM", "CUP_O_SU34_AGM_RU", 65000, "vehicle"], //2-seater - needs co-pilot for bombs/AGMS/AA missiles
   
    ["Su-25TM Frogfoot", "CUP_O_Su25_RU_2", 57000, "vehicle"] //Basically CAS - no AGMs, just guns, CCIP bombs and rockets
 
/*
    ["A-143 Buzzard CAS", "I_Plane_Fighter_03_CAS_F", 120000, "vehicle"],
    // ["A-164 Wipeout CAS", "B_Plane_CAS_01_F", 60000, "vehicle"],
    // ["To-199 Neophron CAS", "O_Plane_CAS_02_F", 60000, "vehicle"],
    ["MQ4A Greyhawk ATGM UAV", "B_UAV_02_F", 65000, "vehicle"],
    ["MQ4A Greyhawk Bomber UAV", "B_UAV_02_CAS_F", 40000, "vehicle"], // Bomber UAVs are a lot harder to use, hence why they are cheaper than ATGMs
    ["K40 Ababil-3 ATGM UAV (CSAT)", "O_UAV_02_F", 65000, "vehicle"],
    ["K40 Ababil-3 Bomber UAV (CSAT)", "O_UAV_02_CAS_F", 40000, "vehicle"],
    ["K40 Ababil-3 ATGM UAV (AAF)", "I_UAV_02_F", 65000, "vehicle"],
    ["K40 Ababil-3 Bomber UAV (AAF)", "I_UAV_02_CAS_F", 40000, "vehicle"]
*/
 
];
 
boatsArray = compileFinal str
[
 
    ["Zodiac", "CUP_B_Zodiac_USMC", 500, "boat"],
    ["PBX", "CUP_O_PBX_RU", 600, "boat"],
    ["RHIB M2 .50cal", "CUP_B_RHIB_USMC", 1000, "boat"],
    ["RHIB Mk.19", "CUP_B_RHIB2Turret_USMC", 1000, "boat"], //Mk19
    /*["Assault Boat (NATO)", "CUP_O_PBX_RU", 600, "boat"],
    ["Assault Boat (CSAT)", "O_Boat_Transport_01_F", 600, "boat"],
    ["Assault Boat (AAF)", "I_Boat_Transport_01_F", 600, "boat"],
    ["Assault Boat (FIA)", "B_G_Boat_Transport_01_F", 600, "boat"],
    ["Motorboat", "C_Boat_Civil_01_F", 1000, "boat"],
    ["Motorboat Rescue", "C_Boat_Civil_rescue_01_F", 900, "boat"],
    ["Motorboat Police", "C_Boat_Civil_police_01_F", 1250, "boat"],
    ["Speedboat HMG (CSAT)", "O_Boat_Armed_01_hmg_F", 4000, "boat"],
    ["Speedboat Minigun (NATO)", "B_Boat_Armed_01_minigun_F", 4000, "boat"],
    ["Speedboat Minigun (AAF)", "I_Boat_Armed_01_minigun_F", 4000, "boat"], */
    ["SDV Submarine (NATO)", "B_SDV_01_F", 750, "submarine"],
    ["SDV Submarine (CSAT)", "O_SDV_01_F", 750, "submarine"],
    ["SDV Submarine (AAF)", "I_SDV_01_F", 750, "submarine"]
 
 
];
 
 
 
allVehStoreVehicles = compileFinal str (call landArray + call armoredArray + call tanksArray + call helicoptersArray + call planesArray + call boatsArray + call hiddenArray);
 
uavArray = compileFinal str
[
    "UAV_02_base_F",
    "UGV_01_base_F",
    "B_UAV_02_F",
    "B_UAV_02_CAS_F"
];
///////////////////////////////////////////////////
banned30VehicleArray = compileFinal str
[
    "CUP_I_Mi24_Mk4_AT_AAF",
    "CUP_I_Mi24_Mk4_S8_GSh_AAF",
    "CUP_B_AH64D_USA",
    "CUP_B_AH64D_MR_USA",
    "CUP_B_AV8B_GBU12_USMC",
    "CUP_O_Su25_RU_2"
];
banned20VehicleArray = compileFinal str
[
    "CUP_O_Mi8_RU",
    "CUP_O_Mi8_SLA_2",
    "CUP_B_AH1Z_USMC",
    "CUP_B_F35B_AA_USMC",
   
    "CUP_O_Ka50_SLA",
    "CUP_O_Ka50_AA_SLA",
   
    "CUP_B_AW159_Hellfire_GB",
    "CUP_B_AW159_Hellfire_RN_Blackcat",
   
    "CUP_B_AV8B_CAP_USMC"
];
///////////////////////////////////////
 
 
 
noColorVehicles = compileFinal str
[
    // Deprecated
];
 
rgbOnlyVehicles = compileFinal str
[
    // Deprecated
];
 
_color = "#(rgb,1,1,1)color";
_texDir = "client\images\vehicleTextures\";
_kartDir = "\A3\soft_f_kart\Kart_01\Data\";
_mh9Dir = "\A3\air_f\Heli_Light_01\Data\";
_mohawkDir = "\A3\air_f_beta\Heli_Transport_02\Data\";
_taruDir = "\A3\air_f_heli\Heli_Transport_04\Data\";
 
colorsArray = compileFinal str
[
    [ // Main colors
        "All",
        [
            ["Black", _color + "(0.01,0.01,0.01,1)"], // #(argb,8,8,3)color(0.1,0.1,0.1,0.1)
            ["Gray", _color + "(0.15,0.151,0.152,1)"], // #(argb,8,8,3)color(0.5,0.51,0.512,0.3)
            ["White", _color + "(0.75,0.75,0.75,1)"], // #(argb,8,8,3)color(1,1,1,0.5)
            ["Dark Blue", _color + "(0,0.05,0.15,1)"], // #(argb,8,8,3)color(0,0.3,0.6,0.05)
            ["Blue", _color + "(0,0.03,0.5,1)"], // #(argb,8,8,3)color(0,0.2,1,0.75)
            ["Teal", _color + "(0,0.3,0.3,1)"], // #(argb,8,8,3)color(0,1,1,0.15)
            ["Green", _color + "(0,0.5,0,1)"], // #(argb,8,8,3)color(0,1,0,0.15)
            ["Yellow", _color + "(0.5,0.4,0,1)"], // #(argb,8,8,3)color(1,0.8,0,0.4)
            ["Orange", _color + "(0.4,0.09,0,1)"], // #(argb,8,8,3)color(1,0.5,0,0.4)
            ["Red", _color + "(0.45,0.005,0,1)"], // #(argb,8,8,3)color(1,0.1,0,0.3)
            ["Pink", _color + "(0.5,0.03,0.3,1)"], // #(argb,8,8,3)color(1,0.06,0.6,0.5)
            ["Purple", _color + "(0.1,0,0.3,1)"], // #(argb,8,8,3)color(0.8,0,1,0.1)
            ["NATO Tan", _texDir + "nato.paa"], // #(argb,8,8,3)color(0.584,0.565,0.515,0.3)
            ["CSAT Brown", _texDir + "csat.paa"], // #(argb,8,8,3)color(0.624,0.512,0.368,0.3)
            ["AAF Green", _texDir + "aaf.paa"], // #(argb,8,8,3)color(0.546,0.59,0.363,0.2)
            ["Bloodshot", _texDir + "bloodshot.paa"],
            ["Carbon", _texDir + "carbon.paa"],
            ["Confederate", _texDir + "confederate.paa"],
            ["Denim", _texDir + "denim.paa"],
            //["Digital", _texDir + "digi.paa"],
            ["Digital Black", _texDir + "digi_black.paa"],
            ["Digital Desert", _texDir + "digi_desert.paa"],
            ["Digital Woodland", _texDir + "digi_wood.paa"],
            //["Doritos", _texDir + "doritos.paa"],
            ["Drylands", _texDir + "drylands.paa"],
            //["Hello Kitty", _texDir + "hellokitty.paa"],
            ["Hex", _texDir + "hex.paa"],
            ["Hippie", _texDir + "hippie.paa"],
            //["ISIS", _texDir + "isis.paa"],
            ["Leopard", _texDir + "leopard.paa"],
            //["Mountain Dew", _texDir + "mtndew.paa"],
            ["'Murica", _texDir + "murica.paa"],
            //["Nazi", _texDir + "nazi.paa"],
            ["Orange Camo", _texDir + "camo_orange.paa"],
            ["Pink Camo", _texDir + "camo_pink.paa"],
            //["Pride", _texDir + "pride.paa"],
            ["Psych", _texDir + "psych.paa"],
            ["Red Camo", _texDir + "camo_red.paa"],
            ["Rusty", _texDir + "rusty.paa"],
            ["Sand", _texDir + "sand.paa"],
            ["Snake", _texDir + "snake.paa"],
            //["Stripes", _texDir + "stripes.paa"],
            //["Stripes 2", _texDir + "stripes2.paa"],
            //["Stripes 3", _texDir + "stripes3.paa"],
            ["Swamp", _texDir + "swamp.paa"],
            ["Tiger", _texDir + "tiger.paa"],
            ["Trippy", _texDir + "rainbow.paa"],
            ["Union Jack", _texDir + "unionjack.paa"],
            ["Urban", _texDir + "urban.paa"],
            //["Weed", _texDir + "weed.paa"],
            ["Woodland", _texDir + "woodland.paa"],
            ["Woodland Dark", _texDir + "wooddark.paa"],
            ["Woodland Tiger", _texDir + "woodtiger.paa"]
        ]
    ],
    [ // Kart colors
        "Kart_01_Base_F",
        [
            ["Black (Kart)", [[0, _kartDir + "kart_01_base_black_co.paa"]]],
            ["White (Kart)", [[0, _kartDir + "kart_01_base_white_co.paa"]]],
            ["Blue (Kart)", [[0, _kartDir + "kart_01_base_blue_co.paa"]]],
            ["Green (Kart)", [[0, _kartDir + "kart_01_base_green_co.paa"]]],
            ["Yellow (Kart)", [[0, _kartDir + "kart_01_base_yellow_co.paa"]]],
            ["Orange (Kart)", [[0, _kartDir + "kart_01_base_orange_co.paa"]]],
            ["Red (Kart)", [[0, _kartDir + "kart_01_base_red_co.paa"]]]
        ]
    ],
    [ // MH-9 colors
        "Heli_Light_01_base_F",
        [
            ["AAF Camo (MH-9)", [[0, _mh9Dir + "heli_light_01_ext_indp_co.paa"]]],
            ["Blue 'n White (MH-9)", [[0, _mh9Dir + "heli_light_01_ext_blue_co.paa"]]],
            ["Blueline (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_blueline_co.paa"]]],
            ["Cream Gravy (MH-9)", [[0, _mh9Dir + "heli_light_01_ext_co.paa"]]],
            ["Digital (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_digital_co.paa"]]],
            ["Elliptical (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_elliptical_co.paa"]]],
            ["Furious (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_furious_co.paa"]]],
            ["Graywatcher (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_graywatcher_co.paa"]]],
            ["ION (MH-9)", [[0, _mh9Dir + "heli_light_01_ext_ion_co.paa"]]],
            ["Jeans (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_jeans_co.paa"]]],
            ["Light (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_light_co.paa"]]],
            ["Shadow (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_shadow_co.paa"]]],
            ["Sheriff (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_sheriff_co.paa"]]],
            ["Speedy (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_speedy_co.paa"]]],
            ["Sunset (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_sunset_co.paa"]]],
            ["Vrana (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_vrana_co.paa"]]],
            ["Wasp (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_wasp_co.paa"]]],
            ["Wave (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_wave_co.paa"]]]
        ]
    ],
    [ // Mohawk colors
        "Heli_Transport_02_base_F",
        [
            ["Dahoman (Mohawk)", [
                [0, _mohawkDir + "Skins\heli_transport_02_1_dahoman_co.paa"],
                [1, _mohawkDir + "Skins\heli_transport_02_2_dahoman_co.paa"],
                [2, _mohawkDir + "Skins\heli_transport_02_3_dahoman_co.paa"]
            ]],
            ["ION (Mohawk)", [
                [0, _mohawkDir + "Skins\heli_transport_02_1_ion_co.paa"],
                [1, _mohawkDir + "Skins\heli_transport_02_2_ion_co.paa"],
                [2, _mohawkDir + "Skins\heli_transport_02_3_ion_co.paa"]
            ]]
        ]
    ],
    [ // Taru base colors
        "Heli_Transport_04_base_F",
        [
            ["Black (Taru)", [
                [0, _taruDir + "heli_transport_04_base_01_black_co.paa"],
                [1, _taruDir + "heli_transport_04_base_02_black_co.paa"],
                [2, _taruDir + "heli_transport_04_pod_ext01_black_co.paa"],
                [3, _taruDir + "heli_transport_04_pod_ext02_black_co.paa"]
            ]]
        ]
    ],
    [ // Taru bench colors
        "O_Heli_Transport_04_bench_F",
        [
            ["Black (Taru)", [[2, _taruDir + "heli_transport_04_bench_black_co.paa"]]]
        ]
    ],
    [ // Taru fuel colors
        "O_Heli_Transport_04_fuel_F",
        [
            ["Black (Taru)", [[2, _taruDir + "heli_transport_04_fuel_black_co.paa"]]]
        ]
    ]
];
 
//General Store Item List
//Display Name, Class Name, Description, Picture, Buy Price, Sell Price.
// ["Medical Kit", "medkits", localize "STR_WL_ShopDescriptions_MedKit", "client\icons\medkit.paa", 400, 200],  // not needed since there are First Ait Kits
customPlayerItems = compileFinal str
[
    ["Water Bottle", "water", localize "STR_WL_ShopDescriptions_Water", "client\icons\waterbottle.paa", 30, 15],
    ["Canned Food", "cannedfood", localize "STR_WL_ShopDescriptions_CanFood", "client\icons\cannedfood.paa", 30, 15],
    ["Repair Kit", "repairkit", localize "STR_WL_ShopDescriptions_RepairKit", "client\icons\briefcase.paa", 20, 10],
    ["Jerry Can (Full)", "jerrycanfull", localize "STR_WL_ShopDescriptions_fuelFull", "client\icons\jerrycan.paa", 20, 10],
    ["Jerry Can (Empty)", "jerrycanempty", localize "STR_WL_ShopDescriptions_fuelEmpty", "client\icons\jerrycan.paa", 5, 2],
    ["Spawn Beacon", "spawnbeacon", localize "STR_WL_ShopDescriptions_spawnBeacon", "client\icons\spawnbeacon.paa", 1000, 500],
    ["Camo Net", "camonet", localize "STR_WL_ShopDescriptions_Camo", "client\icons\camonet.paa", 30, 15],
    ["Syphon Hose", "syphonhose", localize "STR_WL_ShopDescriptions_SyphonHose", "client\icons\syphonhose.paa", 20, 10],
    ["Energy Drink", "energydrink", localize "STR_WL_ShopDescriptions_Energy_Drink", "client\icons\energydrink.paa", 100, 50],
    ["Warchest", "warchest", localize "STR_WL_ShopDescriptions_Warchest", "client\icons\warchest.paa", 1000, 500]
];
 
call compile preprocessFileLineNumbers "mapConfig\storeOwners.sqf";
 
storeConfigDone = compileFinal "true";