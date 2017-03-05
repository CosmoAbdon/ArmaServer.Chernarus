// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: customGroup.sqf
//	@file Author: AgentRev

if (!isServer) exitWith {};

private ["_group", "_pos", "_nbUnits", "_unitTypes", "_uPos", "_unit"];

_group = _this select 0;
_pos = _this select 1;
_nbUnits = param [2, 7, [0]];
_radius = param [3, 10, [0]];

_unitTypes =
[
	"C_man_polo_1_F", "C_man_polo_1_F_euro", "C_man_polo_1_F_afro", "C_man_polo_1_F_asia",
	"C_man_polo_2_F", "C_man_polo_2_F_euro", "C_man_polo_2_F_afro", "C_man_polo_2_F_asia",
	"C_man_polo_3_F", "C_man_polo_3_F_euro", "C_man_polo_3_F_afro", "C_man_polo_3_F_asia",
	"C_man_polo_4_F", "C_man_polo_4_F_euro", "C_man_polo_4_F_afro", "C_man_polo_4_F_asia",
	"C_man_polo_5_F", "C_man_polo_5_F_euro", "C_man_polo_5_F_afro", "C_man_polo_5_F_asia",
	"C_man_polo_6_F", "C_man_polo_6_F_euro", "C_man_polo_6_F_afro", "C_man_polo_6_F_asia"
];

for "_i" from 1 to _nbUnits do
{
	_uPos = _pos vectorAdd ([[random _radius, 0, 0], random 360] call BIS_fnc_rotateVector2D);
	_unit = _group createUnit [_unitTypes call BIS_fnc_selectRandom, _uPos, [], 0, "Form"];
	_unit setPosATL _uPos;

	removeAllWeapons _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	_unit addVest "CUP_V_B_MTV_Pouches";
	_unit addMagazine "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR";
	_unit addMagazine "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR";
	_unit addMagazine "CUP_20Rnd_TE1_Red_Tracer_762x51_SCAR";

	switch (true) do
	{
		// Grenadier every 3 units
		case (_i % 3 == 0):
		{
			_unit addUniform "CUP_U_B_BAF_MTP_S2_UnRolled";
			_unit addMagazine "CUP_1Rnd_HE_M203";
			_unit addWeapon "CUP_arifle_Mk17_CQC_FG";
			_unit addMagazine "CUP_1Rnd_HE_M203";
			_unit addMagazine "CUP_1Rnd_HE_M203";
			
		};
		// AA every 5 units
		case (_i % 45== 0):
		{
			_unit addUniform "CUP_U_B_BAF_MTP_S2_UnRolled";
			_unit addWeapon "CUP_arifle_Mk17_CQC_FG";
			_unit addWeapon "CUP_launch_Igla";
			_unit addMagazine "CUP_Igla_M";
			_unit addMagazine "CUP_Igla_M";
			_unit addMagazine "CUP_Igla_M";

			
		};
		// RPG every 7 units, starting from second one
		case ((_i + 5) % 5 == 0):
		{
			_unit addUniform "CUP_U_B_BAF_MTP_S2_UnRolled";
			_unit addBackpack "CUP_B_USPack_Coyote";
			_unit addWeapon "CUP_arifle_Mk17_CQC_FG";
			_unit addMagazine "CUP_NLAW_M";
			_unit addWeapon "CUP_launch_NLAW";
			_unit addMagazine "CUP_NLAW_M";
			_unit addMagazine "CUP_NLAW_M";
		};
		// Rifleman
		default
		{
			_unit addUniform "CUP_U_B_BAF_MTP_S2_UnRolled";

			if (_unit == leader _group) then
			{
				_unit addWeapon "CUP_arifle_Mk17_CQC_FG";
				_unit setRank "SERGEANT";
			}
			else
			{
				_unit addWeapon "CUP_arifle_Mk17_CQC_FG";
			};
		};
	};


	_unit addRating 1e11;
	_unit spawn addMilCap;
	_unit spawn refillPrimaryAmmo;
	_unit call setMissionSkill;
	_unit addEventHandler ["Killed", server_playerDied];
};

[_group, _pos] call defendArea;
