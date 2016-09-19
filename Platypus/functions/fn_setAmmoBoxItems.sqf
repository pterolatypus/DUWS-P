params [["_box", missionNamespace], ["_level", 0]];

_items = call compile "Platypus\config\arsenalWhitelist.sqf";
_items = _items select _level;

BIS_fnc_addVirtualBackpackCargo
BIS_fnc_addVirtualItemCargo
BIS_fnc_addVirtualMagazineCargo
BIS_fnc_addVirtualWeaponCargo
