class Changelog {
	class 0_66_02 {
		version = "0.66.02";
		date = "16th December 2021";
		changes[] = {
			"[New] Mission will end and restart when all zones are captured",
			"[New] Added map markers for bases",
			"[New] Added expanded info for zones and bases",
			"[New] Trees that are chopped down will be removed on mission start",
			"[New] Configured additional Respawn and HQ buildings",
			"[New] Added new markers showing players class",
			"[New] Expanded list of vehicle markers",
			"[New] Added ACRE radio mod support",
			"[New] Added toggle for the welcome menu",
			"[New] Added feedback when attempting to consume an empty item",
			"[New] Added parameter for disabling player map markers",
			"[New] Added parameters for the snake system",
			"[New] Added parameters for the medical system",
			"[New] Added parameters to disable/enable RTO supports",
			"[New] Added parameters for limiting the number of players on a team",
			"[New] Added parameters for controlling hunger and thirst",
			"[Change] Zone names are now properly displayed in task names",
			"[Change] Rebalanced arsenal ranks and added missing bag for SCUBA gear",
			"[Change] Removed unused counter attack message",
			"[Change] You can no longer build inside a vehicle workshop",
			"[Change] Removed 2035 equipment from the arsenal",
			"[Change] Made explosive specialists a unique class instead of giving everyone the trait",
			"[Change] [Admin] Removed most RPT logging",
			"[Fix] Respawn points no longer occasionally disappear on mission start",
			"[Fix] Supply no longer disappears on mission start",
			"[Fix] Fixed vehicles getting stuck in a infinite respawn loop if destroyed on their spawn point",
			"[Fix] Fixed vehicles being able to be used as a building anchor",
			"[Fix] Fixed exploit with transport requests",
			"[Fix] Fixed players getting stuck in a locking vehicle",
			"[Fix] Admins now have access to the arsenal",
			"[Fix] NVA Mortar backpack removed due to exploit",
			"[Fix] The escape menu now closes when the welcome menu is opened",
			"[Fix] Fixed improperly placed jeep on Cam Lao Nam",
			"[Fix] Potentially fixed rare issue where a packaged wreck cannot be picked up",
			"[Fix] Fixed typo in options menu",
			"[Fix] Added missing respawn and logistics configs for some vehicles on Khe Sanh",
			"[Fix] Changed the mission image filepath to prevent a clickthrough error",
			"[Fix] Supply officers should no longer be attacked by the AI",
		};
	};
	class 0_66_01 {
		version = "0.66.01";
		date = "25th September 2021";
		changes[] = {
			"[New] Added content from SOG:PF 1.1 update to arsenal",
			"[New] Icons added for vehicles created at the workshop",
			"[New] FM radio now plays music when built",
			"[New] Customisation options for the view distance helper",
			"[New] Static weapon crates can be spawned",
			"[New] Trees can now be cut using axes",
			"[Change] Rebalanced arsenal ranks and added missing gear",
			"[Change] Updated default loadouts for players",
			"[Change] Contents of the medical supply crate improved",
			"[Change] Contents of the ammo crates improved",
			"[Change] Building categories are reworked",
			"[Fix] Sites are much less likely to spawn underwater or underground",
			"[Fix] Medikits not working to revive people correctly",
			"[Fix] Leghorn removed on Cam Lao Nam",
			"[Fix] Headless clients should connect correctly",
			"[Fix] Slingloading locked vehicles",
			"[Fix] Copilot seats are now correctly locked to team",
			"[Fix] AI will no longer mount static weapons loaded into vehicles"
		};
	};
	class 0_65_03 {
		version = "0.65.03";
		date = "7th May 2021";
		changes[] = {
			"[New] Added 3 headless client slots",
			"[New] Added parameter to change the AI limit",
			"[Fix] Scaled up the task roster"
		};
	};
	class 0_65_02 {
		version = "0.65.02";
		date = "7th May 2021";
		changes[] = {
			"[Change] Reduced the mission to 32 slots (the number the mission is designed for)"
		};
	};
	class 0_65_01 {
		version = "0.65.01";
		date = "6th May 2021";
		changes[] = {
			"Initial Beta Release"
		};
	};
};
