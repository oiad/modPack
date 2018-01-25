# infiSTAR install:

1. Copy your <code>AH.sqf, AHConfig.sqf and AT.sqf</code> to your <code>Arma 2 OA\@dayz_epoch_server\addons\dayz_server\infiSTAR</code> folder

2. In <code>Arma 2 OA\@dayz_epoch_server\addons\dayz_server\init\server_functions.sqf</code> find the following line and uncomment it:
	```sqf
	//[] execVM "\z\addons\dayz_server\infiSTAR\AH.sqf";
	```