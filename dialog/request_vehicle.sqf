_index = lbCurSel 2102;


_spawnPos = getpos player;
_spawnPos = [(_spawnPos select 0)+30, _spawnPos select 1];

_requestedVehicle = spawnableVehicles select _index;

_vehicleClass = _requestedVehicle select 1;
_cost = _requestedVehicle select 2;
_specialFunctions = _requestedVehicle select 3;

if (DUWSP_Core_bluforCommandPoints >= _cost) then {
      DUWSP_Core_bluforCommandPoints = DUWSP_Core_bluforCommandPoints - _cost;
      publicVariable "DUWSP_Core_bluforCommandPoints";
      ctrlSetText [1000, format["%1",DUWSP_Core_bluforCommandPoints]];
      _vehic = _vehicleClass createVehicle _spawnPos;
      _vehic call _specialFunctions;
      hint "Vehicle ready !";
} else {
  hint "Not enough command points";
};
