# salivals mod pack for Epoch 1.0.7
All my mods in one place, tested and working by salival update for Epoch 1.0.7 by Airwaves Man

* Discussion URL: https://epochmod.com/forum/topic/44789-salivals-mod-pack-all-my-mods-tested-working/

# Supported mods:

* Bury Bodies [(repo here)](https://github.com/oiad/buryBodies)
* Deploy Anything [(repo here)](https://github.com/oiad/DayZEpochDeployableBike)
* Locate Vehicle [(repo here)](https://github.com/oiad/locateVehicle)
* Garage Door Opener [(repo here)](https://github.com/oiad/garageDoorOpener)
* Safe Zone Relocate [(repo here)](https://github.com/oiad/safeZoneRelocate)
* Service Points [(repo here)](https://github.com/oiad/service_points)
* Take Clothes [(repo here)](https://github.com/oiad/TakeClothes)
* Virtual Garage [(repo here)](https://github.com/oiad/virtualGarage)
* Vehicle Key Changer [(repo here)](https://github.com/oiad/vkc)
* Remote Vehicles [(repo here)](https://github.com/oiad/remoteVehicle)

# REPORTING ERRORS/PROBLEMS

1. Please, if you report issues can you please attach (on pastebin or similar) your CLIENT rpt log file as this helps find out the errors very quickly. To find this logfile:

	```sqf
	C:\users\<YOUR WINDOWS USERNAME>\AppData\Local\Arma 2 OA\ArmA2OA.RPT
	```

**[>> Download <<](https://github.com/oiad/modPack/archive/master.zip)**

# INDEX:

* [Mission folder install](https://github.com/oiad/modPack#mission-folder-install)
* [dayz_server install](https://github.com/oiad/modPack#dayz_server-folder-install)
* [mySQL database setup fresh install](https://github.com/oiad/modPack#mySQL-database-setup-fresh-install)
* [Battleye Filters](https://github.com/oiad/modPack#battleye-filters)
	
# Install:

This pack is meant to be installed on a fresh Epoch 1.0.7 Server. Do not install anything before this. No Admin Tool, no Spawn Selection or anything else. Also take the stock Epoch 1.0.7 Battleye filters and overwrite them with the filters that come with this pack.
By default the trader files are in Coins format and single currency is turned on. To enable Briefcases please set Z_SingleCurrency = false; and use the Normal traders in the description.ext.

# Mission folder install:

1. Currently this is set up for Epoch Chernarus, you can change this to how you see fit but for the install purposes we will carry on with Chernarus.

2. Copy the <code>DayZ_Epoch_11.Chernarus</code> folder to your <code>Arma2 OA\MPMissions</code> folder

3. Any overwrites to any settings you make from the following file: <code>dayz_code\configVariables.sqf</code>

4. Pack your <code>DayZ_Epoch_11.Chernarus</code> folder into a PBO with your favourite PBO tool.

# dayz_server folder install:

1. Copy the <code>dayz_server</code> folder to your <code>Arma 2 OA\@dayz_epoch_server\addons</code> folder

2. Pack your <code>dayz_server</code> folder into a PBO with your favourite PBO tool.

3. Any server side mods you need to install (WAI/DZMS/DZAI/map edits) should be placed after the following line in <code>dayz_server\system\server_monitor.sqf</code>:
	```sqf
	execVM "\z\addons\dayz_server\system\lit_fireplaces.sqf";
	```

# Editing:

1. The whole configVariables.sqf is in your missionfile, so you can change whatever you want. You do not have to move the changed lines into the init.sqf.

# Enabling ZSC/global banking:

1. In <code>dayz_code\configVariables.sqf</code> in your missionfile toggle the following options to suit your servers requirements:
	```sqf
	Z_singleCurrency = true; // Enable or disable coins?
	Z_globalBanking = true; // Enable global banking? Disabled by default.
	Z_globalBankingTraders = true; // Enable global banking traders at trader cities?
	```

# mySQL database setup fresh install:

1. If you are only allowed access to your main epoch database from your hosting provider, you can import the <code>SQL\virtualGarage.sql</code> file without editing it.

2. Virtual Garage includes a custom<code>HiveExt.dll</code> with a customizable table name and stored vehicle cleanup days, this needs to replace your current/official Epoch <code>HiveExt.dll</code> copy the supplied <code>HiveExt.dll</code> from <code>@DayZ_Epoch_Server</code> to your <code>Arma2 OA\@DayZ_Epoch_Server</code> folder.

3. Open your HiveExt.ini and edit the [Objects] section, add or modify the following code to this section. If needed configure the [ObjectDB] section for external object database settings

```
; Table name for the virtual garage data to be stored in, default table is 'garage'
;VGTable = garage
; Days for a stored vehicle to be cleaned up after, if set to -1 this feature is disabled. Default 35 days
;CleanupVehStoredDays = 35
; Log object cleanup DELETE statements (per object), including virtual garage. Default is false
;LogObjectCleanup = false
```

# Battleye Filters:

1. Take all 3 Battleye files (script.txt, createvehicle.txt, publicvariable.txt) and copy them into your server config folder where the other Battleye filters are and overwrite them.

