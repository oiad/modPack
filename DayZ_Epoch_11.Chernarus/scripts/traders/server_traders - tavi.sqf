/*

	CUSTOM TRADERS FOR TAVIANA EPOCH
	(Credits: DayZ Epoch Devs for their original traders.)
	AUTHOR: AVendettaForYou
	Date: 12/11/2013

*/

serverTraders = [
"GUE_Worker2",
"Soldier_Sniper_KSVK_PMC",
"Soldier_GL_PMC",
"GUE_Soldier_Pilot",
"GUE_Woodlander3",
"Worker4",
"Reynolds_PMC",
"Soldier_Sniper_PMC",
"GUE_Soldier_3",
"RU_Doctor",
"Doctor",
"UN_CDF_Soldier_Pilot_EP1",
"RU_Worker4",
"RU_Woodlander4",
"Citizen3",
"RU_Damsel5",
"Dr_Hladik_EP1",
"GUE_Commander",
"GUE_Soldier_CO",
"Profiteer2_EP1",
"RU_Farmwife5",
"GUE_Woodlander1",
"RU_Worker1",
"GUE_Soldier_2"];

/*---------------------------------------------------------------------------
			HERO VENDORS
---------------------------------------------------------------------------*/

//COMBINATION VENDOR
menu_Soldier_Sniper_PMC = [
	[["Attachments",693],["Ammunition",478],["Currency and gems",1100],["Clothes",476],["Helicopter Armed",493],["Military Armed",562],["Trucks Armed",479],["Weapons",477]],
	[],
	"hero"
];
//SUPPLIES
menu_GUE_Woodlander3 = [
	[["Building Supplies",678],["Currency and gems",1100],["Tools",679],["Vehicle Parts",677]],
	[],
	"hero"
];
//MEDICAL
menu_RU_Doctor = [
	[["Chem-lites/Flares",542],["Medical Supplies",541],["Smoke Grenades",543]],
	[["FoodBioMeat","ItemZombieParts",1,1,"buy","Zombie Parts","Bio Meat",101]],
	"hero"
];
//FOOD & DRINK
menu_RU_Damsel5 = [
	[["Backpacks",538],["Clothes",628],["Cooked Meats",630],["Currency and gems",1100],["Drinks",601],["Packaged Food",629]],
	[["ItemTinBar","TrashJackDaniels",1,1,"buy","Empty Whiskey Bottle","Tin Bar",101]],
	"hero"
];

/*---------------------------------------------------------------------------
			BANDIT VENDORS
---------------------------------------------------------------------------*/

//COMBINATION VENDOR
menu_GUE_Woodlander1 = [
	[["Attachments",693],["Ammunition",577],["Currency and gems",1100],["Clothing",575],["Helicopter Armed",512],["Military Armed",569],["Trucks Armed",534],["Weapons",627]],
	[],
	"hostile"
];
//SUPPLIES
menu_RU_Worker1 = [	
	[["Building Supplies",678],["Currency and gems",1100],["Tools",679],["Vehicle Parts",677]],
	[],
	"hostile"
];
//MEDICAl
menu_Dr_Hladik_EP1 = [
	[["Chem-lites/Flares",542],["Medical Supplies",541],["Smoke Grenades",543]],
	[["FoodBioMeat","ItemZombieParts",1,1,"buy","Zombie Parts","Bio Meat",101]],
	"hostile"
];
//FOOD & DRINK
menu_RU_Farmwife5 = [
	[["Backpacks",538],["Clothes",628],["Cooked Meats",630],["Currency and gems",1100],["Drinks",601],["Packaged Food",629]],
	[["ItemTinBar","TrashJackDaniels",1,1,"buy","Empty Whiskey Bottle","Tin Bar",101]],
	"hostile"
];

/*---------------------------------------------------------------------------
			NEUTRAL VENDORS
---------------------------------------------------------------------------*/

//MEDICAL
menu_Doctor = [
	[["Chem-lites/Flares",542],["Medical Supplies",541],["Smoke Grenades",543]],
	[["FoodBioMeat","ItemZombieParts",1,1,"buy","Zombie Parts","Bio Meat",101]],
	"neutral"
];
//SUPPLIES
menu_RU_Worker4 = [
	[["Building Supplies",678],["Currency and gems",1100],["Tools",679],["Vehicle Parts",677]],
	[],
	"neutral"
];
//WEAPONS
menu_Soldier_Sniper_KSVK_PMC = [
	[["Attachments",693],["Assault Rifle",485],["Light Machine Gun",486],["Pistols",489],["Shotguns and Single-shot",574],["Sniper Rifle",487],["Submachine Guns",488]],
	[],
	"neutral"
];
//AMMUNITION
menu_Soldier_GL_PMC = [
	[["Assault Rifle Ammo",621],["Light Machine Gun Ammo",622],["Pistol Ammo",625],["Shotguns and Single-shot Ammo",623],["Sniper Rifle Ammo",624],["Submachine Gun Ammo",626]],
	[],
	"neutral"
];
//FOOD & DRINK
menu_Citizen3 = [
	[["Backpacks",538],["Clothes",628],["Cooked Meats",630],["Currency and gems",1100],["Drinks",601],["Packaged Food",629]],
	[["ItemTinBar","TrashJackDaniels",1,1,"buy","Empty Whiskey Bottle","Tin Bar",101]],
	"neutral"
];


/*---------------------------------------------------------------------------
			NEUTRAL VEHICLE VENDORS
---------------------------------------------------------------------------*/

menu_GUE_Soldier_3 = [
	[["Bikes and ATV",608],["Buses and Vans",563],["Cargo Trucks",564],["Fuel Trucks",492],["Military Unarmed",491],["Trucks",495],["Used Cars",585],["Utility Vehicles",565]],
	[],
	"neutral"
];
menu_RU_Woodlander4 = [
	[["Bikes and ATV",608],["Buses and Vans",563],["Cargo Trucks",564],["Fuel Trucks",492],["Military Unarmed",491],["Trucks",495],["Used Cars",585],["Utility Vehicles",565]],
	[],
	"neutral"
];
menu_Worker4 = [
	[["Boats Armed",673],["Boats Unarmed",672]],
	[],
	"neutral"
];
menu_Profiteer2_EP1 = [
	[["Boats Armed",673],["Boats Unarmed",672]],
	[],
	"neutral"
];
menu_GUE_Soldier_Pilot = [
	[["Airplanes",517],["Currency and gems",1100],["Helicopter Unarmed",519]],
	[],
	"neutral"
];
menu_UN_CDF_Soldier_Pilot_EP1 = [
	[["Airplanes",517],["Currency and gems",1100],["Helicopter Unarmed",519]],
	[],
	"neutral"
];

/*---------------------------------------------------------------------------
			FRIENDLY VENDORS
---------------------------------------------------------------------------*/

//WEAPONS
menu_GUE_Commander = [
	[["Attachments",693],["Assault Rifle",485],["Light Machine Gun",486],["Pistols",489],["Shotguns and Single-shot",574],["Sniper Rifle",487],["Submachine Guns",488]],
	[],
	"friendly"
];
//AMMUNITION
menu_GUE_Soldier_CO = [
	[["Assault Rifle Ammo",621],["Light Machine Gun Ammo",622],["Pistol Ammo",625],["Shotguns and Single-shot Ammo",623],["Sniper Rifle Ammo",624],["Submachine Gun Ammo",626]],
	[],
	"friendly"
];
//HELICOPTERS
menu_GUE_Worker2 = [
	[["Helicopter Armed",493]],
	[],
	"friendly"
];

/*---------------------------------------------------------------------------
			WHOLESALE VENDORS
---------------------------------------------------------------------------*/

//EAST BRIDGE
menu_GUE_Soldier_2 = [
	[["Wholesale",675],["Currency and gems",1100]],
	[],
	"neutral"
];
//WEST BRIDGE
menu_Reynolds_PMC = [
	[["Wholesale",675],["Currency and gems",1100]],
	[],
	"neutral"
];
