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
* ZSC/Global Banking by [@salival (repo here)](https://github.com/oiad/ZSC)

# REPORTING ERRORS/PROBLEMS

1. Please, if you report issues can you please attach (on pastebin or similar) your CLIENT rpt log file as this helps find out the errors very quickly. To find this logfile:

	```sqf
	C:\users\<YOUR WINDOWS USERNAME>\AppData\Local\Arma 2 OA\ArmA2OA.RPT
	```

# INDEX:

* [Mission folder install](https://github.com/oiad/modPack#mission-folder-install)
* [dayz_server install](https://github.com/oiad/modPack#dayz_server-folder-install)
* [Enabling ZSC/global banking](https://github.com/oiad/modPack#enabling-zscglobal-banking)
* [mySQL database setup](https://github.com/oiad/modPack#mysql-database-setup)
* [infiSTAR install](https://github.com/oiad/modPack#infistar-install)
* [Battleye Filters](https://github.com/oiad/modPack#battleye-filters)
	
# Install:

By default the trader files are in Briefcase format and single currency is turned off. To enable coins please see this option: [Enabling coins](https://github.com/oiad/modPack#zscglobal-banking)

# Mission folder install:

1. Currently this is set up for Epoch (no Overwatch) Chernarus, you can change this to how you see fit but for the install purposes we will carry on with Chernarus.

2. Copy the <code>DayZ_Epoch_11.Chernarus</code> folder to your <code>Arma2 OA\MPMissions</code> folder

3. Rename the <code>mission - overwatch.sqm</code> to <code>mission.sqm</code> if you are using Overwatch

4. Any overwrites to any settings you make from the following files:
	```sqf
	https://github.com/EpochModTeam/DayZ-Epoch/blob/master/SQF/dayz_code/configVariables.sqf
	https://github.com/EpochModTeam/DayZ-Epoch/blob/master/Server%20Files/MPMissions/DayZ_Epoch_11.Chernarus/init.sqf
	```
	Please put your overwrites in <code>dayz_code\init\variables.sqf</code>

5. Download the <code>stringTable.xml</code> file linked below from the [Community Localization GitHub](https://github.com/oiad/communityLocalizations) and copy it to your mission folder, it is a community based localization file and contains translations for major community mods including this one.

**[>> Download stringTable.xml <<](https://github.com/oiad/communityLocalizations/blob/master/stringtable.xml)**

6. Pack your <code>DayZ_Epoch_11.Chernarus</code> folder into a PBO with your favourite PBO tool.

# dayz_server folder install:

1. Copy the <code>dayz_server</code> folder to your <code>Arma 2 OA\@dayz_epoch_server\addons</code> folder

2. Pack your <code>dayz_server</code> folder into a PBO with your favourite PBO tool.

3. Any server side mods you need to install (WAI/DZMS/DZAI/map edits) should be placed after the following line in <code>dayz_server\system\server_monitor.sqf</code>:
	```sqf
	[] spawn server_spawnEvents;
	```

# Enabling ZSC/global banking:

1. In <code>DayZ_Epoch_11.Chernarus\dayz_code\init\variables.sqf</code> toggle the following options to suit your servers requirements:
	```sqf
	Z_singleCurrency = false; // Enable or disable coins?
	Z_globalBanking = false; // Enable global banking? Disabled by default.
	Z_globalBankingTraders = false; // Enable global banking traders at trader cities?
	```

2. In <code>DayZ_Epoch_11.Chernarus\description.ext</code> uncomment the following line:
	```sqf
	//#include "dayz_code\Configs\CfgServerTrader.hpp" // Uncomment for coins CfgServerTrader files.
	```
	
	And delete or comment out this line:
	```sqf
	#include "\z\addons\dayz_code\Configs\CfgServerTrader\CfgServerTrader.hpp" // Standard briefcase trader files.
	```

# mysql database setup	:

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
