// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: createRandomSoldierC.sqf

if (!isServer) exitWith {};

private ["_soldierTypes", "_weaponTypes", "_group", "_position", "_soldier"];

_soldierTypes = ["CUP_C_C_Policeman_01", "CUP_C_C_Policeman_02", "CUP_C_C_Rocker_01", "CUP_C_C_Rocker_02", "CUP_C_C_Rocker_03", "CUP_C_C_Rocker_04"];

_group = _this select 0;
_position = _this select 1;
_soldier = _group createUnit [_soldierTypes call BIS_fnc_selectRandom, _position, [], 0, "NONE"];

[_soldier] call createRandomSoldierSoul; // random soldier loadout by soulkobk

_soldier spawn refillPrimaryAmmo;
_soldier call setMissionSkill;

_soldier addEventHandler ["Killed", server_playerDied];

_soldier
