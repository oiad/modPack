if (isServer) then {
	diag_log "Loading custom server variables";
	
	vg_clearAmmo = true; // Clear the ammo of vehicles spawned during the same restart they are stored? (stops users storing a vehicle for a free rearm)
	vg_disableThermal = []; // Array of vehicle config classes as well as vehicle classnames to disable thermal on when being spawned. i.e: ["All","Land","Air","Ship","StaticWeapon","AH1Z","MTVR"];
	vg_sortColumn = 0; //0 or an out of range value sorts by the default column 'DisplayName', otherwise 1 = 'DateStored', 2 = 'id', 3 = 'Name' (of storing player), 4 = 'DateMaintained'

	vkc_clearAmmo = true; // Clear the ammo of vehicles after they have been rekeyed/claimed? (stops users getting a free rearm)
	vkc_disableThermal = [""]; // Array of vehicle config classes as well as vehicle classnames to disable thermal on when being spawned. i.e: ["All","Land","Air","Ship","StaticWeapon","AH1Z","MTVR"];
};

if (!isDedicated) then {
	diag_log "Loading custom client variables";

	vg_list = ["Plastic_Pole_EP1_DZ"]; // List of objects/traders that are allowed to interact with virtual garage. i.e: ["Plastic_Pole_EP1_DZ","Worker2"];
	vg_blackListed = []; // Array of vehicle config classes as well as vehicle classnames that are blacklisted from being stored, i.e ["All","Land","Air","Ship","StaticWeapon","AH1Z","MTVR"]
	vg_heliPads = ["Helipad_Civil_DZ","Helipad_Rescue_DZ","Helipad_Army_DZ","Helipad_Cross_DZ","Helipad_ParkBorder_DZ"]; // Array of heli pad classnames
	vg_removeKey = true; // Remove the key from the players inventory after storing vehicle?
	vg_requireKey = true; // Require the player to have the key when storing a locked vehicle.
	vg_storeWithGear = true; // Allow storing vehicles with gear?
	vg_tiedToPole = true; // Tie the virtual garage to a local plot pole? If no plot pole is present (i.e a communal garage at a trader etc) the players UID will be used.
	vg_pricePer = 100; // Price in worth to store a vehicle per gear item, use 0 if you want it to be free.
	vg_maintainCost = 10000; //cost is 1000 per 10oz gold, gem cost is as defined in DZE_GemWorthArray; if you use ZSC then this is an amount of coins. This is a flate rate for all vehicles in the garage/per player depending on vg_tiedToPole
	vg_price = [["Land",500],["Air",500],["Ship",500]];
	/*
		vg_price can be an array of vehicle config classes as well as vehicle classnames, you need to put these in order of what you prefer to get checked first.
		Price is in worth for briefcases or coins for gold based servers (10,000 worth is considered 1 briefcase, 100,000 coins is considered 1 briefcase)

		i.e:
		vg_price = [["Land",500],["Air",300],["Ship",100]];
		vg_price = [["350z_red",200],["Land",500],["AH1Z",1000],["Air",300],["Ship",100]];
	*/
	vg_limit = [["Land",5],["Air",5],["Ship",5]];
	/*
		vg_limit can be an array of vehicle config classes and classnames to narrow down what players can store or it can be a numerical value for a total limit.
		These can be classnames as well as config classnames, you need to put these in order of what you prefer to get checked first.

		i.e:
		vg_limit = [["Land",5],["Air",3],["Ship",1]];
		vg_limit = [["350z_red",2],["Land",5],["AH1Z",1],["Air",3],["Ship",1]];
		vg_limit = 5;
	*/	
	
	vkc_claimPrice = 1000; // Amount in worth for claiming a vehicle. See the top of this script for an explanation.
	vkc_changePrice = 5000; // Amount in worth for changing the key for a vehicle. See the top of this script for an explanation.

	dayz_resetSelfActions = {
		s_player_equip_carry = -1;
		s_player_fire = -1;
		s_player_cook = -1;
		s_player_boil = -1;
		s_player_packtent = -1;
		s_player_packtentinfected = -1;
		s_player_fillfuel = -1;
		s_player_grabflare = -1;
		s_player_removeflare = -1;
		s_player_studybody = -1;
		s_player_deleteBuild = -1;
		s_player_flipveh = -1;
		s_player_sleep = -1;
		s_player_fillfuel210 = -1;
		s_player_fillfuel20 = -1;
		s_player_fillfuel5 = -1;
		s_player_siphonfuel = -1;
		s_player_repair_crtl = -1;
		s_player_fishing = -1;
		s_player_fishing_veh = -1;
		s_player_gather = -1;
		s_player_destroytent = -1;

		// Epoch Additions
		s_player_packvault = -1;
		s_player_lockvault = -1;
		s_player_unlockvault = -1;
		s_player_attack = -1;
		s_player_callzombies = -1;
		s_player_showname = -1;
		s_player_pzombiesattack = -1;
		s_player_pzombiesvision = -1;
		s_player_pzombiesfeed = -1;
		s_player_tamedog = -1;
		s_player_parts_crtl = -1;
		s_player_movedog = -1;
		s_player_speeddog = -1;
		s_player_calldog = -1;
		s_player_feeddog = -1;
		s_player_waterdog = -1;
		s_player_staydog = -1;
		s_player_trackdog = -1;
		s_player_barkdog = -1;
		s_player_warndog = -1;
		s_player_followdog = -1;
		s_player_information = -1;
		s_player_fuelauto = -1;
		s_player_fuelauto2 = -1;
		s_player_fillgen = -1;
		s_player_upgrade_build = -1;
		s_player_maint_build = -1;
		s_player_downgrade_build = -1;
		s_player_towing = -1;
		s_halo_action = -1;
		s_player_SurrenderedGear = -1;
		s_player_maintain_area = -1;
		s_player_maintain_area_force = -1;
		s_player_maintain_area_preview = -1;
		s_player_heli_lift = -1;
		s_player_heli_detach = -1;
		s_player_lockUnlock_crtl = -1;
		s_player_lockUnlockInside_ctrl = -1;
		s_player_toggleSnap = -1;
		s_player_toggleSnapSelect = -1;
		snapActions = -1;
		s_player_plot_boundary = -1;
		s_player_plotManagement = -1;
		s_player_toggleDegree = -1;
		degreeActions = -1;
		s_player_toggleVector = -1;
		vectorActions = -1;
		s_player_manageDoor = -1;
		s_player_hide_body = -1;
		s_player_changeDoorCode = -1;
		s_player_changeVaultCode = -1;
		s_givemoney_dialog = -1;
		s_bank_dialog = -1;
		s_bank_dialog1 = -1;
		s_bank_dialog2 = -1;
		s_bank_dialog3 = -1;
		s_player_checkWallet = -1;
		s_garage_dialog = -1;
		s_player_bury_human = -1;
		s_player_butcher_human = -1;
		s_player_gdoor_opener = [];
		s_player_gdoor_opener_ctrl = -1;
		s_player_clothes = -1;	
		s_player_copyToKey = -1;
		s_player_claimVehicle = -1;		
	};
	call dayz_resetSelfActions;
};
