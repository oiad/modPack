# salivals mod pack.
All my mods in one place, tested and working by salival

* Discussion URL:

# Supported mods:

* Bury Bodies by [@salival (repo here)](https://github.com/oiad/buryBodies)
* Community Localizations by [@salival (repo here)](https://github.com/oiad/communityLocalizations)
* Deploy Anything by [@salival (repo here)](https://github.com/oiad/DayZEpochDeployableBike)
* Locate Vehicle by [@salival (repo here)](https://github.com/oiad/locateVehicle)
* Safe Zone Relocate by [@salival (repo here)](https://github.com/oiad/safeZoneRelocate)
* Service Points by [@salival (repo here)](https://github.com/oiad/service_points)
* Take Clothes by [@salival (repo here)](https://github.com/oiad/TakeClothes)
* Virtual Garage by [@salival (repo here)](https://github.com/oiad/virtualGarage)
* Vehicle Key Changer by [@salival (repo here)](https://github.com/oiad/vkc)
* ZSC by [@salival (repo here)](https://github.com/oiad/ZSC)

# REPORTING ERRORS/PROBLEMS

1. Please, if you report issues can you please attach (on pastebin or similar) your CLIENT rpt log file as this helps find out the errors very quickly. To find this logfile:

	```sqf
	C:\users\<YOUR WINDOWS USERNAME>\AppData\Local\Arma 2 OA\ArmA2OA.RPT
	```

# Install:

# Mission folder install:

1. Currently this is set up for Chernarus, you can change this to how you see fit but for the install purposes we will carry on with Chernarus.

2. Copy the <code>DayZ_Epoch_11.Chernarus</code> folder to your <code>Arma2 OA\MPMissions</code> folder

3. Edit any settings you want in <code>init.sqf</code> and in <code>dayz_code\init\variables.sqf</code> please do any Epoch / configVariables.sqf overwrites in <code>dayz_code\init\variables.sqf</code>

4. Follow the following installation steps to further modify the installed mods (i.e ZSC for global banking/infiSTAR integration)

4a. [ZSC installation index](https://github.com/oiad/ZSC#index)

# dayz_server folder install:

1. Copy the <code>dayz_server</code> folder to your <code>Arma 2 OA\@dayz_epoch_server\addons</code> folder

2. Pack your <code>dayz_server</code> into a PBO with your favourite PBO tool.

# infiSTAR install:

1. Copy your <code>AH.sqf, AHConfig.sqf and AT.sqf</code> to your <code>Arma 2 OA\@dayz_epoch_server\addons\dayz_server\infiSTAR</code> folder

2. In <code>Arma 2 OA\@dayz_epoch_server\addons\dayz_server\init\server_functions.sqf</code> find the following line and uncomment it:
	```sqf
	//[] spawn {[] execVM "\z\addons\dayz_server\infiSTAR\AH.sqf";};
	```

# Battleye Filters:

1. Currently I don't have battleye filters set up for DEFAULT Epoch 1.0.6.2 filters, I am working on this but there is a lot that has changed since Epoch 1.0.6.1

**[>> Download <<](https://github.com/oiad/communityLocalizations/archive/master.zip)**