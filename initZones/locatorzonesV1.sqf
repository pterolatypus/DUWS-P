_radius = _this select 0;
_diff = _this select 1;
_infinite_failsafe_loop = true;


[] spawn {  // Spawn the failsafe
sleep 90;
failsafe_zones_not_found = true;
};

[["The zones are being generated<br />Please wait..."]] spawn BIS_fnc_typeText;

array_of_prefabs = [["Command Outpost",true,"initZones\prefabs\commandOP.sqf"],
["Vehicle Refit Station",false,"initZones\prefabs\vehfittingstation.sqf"],
["Research Bunker",true,"initZones\prefabs\researchBunker.sqf"],
["Recon Outpost",true,"initZones\prefabs\reconOutpost.sqf"],
["Power Relay",true,"initZones\prefabs\powerRelay.sqf"],
["Com. Station",true,"initZones\prefabs\commstation.sqf"],
["Outpost",true,"initZones\prefabs\outpost1.sqf"],
["Outpost",true,"initZones\prefabs\outpost2.sqf"],
["Barracks",true,"initZones\prefabs\barracks.sqf"],
["Research Station",false,"initZones\prefabs\researchStation.sqf"],
["Camp Site",false,"initZones\prefabs\campsite.sqf"]];

// ON WATER ? >> FLAT ? >> DISTANCE BETWEEN ZONES ? >> OK !

_worldName = getText(configFile >> "cfgWorlds" >> worldName >> "description");

_fortified = false;
//sleep 2;
_zones_array = [[-9999,-9999,-9999]];


for [{_i=1}, {_i<=zones_number}, {_i=_i+1}] do  // BEGIN "FOR" LOOP --
{
   [["Looking for zone location #%1...",_i], "INFO"] call logsqf_fnc_debugMessage;
   _found = false;
   _zone_radius = 0;
   _points_zone = 0;
        while {_zone_radius<=zones_min_radius} do { // BEGIN OF WHILE    --  LOOP UNTIL THE RADIUS MEET THE REQUIREMENTS
        // CREATE RANDOM PARAMETERS FOR THE ZONE -- BEGIN
        // generate random radius (max zones_max_radius) and then determine the pts
        _random_zones_max_radius = random zones_max_radius;
        _zone_radius = round _random_zones_max_radius;
        _points_zone = round (_zone_radius/10);

        // CREATE RANDOM PARAMETERS FOR THE ZONE -- END
        }; // END OF WHILE, PARAMETERS ARE O.K.

while {!_found} do
{
        if (failsafe_zones_not_found) exitWith {  // FAILSAFE. IF ZONES NOT FOUND AFTER X SECONDS, RESET.
        while {_infinite_failsafe_loop} do {
        hintSilent "Unable to find zones, please restart the mission and try:\n\n-Reducing the maximum radius of the zones\n-Reducing the amount of created zones\n-Increasing the maxiumum distance of created zones from the HQ";
        failsafe_zones_not_found = false;
        chosen_settings = false;
        sleep 1;
        };
        };     // END OF FAILSAFE EXECUTION, RESET OVER.


		_Posfound = false;
		_bestPosition = [];
		while {!_Posfound} do {
      [["Looking for positions..."], "TRACE"] call logsqf_fnc_debugMessage;
			_bestPosition = [position hq_blu1, 500,zones_max_dist_from_hq,5,0,0.1,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos;
      [["Found a possible position at %1 %2", _bestPosition select 0, _bestPosition select 1], "TRACE"] call logsqf_fnc_debugMessage;
			if (_bestPosition select 0 != 0 && _bestPosition select 1 != 0) then {
        [["Position seems to be valid"], "TRACE"] call logsqf_fnc_debugMessage;
        _Posfound=true;
      };
		};
		_playerDistance = _bestPosition distance player;

    //this should always be true since I've changed the call to BIS_fnc_findSafePos
    if (_playerDistance>(zones_max_radius + 500))  then {  //edge of zone must be >500m from the player
      if ((hq_blu1 distance _bestPosition)<=zones_max_dist_from_hq) then { //zone center must be within the defined max distance of HQ
        [["Position is within distance limits"], "TRACE"] call logsqf_fnc_debugMessage;

        _found_distance = true;
        {
          if (_x distance _bestPosition < zones_spacing) exitwith {
            [["Location is too close to an existing zone"], "TRACE"] call logsqf_fnc_debugMessage;
            _found_distance = false;
          } // if the zone is <1000m from any other zone, cancel
        } foreach _zones_array;

      if (_found_distance) then {
        [["Position is within spacing limits, generating..."], "TRACE"] call logsqf_fnc_debugMessage;
        _missionPos = [round(_bestPosition select 0),round(_bestPosition select 1)];
        _generatezonescript = [format["Zone %1",_i],_points_zone,_zone_radius,_MissionPos,_fortified,true] execvm "initZones\createzone.sqf";
        _found=true;
        _zones_array = _zones_array + [_MissionPos];

        [["Zone location #%1 found !",_i], "INFO"] call logsqf_fnc_debugMessage;
	      [["Generating zone #%1",_i], "INFO"] call logsqf_fnc_debugMessage;
        waituntil {scriptdone _generatezonescript};
       }; // END OF THIRD LOOP
     } else {
      [["Location is too far from HQ"], "TRACE"] call logsqf_fnc_debugMessage;
     };
   } else {
     [["Location is too close to player"], "TRACE"] call logsqf_fnc_debugMessage;
   };  // END SECOND LOOP
};  // END WHILE LOOP --- LOCATION FOUND
}; // END FOR LOOP -- ALL ZONES CREATED

[["All zones found. Welcome to %1, %2",_worldName,profileName], "INFO"] call logsqf_fnc_debugMessage;


hint format["Campaign generated\nzones: %1\nmaximum radius: %2m\nminimum radius: %3m\nmax. distance from HQ: %4m\n\nIf you experience performance issues, restart the mission and try reducing the amount of zones/and or their radius",zones_number,zones_max_radius,zones_min_radius,zones_max_dist_from_hq];
[] spawn {
sleep 20;
[] execVM "misc\bottom_right_message.sqf";
};


// For some reasons I had to add a zone [0,0,0] in _zones_array, now I must remove it:
_zones_array = [_zones_array, 0] call BIS_fnc_removeIndex;

//player globalchat format["%1",_zones_array];
_warcom_init = [_zones_array, getpos hq_blu1, [0,0,0], blufor_ap, opfor_ap, 2700,blufor_ai_skill,opfor_ai_skill, 2000] execVM "WARCOM\WARCOM_init.sqf"; // 2700 is 40 mins
waitUntil {scriptDone _warcom_init};
savegame;
sleep 1;
[[format["Campaign generated<br />Welcome to %1, %2",_worldName,profilename]]] spawn BIS_fnc_typeText;
playMusic ["EventTrack01a_F_EPA", 0];
