_location = _this select 0;


if (commandpointsblu1<4) exitWith
{
  ["info",["Not enough command points","Not enough Command Points (4CP required)"]] call bis_fnc_showNotification;
};

commandpointsblu1 = commandpointsblu1 - 4;
publicVariable "commandpointsblu1";

hint "An offroad has been dropped near your location";

_parachute = "Steerable_Parachute_F" CreateVehicle _location;
_parachute setPos [_location select 0, _location select 1, (_location select 2)+60];

_vehicle = "C_Offroad_01_F" CreateVehicle [_location select 0,_location select 1,(_location select 2)+40];
_vehicle attachTo [_parachute,[0,0,0]];

waitUntil {sleep 1; getpos _vehicle select 2<0.2};
_smoke = "SmokeShellGreen" CreateVehicle (getpos _vehicle);
["info",["Vehicle delivered","The vehicle has been marked with green smokes"]] call bis_fnc_showNotification;
