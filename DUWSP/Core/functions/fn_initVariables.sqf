//Moved this out to a function just for tidiness' sake

if (isNil "DUWSP_Core_unlockedSupports") then { DUWSP_Core_unlockedSupports = [] };

// choose between "tropical" - "arid" - "temperate" - "temperate_cold" - "mediterranean"
if (isNil "weather_type") then { weather_type = "tropical" };

// set the skill range of ennemy AI
if (isNil "opfor_ai_skill") then { opfor_ai_skill = [0.1,0.3] };

// set the skill range of friendly AI, from 0 to 1 (0 being completely dumb)
if (isNil "blufor_ai_skill") then { blufor_ai_skill = [0.4,0.7] };

if (isNil "DUWSP_Core_cfgEnableFOBTeleport") then { DUWSP_Core_cfgEnableFOBTeleport = true };

// chopper taxi (support) will fast travel (teleport) or not
if (isNil "DUWSP_Core_cfgHeloTaxiCanTeleport") then { DUWSP_Core_cfgHeloTaxiCanTeleport = true };

// Starting CP
if (isNil "DUWSP_Core_bluforCommandPoints") then { DUWSP_Core_bluforCommandPoints = 20 };

// STARTING ARMY POWER
if (isNil "blufor_ap") then { blufor_ap = 0 };
if (isNil "opfor_ap") then { opfor_ap = 0 };

if (isNil "amount_zones_created") then { amount_zones_created = 0 };

if (isNil "HQ_pos_found_generated") then { HQ_pos_found_generated = false };

if (isNil "chosen_settings") then { chosen_settings = false };

if (isNil "chosen_hq_placement") then { chosen_hq_placement = false };

if (isNil "zoneundercontrolblu") then {neundercontrolblu = 0 };

if (isNil "amount_zones_captured") then { amount_zones_captured = 0 };

if (isNil "savegameNumber") then { savegameNumber = 0 };

if (isNil "capturedZonesNumber") then { capturedZonesNumber = 0 };

if (isNil "finishedMissionsNumber") then { finishedMissionsNumber = 0 };

if (isNil "OvercastVar") then { OvercastVar = 0 };

if (isNil "FogVar") then { FogVar = 0 };

if (isNil "Array_of_FOBS") then { Array_of_FOBS = [] };

if (isNil "Array_of_FOBname") then { Array_of_FOBname = [] };
