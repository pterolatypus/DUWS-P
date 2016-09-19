// init the array of missions
_array_of_missions = [];
_allFound = false;
_counter = 0;

if (isnil ("Mission_timeout_request")) then {Mission_timeout_request = true;};
if (!Mission_timeout_request) exitWith {PAPABEAR=[West,"HQ"]; PAPABEAR SideChat "We don't have any other missions for you right now.";};
if (!isServer) exitWith {hint "Only the host can request side missions for now"};

startLoadingScreen ["Loading zones..."];

_mission_locations = [];

while {count _mission_locations < 6} do {
  _foundSafePos = [position hq_blu1, zones_max_dist_from_hq/5,zones_max_dist_from_hq,5,0,0.1,0] call BIS_fnc_findSafePos;

  _valid = true;

  {
    if ((_foundSafePos distance _x) < 1500) exitwith {_valid = false};
  } foreach _mission_locations;

  if (_valid) then {
    _mission_locations pushBack _foundSafePos;
  };

};

_mission_list = call compile preprocessFile "missions\missionList.sqf";

{

  _position = _x;
  [["Generating mission at position: %1", _x], "TRACE"] call logsqf_fnc_debugMessage;

  // randomly select a mission type
  _dice = floor random (count _mission_list);
  _mission_type = _mission_list select _dice;

  _mission_type params ["_mission_script", "_mission_description", "_mission_icon"];

  _mission_name = call Platypus_fnc_generateSideMissionName;

  _mission = [
      _position,
      {
        (_this select 9) params ["_pos", "_script", "_mission_name"];
        [_pos, _mission_name] execVM _script;
        execVM "missions\missionTimer.sqf"
      },
      _mission_name,
      _mission_description,
      "",
      _mission_icon,
      1,
      [_position, _mission_script, _mission_name]
  ];

  _array_of_missions pushBack _mission;
  [["Successfully generated mission %1", _forEachIndex+1], "TRACE"] call logsqf_fnc_debugMessage;

} forEach _mission_locations;


endLoadingScreen;

// -------****- NOW OPEN THE MAP
_isNight = ((20 < daytime) OR (daytime < 5));

// https://community.bistudio.com/wiki/BIS_fnc_StrategicMapOpen
// 0: DISPLAY - parent display. When empty, mission display is used.
// 1: ARRAY - default view position in format [x,y,y] or [x,y]
// 2: ARRAY - list of missions in format:
// 3: ARRAY - list of ORBAT groups in format:
// 4: ARRAY - list of markers revealed in strategic map (will be hidden when map is closed)
// 5: ARRAY - list of custom images in format:
// 6: NUMBER - value in range <0-1> defining weather on strategic map (i.e. density of clouds)
// 7: BOOL - true for night version of strategic map (darker with blue tone)
[(findDisplay 46), getpos player, _array_of_missions, [], [], [], 1, _isNight] call BIS_fnc_strategicMapOpen;
