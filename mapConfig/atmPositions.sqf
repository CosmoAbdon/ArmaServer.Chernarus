// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2015 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: atmPositions.sqf
//	@file Author: AgentRev

// ATM positions for Chernarus map
[
	[10655.9, 12201.3, 1.49722],
	[11008.4, 13474.7, 1.28064],
	[11726.2, 13756.5, 1.46335],
	[9018.87, 12029.3, 1.46615],
	[12662.9, 14265.5, 1.41575],
	[12589.4, 14374.4, 1.47169],
	[14901.8, 11061, 1.28029],
	[12415.7, 15561.3, 1.52174],
	[9297.11, 15871, 1.28064],
	[16702.7, 12511.1, 1.51126],
	[16774.8, 12594.6, 1.2696],
	[16816.7, 12579.4, 1.46806],
	[7406.35, 15411, 1.28045],
	[16889.7, 12670.5, 1.45023],
	[16886.1, 12808, 1.51334],
	[6800.42, 15588.9, 1.28063],
	[14610.1, 16819.7, 1.4267],
	[5077.96, 11264.2, 1.33378],
	[17431.6, 13948.1, 1.48752],
	[7081.58, 16402.5, 1.27961],
	[15881.5, 16294.8, 0.923527],
	[16660, 16099.6, 1.51124],
	[14913.1, 17619.6, 1.41572],
	[4181.9, 11785.4, 1.49824],
	[8626.68, 18265.1, 1.5052],
	[4533.39, 14037.3, 1.28093],
	[13980.5, 18634.7, 1.43084],
	[3799.2, 11093.6, 1.30416],
	[16453.4, 17221.1, 1.48305],
	[10304.8, 19075.9, 1.41508],
	[18102.5, 15263.6, 1.41139],
	[3701.12, 11801.5, 1.50067],
	[3697.72, 12254.6, 1.47997],
	[14007, 18780, 1.43188],
	[3715.01, 13030.8, 1.48747],
	[3925.02, 13854.2, 1.46465],
	[3777.4, 13517.8, 1.281],
	[3698.84, 13199.2, 1.43258],
	[3574.93, 12800.7, 1.4643],
	[4920.61, 16156.4, 1.28644],
	[3497.09, 13000.5, 1.48262],
	[19306.5, 13232.1, 1.25863],
	[3416.05, 13279.2, 1.27889],
	[3593.64, 13994.7, 1.28713],
	[3282, 12963.6, 1.54106],
	[20191.7, 11732.4, 1.52124],
	[20303.8, 11698.2, 1.60027],
	[18779.9, 16633.7, 1.42235],
	[9434.56, 20286.3, 1.47977],
	[20475.7, 8886.04, 1.44412],
	[3739.72, 17656.5, 1.26092],
	[14616.6, 20810.3, 1.2803],
	[20778.6, 6802.16, 1.47408],
	[20936.4, 16846.1, 1.3979],
	[21263.6, 16314.5, 1.38513],
	[20937.5, 16964.4, 1.40488],
	[25618.6, 21353.5, 1.52992],
	[27030.1, 23282.8, 1.396]
]
// The above array was built using the following code snippet called from the mission editor debug console:
/*
_atms = [];
{
	if ((str _x) find ": atm_" != -1) then
	{
		_pos = _x modelToWorld [0,0,0];
		if (surfaceIsWater _pos) then
		{
			_pos = _pos vectorAdd ((getPosASL _x) vectorDiff (getPosASLW _x));
		};
		_atms pushBack _pos;
	};
} forEach nearestObjects [player, [], 999999];

copyToClipboard str _atms;
*/
