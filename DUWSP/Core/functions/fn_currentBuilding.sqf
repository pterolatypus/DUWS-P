params ["_unit"];

_targetBuilding = nil;
_nearestBuilding = nearestBuilding _unit;
_eyez = (eyePos _unit) select 2;

private _objects = (lineIntersectsWith [_unit modelToWorldVisual [0, 0, _eyez], _unit modelToWorldVisual [0, 0, _eyez+10], _unit]);

{
    if (typeOf _x == typeOf _nearestBuilding) exitWith {_targetBuilding = _x};
} forEach _objects;
if (!isNil "_nearestBuilding") exitWith {_nearestBuilding};
