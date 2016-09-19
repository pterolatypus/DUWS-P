params ["_unit"];

_currentBuilding = _unit call Platypus_fnc_currentBuilding;
if (isNil "_currentBuilding") exitWith {hint "You must be in a suitable building"; nil};

_unit removeItem "ACE_personalAidKit";
_currentBuilding setVariable ["ACE_medical_isMedicalFacility", true];
hint "CCP established";
