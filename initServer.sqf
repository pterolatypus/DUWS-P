DUWS_host_start = false;
publicVariable "DUWS_host_start";
waitUntil {time > 0.1};
_getsize_script = [player] spawn DUWSP_fnc_getMapSize;
DUWS_host_start = true;
publicVariable "DUWS_host_start";

// init High Command
_handle = [] execVM "dialog\hc_init.sqf";
waitUntil {scriptDone _getsize_script};

_null = [] execVM "dialog\startup\hq_placement\placement.sqf";
waitUntil {chosen_hq_placement};

// create random HQ
if (!hq_manually_placed && !player_is_choosing_hqpos) then {
    hq_create = [20, 0.015] execVM "initHQ\locatorHQ.sqf";
    waitUntil {scriptDone hq_create};
};

clean = [
    5*60,   // seconds to delete dead bodies (0 means don't delete)
    5*60,   // seconds to delete dead vehicles (0 means don't delete)
    0,      // seconds to delete immobile vehicles (0 means don't delete)
    5*60,   // seconds to delete dropped weapons (0 means don't delete)
    0,      // seconds to deleted planted explosives (0 means don't delete)
    10*60   // seconds to delete dropped smokes/chemlights (0 means don't delete)
] execVM 'repetitive_cleanup.sqf';

_basepoint = [] execVM "zonesundercontrol.sqf";
