// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: getDefaultClothing.sqf
//	@file Author: AgentRev
//	@file Created: 22/12/2013 22:04

private ["_unit", "_item", "_side", "_isSniper", "_isDiver", "_defaultVest", "_result"];

_unit = _this select 0;
_item = _this select 1;

if (typeName _unit == "OBJECT") then
{
	_side = if (_unit == player) then { playerSide } else { side _unit };
	_unit = typeOf _unit;
}
else
{
	_side = _this select 2;
};

_isSniper = (["_sniper_", _unit] call fn_findString != -1);
_isDiver = (["_diver_", _unit] call fn_findString != -1);

_defaultVest = "V_Rangemaster_Belt";

_result = "";

switch (_side) do
{
	case BLUFOR:
	{
		switch (true) do
		{
			case (_isSniper):
			{
				if (_item == "uniform") then { _result = "CUP_U_B_BAF_DPM_Ghillie" };
				if (_item == "vest") then { _result = "CUP_V_B_GER_Carrier_Vest" };
			};
			case (_isDiver):
			{
				if (_item == "uniform") then { _result = "U_B_Wetsuit" };
				if (_item == "vest") then { _result = "V_RebreatherB" };
				if (_item == "goggles") then { _result = "G_Diving" };
			};
			default
			{
				if (_item == "uniform") then { _result = "CUP_U_B_BAF_DDPM_S1_RolledUp" };
				if (_item == "vest") then { _result = "CUP_V_B_GER_Carrier_Vest" };
			};
		};

		if (_item == "headgear") then { _result = "CUP_H_FR_BeanieGreen" };
	};
	case OPFOR:
	{
		switch (true) do
		{
			case (_isSniper):
			{
				if (_item == "uniform") then { _result = "CUP_U_O_TK_Ghillie_Top" };
				if (_item == "vest") then { _result = "CUP_V_O_Ins_Carrier_Rig" };
			};
			case (_isDiver):
			{
				if (_item == "uniform") then { _result = "U_O_Wetsuit" };
				if (_item == "vest") then { _result = "V_RebreatherIR" };
				if (_item == "goggles") then { _result = "G_Diving" };
			};
			default
			{
				if (_item == "uniform") then { _result = "CUP_U_O_TK_Officer" };
				if (_item == "vest") then { _result = "CUP_V_O_Ins_Carrier_Rig" };
			};
		};

		if (_item == "headgear") then { _result = "CUP_H_ChDKZ_Beanie" };
	};
	default
	{
		switch (true) do
		{
			case (_isSniper):
			{
				if (_item == "uniform") then { _result = "CUP_U_I_Ghillie_Top" };
				if (_item == "vest") then { _result = "CUP_V_I_Carrier_Belt" };
			};
			case (_isDiver):
			{
				if (_item == "uniform") then { _result = "U_I_Wetsuit" };
				if (_item == "vest") then { _result = "V_RebreatherIA" };
				if (_item == "goggles") then { _result = "G_Diving" };
			};
			default
			{
				if (_item == "uniform") then { _result = "CUP_U_I_GUE_Flecktarn" };
				if (_item == "vest") then { _result = "CUP_V_I_Carrier_Belt" };
			};
		};

		if (_item == "headgear") then { _result = "CUP_H_C_Beanie_02" };
	};
};

_result
