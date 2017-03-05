disableSerialization;
_dsp = uiNamespace getVariable "RscDisplaySimpleAmmoRepacker";
if not isNull _dsp then
{
	_lbUnMerged = _dsp displayCtrl 2100;
	_rscPic = _dsp displayCtrl 1200;
	_output = _dsp displayCtrl 1001;
	_mergeButton = _dsp displayCtrl 1600;
	_cn = _lbUnMerged lbData (_this select 1);
	_icon = getText (configFile >> "cfgMagazines" >> _cn >> "picture");
	_rscPic ctrlSetText _icon;
	_max = getNumber (configFile >> "cfgMagazines" >> _cn >> "count");
	_totalMagsOfType = 0;
	_usedMagsOfType = 0;
	_maxBullets = 0;
	_curBullets = 0;
	{
		if not(_x select 2) then
		{
			if ((_x select 0) isEqualTo _cn) then
			{
				_totalMagsOfType = _totalMagsOfType + 1;
				if not((_x select 1) isEqualTo _max) then
				{
					_usedMagsOfType = _usedMagsOfType + 1;
				};
				_maxBullets = _maxBullets + _max;
				_curBullets = _curBullets + (_x select 1);
				_output ctrlSetText format["Used = %1, Full = %2.", _usedMagsOfType, (_totalMagsOfType - _usedMagsOfType)];
				playSound ["ReadOutClick", true];
				uiSleep 0.2;
			};
		};
	} forEach (magazinesAmmoFull player);

	if (_usedMagsOfType > 1) then
	{
		_mergeButton ctrlSetText "Repack";
		_mergeButton buttonSetAction "[] ExecVM 'scarCODE\SimpleAmmoRepacker\sqf\pack.sqf'";
		_mergeButton ctrlEnable true;

	};

	// Check if used mags is lower than 2
	if (_usedMagsOfType < 2) then
	{
		_output ctrlSetText "1 mag não é suficiente."
	};
};
