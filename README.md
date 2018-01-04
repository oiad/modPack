# salivals mod pack.
All my mods in one place, tested and working by salival

* Discussion URL: https://epochmod.com/forum/topic/44789-salivals-mod-pack-all-my-mods-tested-working/

# Supported mods:

* Bury Bodies by [@salival (repo here)](https://github.com/oiad/buryBodies)
* Community Localizations by [@salival (repo here)](https://github.com/oiad/communityLocalizations)
* Deploy Anything by [@salival (repo here)](https://github.com/oiad/DayZEpochDeployableBike)
* Locate Vehicle by [@salival (repo here)](https://github.com/oiad/locateVehicle)
* Garage Door Opener by [@salival (repo here)](https://github.com/oiad/garageDoorOpener)
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

1. Currently this is set up for Epoch (no Overwatch) Chernarus, you can change this to how you see fit but for the install purposes we will carry on with Chernarus.

2. Copy the <code>DayZ_Epoch_11.Chernarus</code> folder to your <code>Arma2 OA\MPMissions</code> folder

3. Rename the <code>mission - overwatch.sqm</code> to <code>mission.sqm</code> if you are using Overwatch

4. Edit any settings you want in <code>init.sqf</code> and in <code>dayz_code\init\variables.sqf</code> please do any Epoch / configVariables.sqf overwrites in <code>dayz_code\init\variables.sqf</code>

# dayz_server folder install:

1. Copy the <code>dayz_server</code> folder to your <code>Arma 2 OA\@dayz_epoch_server\addons</code> folder

2. Pack your <code>dayz_server</code> into a PBO with your favourite PBO tool.

# ZSC Global Banking install:

1. Overwrite all files in your <code>Arma2 OA\MPMissions\DayZ_Epoch_11.Chernarus</code> with the files from the github repo <code>global banking\DayZ_Epoch_11.Chernarus</code>

# extDB install:

1. Copy the <code>@extDB</code> folder to your main <code>Arma 2 Operation Arrowhead</code> folder (or where you host your server)

2. Edit <code>@extDB\extdb-conf.ini</code> to suit your database settings, mainly the database name, username and password.

3. Edit your server batch file or whatever loads your server to include <code>@extDB</code> in the -mod line, i.e for epoch:
	```sqf
	"-mod=@extDB;@DayZ_Epoch;@DayZ_Epoch_Server"
	```
	for overwatch:
	```sqf
	"-mod=@extDB;@DayzOverwatch;@DayZ_Epoch;@DayZ_Epoch_Server"
	```

# mysql database setup fresh install:

1. If you are only allowed access to your main epoch database from your hosting provider, you can import the <code>SQL\virtualGarage.sql</code> file without editing it.

2. If you want to have an external virtual garage database you will need to edit <code>SQL\virtualGarage.sql</code> and uncomment the following lines:
	```sql
	-- CREATE DATABASE IF NOT EXISTS `extdb` /*!40100 DEFAULT CHARACTER SET latin1 */;
	-- USE `extdb`;
	```

	This will create a seperate database called extDB (useful if you have a couple of servers using the same virtual garage database) FWIW: I had to run this import twice for it to work correctly, it only created the external database the first time, the second time I had to run it to create the table.

3. You will need to edit your <code>@extDB\extdb-conf.ini</code> to suit your database settings!

# infiSTAR install:

1. Copy your <code>AH.sqf, AHConfig.sqf and AT.sqf</code> to your <code>Arma 2 OA\@dayz_epoch_server\addons\dayz_server\infiSTAR</code> folder

2. In <code>Arma 2 OA\@dayz_epoch_server\addons\dayz_server\init\server_functions.sqf</code> find the following line and uncomment it:
	```sqf
	//[] spawn {[] execVM "\z\addons\dayz_server\infiSTAR\AH.sqf";};
	```

# Battleye Filters:

1. Currently I don't have battleye filters set up for DEFAULT Epoch 1.0.6.2 filters, I am working on this but there is a lot that has changed since Epoch 1.0.6.1

**[>> Download <<](https://github.com/oiad/modPack/archive/master.zip)**