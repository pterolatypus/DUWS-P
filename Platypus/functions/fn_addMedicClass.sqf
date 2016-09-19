params ["_class"];

Platypus_medic_listOfMedicClasses pushBack _class;
[_class, 1, ["ACE_SelfActions", "ACE_Equipment"], Platypus_medic_ccpAction] call ace_interact_menu_fnc_addActionToClass;
