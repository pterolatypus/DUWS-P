_index = lbCurSel 2100;

_skill = (blufor_ai_skill select 0)+0.2;
_skillSF = (blufor_ai_skill select 0)+0.5;
_spawnpos = [(getpos hq_blu1 select 0)-8, (getpos hq_blu1 select 1)-3.5];

_unit = spawnableUnits select _index;
_unitClass = _unit select 1;
_cost = _unit select 2;
_specialFunctions = _unit select 3;

if (commandpointsblu1 >= _cost) then {
    commandpointsblu1 = commandpointsblu1 - _cost;
    publicVariable "commandpointsblu1";
    ctrlSetText [1000, format["%1",commandpointsblu1]];
    _group = group player ;
    _newUnit = _unitClass createUnit [_spawnpos, _group, "", _skill, "private"];
    {_newUnit call _x;} forEach _specialFunctions;
    hint "Unit ready !";
}  else  {
    hint "Not enough command points";
};
