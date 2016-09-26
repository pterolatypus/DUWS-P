_index = lbCurSel 2100;

_skill = (blufor_ai_skill select 0)+0.2;
_skillSF = (blufor_ai_skill select 0)+0.5;
_spawnpos = [(getpos hq_blu1 select 0)-8, (getpos hq_blu1 select 1)-3.5];

_unit = spawnableUnits select _index;
_unitClass = _unit select 1;
_cost = _unit select 2;
_specialFunctions = _unit select 3;

if (DUWSP_Core_bluforCommandPoints >= _cost) then {
    DUWSP_Core_bluforCommandPoints = DUWSP_Core_bluforCommandPoints - _cost;
    publicVariable "DUWSP_Core_bluforCommandPoints";
    ctrlSetText [1000, format["%1",DUWSP_Core_bluforCommandPoints]];
    _group = group player ;
    _newUnit = _unitClass createUnit [_spawnpos, _group, "", _skill, "private"];
    {_newUnit call _x;} forEach _specialFunctions;
    hint "Unit ready !";
}  else  {
    hint "Not enough command points";
};
