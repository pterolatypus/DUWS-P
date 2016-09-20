_handle = createDialog "startup_dialog";
waitUntil {dialog};

/// MAX RADIUS
cfg_max_radius_list = [[500, 750, 1000, 1250, 1500, 1750, 2000, 2500, 3000, 4000], 2];
{
  _name = "";
  if (_forEachIndex == cfg_max_radius_list select 1) then {
    _name = format ["%1 meters (default)", _x];
    lbAdd [2100, _name];
  } else {
    _name = format ["%1 meters", _x];
    lbAdd [2100, _name];
  };
} forEach (cfg_max_radius_list select 0);
lbSetCurSel [2100, cfg_max_radius_list select 1];

// MIN RADIUS
cfg_min_radius_list = [[250, 500, 750, 1000, 1250, 1500, 1750, 2000, 2500, 3000], 0];
{
  _name = "";
  if (_forEachIndex == cfg_min_radius_list select 1) then {
    _name = format ["%1 meters (default)", _x];
    lbAdd [2101, _name];
  } else {
    _name = format ["%1 meters", _x];
    lbAdd [2101, _name];
  };
} forEach (cfg_min_radius_list select 0);
lbSetCurSel [2101, cfg_min_radius_list select 1];

// AMOUNT ENEMY ZONES
cfg_num_zones_list = [[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20], 5];
{
  _name = "";
  if (_forEachIndex == cfg_num_zones_list select 1) then {
    _name = format ["%1 (default)", _x];
    lbAdd [2102, _name];
  } else {
    _name = format ["%1", _x];
    lbAdd [2102, _name];
  };
  } forEach (cfg_num_zones_list select 0);
lbSetCurSel [2102, cfg_num_zones_list select 1];

// STARTING CP AVAILABLE
cfg_starting_cp_list = [[5, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100, 200, 300, 400, 500, 600], 6];
{
  _name = "";
  if (_forEachIndex == cfg_starting_cp_list select 1) then {
    _name = format ["%1 CP (default)", _x];
    lbAdd [2103, _name];
  } else {
    _name = format ["%1 CP", _x];
    lbAdd [2103, _name];
  };
} forEach (cfg_starting_cp_list select 0);
lbSetCurSel [2103, cfg_starting_cp_list select 1];

// BLUFOR AP
cfg_blufor_ap_list = [[0, 10, 25, 50, 75, 100], 0];
{
  _name = "";
  if (_forEachIndex == cfg_blufor_ap_list select 1) then {
    _name = format ["%1 AP (default)", _x];
    lbAdd [2104, _name];
  } else {
    _name = format ["%1 AP", _x];
    lbAdd [2104, _name];
  };
} forEach (cfg_blufor_ap_list select 0);
lbSetCurSel [2104, cfg_blufor_ap_list select 1];

// OPFOR AP
cfg_opfor_ap_list = [[0, 10, 25, 50, 75, 100], 0];
{
  _name = "";
  if (_forEachIndex == cfg_opfor_ap_list select 1) then {
    _name = format ["%1 AP (default)", _x];
    lbAdd [2105, _name];
  } else {
    _name = format ["%1 AP", _x];
    lbAdd [2105, _name];
  };
} forEach (cfg_opfor_ap_list select 0);
lbSetCurSel [2105, cfg_opfor_ap_list select 1];

// WEATHER TYPE
cfg_weather_type_list = [["Tropical", "Arid", "Temperate", "Cold", "Mediterranean", "Disabled"], 4];
{
  _name = "";
  if (_forEachIndex == cfg_weather_type_list select 1) then {
    _name = format ["%1 (default)", _x];
    lbAdd [2106, _name];
  } else {
    _name = _x;
    lbAdd [2106, _name];
  };
} forEach (cfg_weather_type_list select 0);
lbSetCurSel [2106, cfg_weather_type_list select 1];

// AI OPF SKILL
cfg_opfor_skill_list = [[[0, 0.3], [0.2,0.5], [0.4,0.7], [0.6,0.8], [0.8,1]], 1];
{
  _name = "";
  if (_forEachIndex == cfg_opfor_skill_list select 1) then {
    _name = format ["%1-%2 (default)", _x select 0, _x select 1];
    lbAdd [2107, _name];
  } else {
    _name = format ["%1-%2", _x select 0, _x select 1];
    lbAdd [2107, _name];
  };
} forEach (cfg_opfor_skill_list select 0);
lbSetCurSel [2107, cfg_opfor_skill_list select 1];

// AI BLU SKILL
cfg_blufor_skill_list = [[[0, 0.3], [0.2,0.5], [0.4,0.7], [0.6,0.8], [0.8,1]], 1];
{
  _name = "";
  if (_forEachIndex == cfg_blufor_skill_list select 1) then {
    _name = format ["%1-%2 (default)", _x select 0, _x select 1];
    lbAdd [2108, _name];
  } else {
    _name = format ["%1-%2", _x select 0, _x select 1];
    lbAdd [2108, _name];
  };
} forEach (cfg_blufor_skill_list select 0);
lbSetCurSel [2108, cfg_blufor_skill_list select 1];

// ENABLE CHOPPER FAST TRAVEL
cfg_chopper_travel_list = [["No", "Yes"], 1];
{
  _name = "";
  if (_forEachIndex == cfg_chopper_travel_list select 1) then {
    _name = format ["%1 (default)", _x];
    lbAdd [2109, _name];
  } else {
    _name = format ["%1", _x];
    lbAdd [2109, _name];
  };
} forEach (cfg_chopper_travel_list select 0);
lbSetCurSel [2109, cfg_chopper_travel_list select 1];

// FAST TRAVEL
cfg_fast_travel_list = [["No", "Yes"], 1];
{
  _name = "";
  if (_forEachIndex == cfg_fast_travel_list select 1) then {
    _name = format ["%1 (default)", _x];
    lbAdd [2714, _name];
  } else {
    _name = format ["%1", _x];
    lbAdd [2714, _name];
  };
} forEach (cfg_fast_travel_list select 0);
lbSetCurSel [2714, cfg_fast_travel_list select 1];

// MAX DISTANCE FROM HQ
cfg_max_distance_list = [[2500, 5000, 7500, 10000, 12500, 15000, 17500, 20000, 25000, 30000], 1];
{
  _name = "";
  if (_forEachIndex == cfg_max_distance_list select 1) then {
    _name = format ["%1 (default)", _x];
    lbAdd [2188, _name];
  } else {
    _name = format ["%1", _x];
    lbAdd [2188, _name];
  };
} forEach (cfg_max_distance_list select 0);
lbSetCurSel [2188, cfg_max_distance_list select 1];

// CP REWARD MULTIPLIER
cfg_cp_reward_list = [[0.1, 0.5, 1, 2, 5, 10], 2];
{
  _name = "";
  if (_forEachIndex == cfg_cp_reward_list select 1) then {
    _name = format ["%1 (default)", _x];
    lbAdd [2189, _name];
  } else {
    _name = format ["%1", _x];
    lbAdd [2189, _name];
  };
} forEach (cfg_cp_reward_list select 0);
lbSetCurSel [2189, cfg_cp_reward_list select 1];
