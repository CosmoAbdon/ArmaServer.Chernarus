#define GUI_GRID_H	(0.04)
disableSerialization;
_dsp = uiNamespace getVariable "RscDisplaySimpleAmmoRepacker";
if not isNull _dsp then
{
	_mergeButton = _dsp displayCtrl 1600;
	_mergeButton ctrlEnable false;
	_lbUnMerged = _dsp displayCtrl 2100;
	_lbUnMerged ctrlEnable false;
	_controls = +(allControls _dsp);
	for "_c" from 0 to (count _controls -1) do
	{
		_ctrl = _controls select _c;
		if (ctrlFade _ctrl > 0) then
		{
			_ctrl ctrlSetFade 0;
			_ctrl ctrlCommit 0.1;
			waitUntil { uiSleep 0.05; ctrlCommitted _ctrl };
			playSound ["ReadOutClick", true];
		};
		if (ctrlIDC _ctrl isEqualTo 2200) then
		{
			_ctrlPos = ctrlPosition _ctrl;
			_ctrl ctrlSetPosition [_ctrlPos select 0, _ctrlPos select 1, _ctrlPos select 2, 2.5 * GUI_GRID_H];
			_ctrl ctrlCommit 0.1;
			waitUntil {uiSleep 0.01; ctrlCommitted _ctrl };
		};
	};

	[_dsp] spawn
	{
		disableSerialization;
		_dsp = _this select 0;
		_ctrl = _dsp displayCtrl 1000;
		while {not isNull _dsp} do
		{
			if not isNull _dsp then
			{
				_txt = ctrlText _ctrl;
				_addBlinker = _ctrl ctrlSetText format["%1_", _txt];
				if not isNull _dsp then
				{
					uiSleep 0.3;
					_txt = ctrlText _ctrl;
					_remBlinker = _ctrl ctrlSetText (_txt select [0,(count _txt -1)]);
					if not isNull _dsp then
					{
						uiSleep 0.3;
					};
				};
			};
		};
	};
	_rscPic = _dsp displayCtrl 1200;
	_output = _dsp displayCtrl 1001;
	_output ctrlSetText "Verificando mags...";
	private ["_dspn","_mag","_abort"];
	_magTypes = [];
	{
		_cn = _x select 0;
		_max = getNumber (configFile >> "cfgMagazines" >> _cn >> "count");
		_dspn = getText (configFile >> "cfgMagazines" >> _cn >> "displayname");
		if not(_x select 1 isEqualTo _max) then
		{
			if not([_dspn, _cn] in _magTypes) then
			{
				if not(_x select 2) then
				{
					_magTypes pushBack [_dspn, _cn];
				};
			};
		};
	} forEach (magazinesAmmoFull player); // magazinesAmmoFull does not mean only full mags...

	if (count _magTypes isEqualTo 0) then
	{
		_output ctrlSetText "Nada para reembalar.";
	};

	if (count _magTypes > 0) then
	{
		_output ctrlSetText "Selecione um tipo de mag e clique em 'Repack' botão.";
		lbClear _lbUnmerged;
		{
			_index = _lbUnmerged lbAdd (_x select 0);
			_lbUnmerged lbSetData [_index, _x select 1];
		} forEach _magTypes;
		_lbUnmerged ctrlEnable true;
		_lbUnmerged lbSetCurSel 0;
	};

	if not isNil"_abort" then
	{
		_output ctrlSetText "Remova a mag usada da arma.";
	};
};
