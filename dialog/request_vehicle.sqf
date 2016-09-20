_index = lbCurSel 2102;


_spawnPos = getpos player;
_spawnPos = [(_spawnPos select 0)+30, _spawnPos select 1];

_requestedVehicle = spawnableVehicles select _index;

_vehicleClass = _requestedVehicle select 1;
_cost = _requestedVehicle select 2;
_specialFunctions = _requestedVehicle select 3;

if (commandpointsblu1 >= _cost) then {
      commandpointsblu1 = commandpointsblu1 - _cost;
      publicVariable "commandpointsblu1";
      ctrlSetText [1000, format["%1",commandpointsblu1]];
      _vehic = _vehicleClass createVehicle _spawnPos;
      _vehic call _specialFunctions;
      hint "Vehicle ready !";
} else {
  hint "Not enough command points";
};
