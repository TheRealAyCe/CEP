=====================================================
CEP 1.2.3 (8th June 2017)
formerly known as SEASMOD
=====================================================
by the Para-Welt.com Team

Introduction:
---
This mod adds the ability to play the SEAS in Paraworld
in skirmish, multiplayer, and campaign! To install it, just
execute the installer, it should detect a version of
ParaWorld automatically. If it also asks you if you want to
overwrite the old version, click "Yes"! Then, it may ask you
to keep your army-sets. A new presets.txt may fix bugs,
but normally you can just click "Yes", to keep your
Presets.txt file for the "My Army" screen in multiplayer.

Incompatible with older versions of Paraworld than 1.05.
All players must start CEP for multiplayer games!


About CEP:
---
This mod is the next SEASMOD. The main aspect that has
changed is the ability to add server-side-scripts. (SSS)
SEASMOD won't be further developed, so you can uninstall
it, since CEP has the same and more functions. Of course
you can also keep the old SEASMOD, it does not require
SSS, so you may prefer it. Just keep in mind that we
won't work on it anymore, and there are bugs for sure.
Also the changelog starts at CEP 1.0.0, if you are
interested in older changelogs, please use
"ReadMe SEASMOD.txt" for this.
A full list of the credits can be found in credits.txt.


Changelog:
---
CEP 1.2.3 - 11th July 2017
- Bugfixes:
	- Some localization texts
- New:
	- ACDO support for GetFood
- Changes:
	- New loading screen for Finding-Ada-Mission by DryFun


CEP 1.2.2 - 8th June 2014
----------------------------------
- Bugfixes:
	- An old bug where we enabled passive AI to be selected when choosing Random AI behaviour in skirmish
	- Tiny bugfixes (a ; in Game.usl)
- Changes:
	- SEAS Steelwork is now CSeasSteelwork again and CSeasSteelwork inherits from CWarehouse
	- Some flash-effects have been readded (they were removed by the "bloodpatch")
- New:
	- SEAS Bunker has its own icon now
	- Added new Condition "CHAT" (player chat input, for level editor, needs SDK modification)
	- SEAS AI will now send its carrier fishing
	- A panel will be displayed in the main menu when cheats are activated, as well as in the multiplayer menu


CEP 1.2.1 - 19th January 2014
----------------------------------
- Bugfixes:
	- Some minor game and localization fixes
	- Some fixes in "Rescue Ada" mission
	- Fixed idle and shoot animations for SEAS Shotgunner and Barry/Harry
	- Fixed Stina's stunned animation
- Changes:
	- SEAS Shotgunner soundset changed
	- Increased Lambeosaurus HP from 50 to 250
	- Changed Author & Version window
	- Swapped CTRL zooming and normal zooming, Mirage-style zooming is now available with CTRL pressed
- New:
	- Object action triggers have more options now


CEP 1.2.0 - 4th March 2013
----------------------------------
- Bugfixes:
	- Norsemen bunker is usable by units again
	- "More Fireplaces" is now only played, when the maximum population limit hasn't been reached yet
	- Disabled saving of mission replays, because it doesn't work
	- Minor bugfixes and text fixes, including a game crash when certain objects are right-clicked with units
	- Finally a real fix for the pointbuy bug
	- Sentinel can now correctly gather wood from start and stone with the upgrade
- Changes:
	- Wild animals' nests get a self-regeneration ability
	- SEAS Carrier cannot build norsemen fishing boats any longer, was a leftover from old times
	- Changed Sentinel's stone collecting amount from 30 to 75
	- Changed Sentinel's wood collecting amount from 20 (?) to 75
	- Changed Sentinel's sightrange from 50 to 80 like other scouts
	- Losing a storage capacity increasing building won't anymore make the player lose the accumulated resources
	- Changed the old SEASMOD icon to a cool new CEP icon (Thanks to Kharg!)
	- Improved camera system: can be further zoomed in and out, and there are more camera angles (zoom in and out can be done with mouse scroll, or using dot and comma (',' '.')
	- Using the mouse wheel (with the new camera system) has been extended: holding the Ctrl key allows to use it like in normal version; holding the Shift key allows to zoom in and out faster
	- UI change: if a certain hero dies while the player is producing one or more of its special unit (like 5 nm berserker), the production of these units can be canceled (their action icon won't
	  be invisible in the action menu of the producing building), but no further units of the certain type can be queued; if there are no more units of the specific type in production, the icon gets invisible
	- Miyagi is now an amphibian hero -> he is a baryonyx rider from now on (max 4 speed atm, class name is special_baryonyx. For level designers there is still Miyagi_s0 available (like Stina_s0))
	- Miyagi has no armor piercing from now on
	- Leightons vanish ability has been buffed -> its duration is increased from 10 seconds (ingame~) to 25
	- Larry has a new T3 ability -> he can summon Harry and Barry for assistance (they stay for 2 minutes atm)
	- Zeppelin has to be built up, icon for Zeppelin is only visible for Larry (also for his brothers)
	- Ninja Monkey Scout has been removed, Sentinel is the original scouting unit
	- Funtitans have been removed, because they were "strange" to build, unbalanced, and did not fit
	- The Pirate Harbour has been removed, along with the Pirate Ship and the Cargolifter. The Dunkelsteus guard is now Miyagi's only special unit and it's a t2 unit
	- The Amazon Temple has been removed, the Riders are now Tarnas only special units
	- Disabled "black" player color. It was buggy and not a real color.
- New:
	- The building of certain objects (Tarna, Khargclub, etc.) has been disabled on the original missions for the player and the AI
	- Added an automatic check for updates feature to the launcher
	- Added a loading screen for volcano setting maps (Mission 16)
	- Sounds when levels are full are now played
	- Newly born wild animals have reduced attack power in info panel
	- Human player's names are not allowed anymore to start with _ ("_Hu" would be localized as "Norsemen")
	- Added clockbar to ingamescreen -> Shows the time (h:m:s) that has elapsed since the beginning of the game (correct even for saved games)
	- Tooltip for commandbar icons of units and upgrades shows the duration (of producing the corresponding unit or inventing the upgrade)
	- Added buildup animation for some SEAS buildings
	- Added crane for Khargclub buildup animation, and rising from the ground has been modified
	- Improved ghost object at building placement -> 1) turrets of towers are attached to the ghost object (e.g. turret on seas tower); 2) SEAS hq ghost model represents the current epoch stage (ghost object isn't always the epoch 5 model)
- By Henrysoft Inc.


CEP 1.1.0 - 1st September 2012
----------------------------------
- Made SEAS playable on all SEK maps (thanks to Henry!)
- Added bigger textures for flying reptiles (thanks to Kharg)
- Many various bugfixes (thanks to Henry & AyCe)
	Including:
	- All new buildings should adapt the terrain now
	- Kharg Club is visible when being built
	- Map Pings don't vanish anymore when a level is saved and loaded
	- Multiplayer MG-nests and Cannons have their own object now, so their corpses vanish
	- AI names are the same for all players now
	- Campaign will give the points to the next mission correctly now
	- The check for updates button has been fixed
	- The SEAS-tric-rescol-all-units-die-on-start-startlocation-bug has been fixed
	- CBT rider animation bug fixed (Marksman thought he was an archer)
	- Some techtree-bugs fixed
	- anurognathus_fruit_bush bugfix
	- alternative animations are now used for some buildings which don't have the main animation
	- Dustrider HQ wagon adapt to the epochs now
	- The icon for hiding will disappear when a unit is not entrenched anymore
	- no_spirit addition
	- Added SEAS Medic to exclude other healers which are healing when he is healing
	- Added SEAS Medic animation for reveal ability
	- Brachiosaurus mobile camps produced in the large animal farm didn't get their SetRallySite-button in command bar, only when upgraded from another form: this has been fixed
	- The search-radius of resources for workers is increased, and the search-radius to buildup buildings as well
	- Units which the player can't control receives kill command, so they can be deleted (see Wardens nest animals)
	- Enabled anim looping for SEAS Workers (if they hunt wild animals with slingshot)
	- Penalty values are shown with red color in Info panel (bonus still green)
	- Smoke bomber effect doesn't work on zeppelin, preventing the use of invisible and undetectable attacks
	- Amphibian units will always survive when a ship is killed
	- Healers (except for Medic) get different staffs on each level and additional armor for higher levels
	- Medic gets the same healing boost for each new level like druid and monk
	- Baryonyx riders & Miyagi can be unloaded from transport ship even its far from the shore
	- The big pirate ships parts can be healed at harbours (unless they are already destroyed)
	- Carriers couldn't heal hovercrafts and stingers: this has been fixed
	- ...most likely more which I forgot
- Many various added features (thanks to... well.. all! :D)
	- Babbit's Exo has a jumpjet ability now
	- The norsemen bunker has a close range attack now (it has spikes, hasn't it?)
	- You can see the author and the version of a level in the multiplayer/skirmish menu now
	In combination with the SDK fix:
	- New actions & conditions, and many existing ones fixed
	- Support for auto-flatten ground of buildings
- Added Hungarian translation! (thanks to Henry!)
- Polish version has polish speechacks for Tarna & Leighton now, also a different unitacks_livingstone_s0.txt
- Also fixes on all translations! (special thanks to Entoursis!)
- Found out how to add texts like the SEK did (thanks to Henry!)
- Added the first CEP-Mission: Seeking Ada (thanks to Synkro!)
- Added Mission 4.3 SEAS-version (thanks to AyCe!)
- Added new SEAS Flamethrower soundset (thanks to Mac Cool!)
- Added a launcher for CEP, you can do everything PW-related easily now! (thanks to Adder & AyCe!)
- Installer will detect the language based on the Boosterpack-language -> Example: You can play with Russian texts while having an english version (thanks to AyCe!)
- Balancing:
	- SEAS Big Tent gives 40 instead of 20 unitcap
	- SEAS Small Tent gives 500 rescap for each resource and no unitcap
	- SEAS need wood for epochs
	- SEAS Steelwork has 1000 HP now instead of 500
	- Heroes range effect has a bigger radius: from 20m to 25m, except for Warden, his level 2 bonus aura gets 40m radius
	- Coles level 2 bonus aura gives infantry unit +10 damage instead of 5
	- Bela's level 5 global bonus increases ranged infantry units attack strength by 20% instead of 10%
	- Stina's level 5 global bonus gives animals also +20 ranged defense additionally
	- Infantry units on a wall receive a range bonus of 10 now
- Changes:
	- The small cannon was changed from seas_hq_defense_turret to seas_defense_turret (for MP)
	- The MG nest was changed from seas_hq_machinegun_nest to seas_machinegun_nest (for MP)
	  (Because both have staying corpses)
	- The two bunker classes have been reduced to one upgradable
	- SEAS have their own "warpgate" now (Babbage's Machine)
- AND FINALLY: Added siege units (MANY THANKS TO HENRY!!! :D)


CEP 1.0.1 - 2nd March 2012
----------------------------------
- Added loading screen for Arena/BfPW - Holy City
- Included newest version of BfPW - Holy City
- Workarounded & fixed campaign menu
- Ability to save replays of the campaign/BfPW levels


CEP 1.0.0 - 25th February 2012 (compared to SEASMOD 3.6.2)
----------------------------------
- Added server-side-scripts
  This requires the game to change some stuff inside the settings file
  You can revert it back by using the shortcut in the start menu
- Fixed SEAS Bunker (seas_hq_bunker)
- Added SEAS Turret Bunker (seas_bunker)
- Added feedback sound for SEAS CoH (seas_coh)
- Improved & fixed the Localizer (made it non-static)
- Fixed & updated translations
- Fixed quotes.txt again + renamed it to quotes_cep.txt + changed encoding to UTF-8
- As a result: Random quote selection between SEK and us ^^
- Fixed _NT_TransportUnboardAtShore bug
- Added Russian & Spanish language (thanks to Entoursis and Kronos)
- Cleaned up ReadMe.txt & added an introduction
- Fixed losing music playing when BfPW was won (_GAOV_Accomplished)
- Fixed PFBlocker not updating when SetPos was called from an action
- Added BfPW - Holy City as multiplayer map