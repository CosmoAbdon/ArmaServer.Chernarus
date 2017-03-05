[] execVM "scarCODE\SimpleAmmoRepacker\sqf\pack.sqf";
[] execVM "scarCODE\SimpleAmmoRepacker\sqf\onLoad.sqf";
[] execVM "scarCODE\SimpleAmmoRepacker\sqf\onLbSelChanged.sqf";

if hasInterface then
{
    waitUntil { if (not isNull(findDisplay 46) AND typeOf player isEqualTo "headgear") then { true } else { uiSleep 0.5; false } };
    player addAction ["<img size='1.4' image='\a3\ui_f\data\IGUI\Cfg\Actions\reload_ca.paa' />  Ammo Repack",{createDialog'RscDisplaySimpleAmmoRepacker';}, "", -1, false, true, "", "alive player"];
    uiNamespace setVariable ["RscDisplaySimpleAmmoRepacker", displayNull];
};
