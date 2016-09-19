private ["_bestPosition"];

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

_worldName = getText(configFile >> "cfgWorlds" >> worldName >> "description");

_fortified = false;

_locations = [hq_blu1, 500, zones_max_dist_from_hq, zones_number] call Platypus_fnc_findUrbanZones;
_zones_array = [];

{
  [["Generating zone %1", _forEachIndex+1], "INFO"] call logsqf_fnc_debugMessage;
  _radius = 0;
  while {isNil "_bestPosition"} do {
    if (_radius > 500) exitwith {
      _break = true;
      [["Could not find a suitable location within %1m, try restarting the mission!", _radius], "ERROR"] call logsqf_fnc_debugMessage;
    };
    _radius = _radius + 50;
    [["No locations found, increasing radius to %1m", _radius], "TRACE"] call logsqf_fnc_debugMessage;
    _bestPosition = [_x, 0, _radius,5,0,0.1,0] call BIS_fnc_findSafePos;
  };

  //loop to find the closest other location
  _cdist = 9999999;
  _place = _x;
  {
    _dist = _place distance _x;
    if (_dist < _cdist && _dist > 0) then {
      _cdist = _dist;
    };
  } foreach _locations-[_x];
  [["Distance to closest other zone = %1", str _cDist], "TRACE"] call logsqf_fnc_debugMessage;

  //fetches a radius some random fraction between zones_min_radius and whichever is smaller of zones_max_radius and halfway to the nearest other zone
  _maxrad = (_cdist / 2) min zones_max_radius;
  [["Maximum radius calculated to %1m", str _maxrad], "TRACE"] call logsqf_fnc_debugMessage;
  _rand = random 1;
  [["Randomiser: %1", str _rand], "TRACE"] call logsqf_fnc_debugMessage;
  _zone_radius = [zones_min_radius, _maxrad, _rand] call Platypus_fnc_interpolate;
  [["Randomised radius calculated to %1m", str _zone_radius], "TRACE"] call logsqf_fnc_debugMessage;
  _points_zone = round (_zone_radius/10);

  _missionPos = [round(_bestPosition select 0),round(_bestPosition select 1)];
  _bestPosition = nil;
  _generatezonescript = [format["Zone %1",_forEachIndex+1],_points_zone,_zone_radius,_MissionPos,_fortified,true] execvm "initZones\createzone.sqf";

  _zones_array = _zones_array + [_MissionPos];
  waituntil {scriptdone _generatezonescript};
  [["Finished generating zone %1", _forEachIndex+1], "INFO"] call logsqf_fnc_debugMessage;

} foreach _locations;

[["All zones found. Welcome to %1, %2",_worldName,profileName], "INFO"] call logsqf_fnc_debugMessage;


hint format["Campaign generated\nzones: %1\nmaximum radius: %2m\nminimum radius: %3m\nmax. distance from HQ: %4m\n\nIf you experience performance issues, restart the mission and try reducing the amount of zones/and or their radius",zones_number,zones_max_radius,zones_min_radius,zones_max_dist_from_hq];
[] spawn {
sleep 20;
//[] execVM "misc\bottom_right_message.sqf";
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
