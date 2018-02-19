private "_worldName";

_worldName = toLower worldName;

switch _worldName do {
	case "chernarus": {
		[
			["Functionary1_EP1_DZ",[6324.71,7787,0.00143433],64],
			["Functionary1_EP1_DZ",[4057.35,11662.7,0.000128174],47],
			["Functionary1_EP1_DZ",[11461,11348.6,0.00143433],312]
		] call server_spawnTraders;
	};
	case "lingor": {
		[
			["Functionary1_EP1_DZ",[3020.2061,5945.2783,0.22765107],0],
			["Functionary1_EP1_DZ",[4140.2051,1505.2682,2.2888184e-005],54.701393],
			["Functionary1_EP1_DZ",[7519.0171,2949.8694,6.1988831e-006],-177.15651],
			["Functionary1_EP1_DZ",[4239.9063,4841.8989,3.8146973e-006],93.599602]
		] call server_spawnTraders;
	};
	case "namalsk": {
		[
			["Functionary1_EP1_DZ",[4339.7476,4785.6826,4.529953e-006],-124.0745],
			["Functionary1_EP1_DZ",[4711.7993,8922.0303,-9.5367432e-006],93.216309],
			["Functionary1_EP1_DZ",[5793.0386,10780.646,-1.9073486e-006],95.136726],
			["Functionary1_EP1_DZ",[7322.6367,7988.499,-3.8146973e-005],-65.537285]
		] call server_spawnTraders;
	};
	case "napf": {
		[
			["Functionary1_EP1_DZ",[12399.83,5054.3413,0.2068495],52],
			["Functionary1_EP1_DZ",[15529.827,13236.555,2.3841858e-006],164],
			["Functionary1_EP1_DZ",[8252.4922,15494.612,0.22058211],24.5],
			["Functionary1_EP1_DZ",[2123.4653,7806.499,0.28556034],52.873837]
		] call server_spawnTraders;
	};
	case "panthera2": {
		[
			["Functionary1_EP1_DZ",[4770.4067,7482.2651,-1.6927719e-005],0],
			["Functionary1_EP1_DZ",[4431.1997,1616.5604,1.9073486e-006],-85.139679],
			["Functionary1_EP1_DZ",[8252.4922,15494.612,0.22058211],93.33667]
		] call server_spawnTraders;
	};
	case "tavi": {
		[
			["Functionary1_EP1_DZ",[5461.0132,8762.3438,0.056497198],52],
			["Functionary1_EP1_DZ",[11026.932,842.23804,0.18712912],138.57352],
			["Functionary1_EP1_DZ",[17231.154,7661.1392,0.102005],-202.23622],
			["Functionary1_EP1_DZ",[12643.531,11811.004,100.51027],100.51027],
			["Functionary1_EP1_DZ",[15370.618,16458.928,0.056785069],-188.12981],
			["Functionary1_EP1_DZ",[10167.308,19075.475,0.26185527],-116.41749]
		] call server_spawnTraders;
	};
	default {diag_log format ["[ZSC] The map this server is running (%1) is currently not supported by ZSC for global banking traders.",_worldName];};
};