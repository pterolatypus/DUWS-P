"savegameNumber" addPublicVariableEventHandler { call DUWSR_fnc_restClient };
"capturedZonesNumber" addPublicVariableEventHandler { call persistent_fnc_incrementCapturedZones }; // change the shown CP for request dialog
"finishedMissionsNumber" addPublicVariableEventHandler { call persistent_fnc_incrementCompletedMissions }; // change the shown CP for request dialog

// WHEN CLIENT CONNECTS INIT (might need sleep)
waitUntil {isPlayer Player};

hintsilent "Waiting for the host to find an HQ...";
waitUntil {HQ_pos_found_generated && time > 0.1};

player setpos [(getpos hq_blu1 select 0),(getpos hq_blu1 select 1)+10];
_drawicon = [] execVM "inithq\drawIcon.sqf";

hintsilent "Waiting for the host to select the campaign parameters...";
waitUntil {chosen_settings};

sleep 1;
player setdamage 0;
player allowDamage true;
hintsilent format["Joined game, welcome to %1, %2",worldName,profileName];

// init High Command
_handle = [] execVM "dialog\hc_init.sqf";
[] execVM "dialog\startup\weather_client.sqf";
