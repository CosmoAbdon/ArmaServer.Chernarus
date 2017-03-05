disableSerialization;
_dsp = uiNamespace getVariable "RscDisplaySimpleAmmoRepacker";
if not isNull _dsp then
{
	private ["_cancel"];
	_mergeButton = _dsp displayCtrl 1600;
	if (ctrlEnabled _mergeButton) then
	{
		_mergeButton ctrlEnable false;
		_mergeButton buttonSetAction "hint'nope.'";
		_lbMags = _dsp displayCtrl 2100;
		_output = _dsp displayCtrl 1001;
		_curSel = lbCurSel _lbMags;
		_cn = _lbMags lbData _curSel; // Get the classname
		_usedMags = 0;
		_fullMags = 0;
		_roundsInUsed = [];
		_flasher = [_output] spawn
		{
			_output = _this select 0;
			while {true} do
			{
				playSound ["Beep_Target", true];
				_output ctrlSetText "Repacking...";
				uiSleep 0.3;
				_output ctrlSetText "";
				uiSleep 0.3;
			};
		};

		_max = getNumber (configFile >> "cfgMagazines" >> _cn >> "count");
		{
			if (_x select 0 isEqualTo _cn) then
			{
				if not(_x select 1 isEqualTo _max) then
				{
					_usedMags = _usedMags + 1;
					_roundsInUsed pushBack [_forEachIndex, (_x select 1)];
				};
				if (_x select 1 isEqualTo _max) then
				{
					_fullMags = _fullMags + 1;
				};
				uiSleep ((count magazinesAmmoFull player) / 300);
			};
		} forEach (magazinesAmmoFull player);
		if (_usedMags < 2) then
		{
			_output ctrlSetText "Não há mags suficientes!";
		};
		if (_usedMags > 1) then
		{
			if not isNull _dsp then
			{
				player removeMagazines _cn;
				uiSleep (3 + random 2);
				_magsToAdd = _fullMags;
				_roundsFromUsed = 0;
				{
					_roundsFromUsed = _roundsFromUsed + (_x select 1);
					if (_roundsFromUsed > _max OR _roundsFromUsed isEqualTo _max) then
					{
						_magsToAdd = _magsToAdd + 1;
						_roundsFromUsed = _roundsFromUsed - _max;
					};
				} forEach _roundsInUsed;
				if not isNull _dsp then
				{
					player addMagazines [_cn, _magsToAdd];
					if (_roundsFromUsed > 0) then
					{
						player addMagazine [_cn, _roundsFromUsed];
					};
					terminate _flasher;
					_output ctrlSetText format["Concluído. Reembalado %1 mag%2 %3", _magsToAdd, if (_magsToAdd > 1) then {"s"} else {""}, if (_roundsFromUsed > 0) then { format["+ 1 Mag com %1 Ammo%2", _roundsFromUsed, if (_roundsFromUsed > 1) then {"s"} else {""}] } else {""}];
				};
			};
		};
	};
};
