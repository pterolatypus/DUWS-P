// MAX RADIUS
_index = lbCurSel 2100;
zones_max_radius = (cfg_max_radius_list select 0) select _index;
[["Max radius: %1", zones_max_radius], "DEBUG"] call logsqf_fnc_debugMessage;

// MIN RADIUS
_index = lbCurSel 2101;
zones_min_radius = (cfg_min_radius_list select 0) select _index;
[["Min radius: %1", zones_min_radius], "DEBUG"] call logsqf_fnc_debugMessage;

// ZONES NUMBER
_index = lbCurSel 2102;
zones_number = (cfg_num_zones_list select 0) select _index;
[["Number of zones: %1", zones_number], "DEBUG"] call logsqf_fnc_debugMessage;

// Starting CP
_index = lbCurSel 2103;
DUWSP_Core_bluforCommandPoints = (cfg_starting_cp_list select 0) select _index;
[["Starting CP: %1", DUWSP_Core_bluforCommandPoints], "DEBUG"] call logsqf_fnc_debugMessage;

// Weather type
_index = lbCurSel 2106;
weather_type = (cfg_weather_type_list select 0) select _index;
[["Dynamic weather: %1", weather_type], "DEBUG"] call logsqf_fnc_debugMessage;
if (weather_type == "Disabled") then {
  dynamic_weather_enable = false;
};

// ARMY POWER BLUFOR
_index = lbCurSel 2104;
blufor_ap = (cfg_blufor_ap_list select 0) select _index;
[["Blufor AP: %1", blufor_ap], "DEBUG"] call logsqf_fnc_debugMessage;


// ARMY POWER OPFOR
_index = lbCurSel 2105;
opfor_ap = (cfg_opfor_ap_list select 0) select _index;
[["Opfor AP: %1", opfor_ap], "DEBUG"] call logsqf_fnc_debugMessage;


// AI opf Skill
_index = lbCurSel 2107;
opfor_ai_skill = (cfg_opfor_skill_list select 0) select _index;
[["Opfor skill: %1-%2", opfor_ai_skill select 0, opfor_ai_skill select 1], "DEBUG"] call logsqf_fnc_debugMessage;


// AI BLUFOR Skill
_index = lbCurSel 2108;
blufor_ai_skill = (cfg_blufor_skill_list select 0) select _index;
[["Opfor skill: %1-%2", blufor_ai_skill select 0, blufor_ai_skill select 1], "DEBUG"] call logsqf_fnc_debugMessage;


// ENABLE CHOPPER FAST TRAVEL
_index = lbCurSel 2109;
DUWSP_Core_cfgHeloTaxiCanTeleport = ((cfg_chopper_travel_list select 0) select _index)=="Yes";
[["Heli fast travel enabled: %1", DUWSP_Core_cfgHeloTaxiCanTeleport], "DEBUG"] call logsqf_fnc_debugMessage;


// FAST TRAVEL
_index = lbCurSel 2714;
DUWSP_Core_cfgEnableFOBTeleport = ((cfg_fast_travel_list select 0) select _index)=="Yes";
[["FOB fast travel enabled: %1", DUWSP_Core_cfgEnableFOBTeleport], "DEBUG"] call logsqf_fnc_debugMessage;


// MAX DIST FROM HQ
_index = lbCurSel 2188;
zones_max_dist_from_hq = (cfg_max_distance_list select 0) select _index;
[["Maximum zone to HQ distance: %1", zones_max_dist_from_hq], "DEBUG"] call logsqf_fnc_debugMessage;

// CP REWARD MULTIPLIER
_index = lbCurSel 2189;
cp_reward_multiplier = (cfg_cp_reward_list select 0) select _index;
[["CP Reward Multiplier: %1", cp_reward_multiplier], "DEBUG"] call logsqf_fnc_debugMessage;

 // CHECK IF MAX/MIN RADIUS PARAMETERS CORRECT
if (zones_max_radius <= zones_min_radius) exitWith {Hint "Unable to generate campaign:\nMaximum radius of a zone\nmust be superior to\nMinimum radius of a zone"};

zones_spacing = zones_max_radius + 200;
publicVariable "DUWSP_Core_bluforCommandPoints";
publicVariable "weather_type";
publicVariable "blufor_ai_skill";
publicVariable "opfor_ai_skill";
publicVariable "DUWSP_Core_cfgHeloTaxiCanTeleport";
