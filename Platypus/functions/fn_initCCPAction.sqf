if (isNil "Platypus_medic_ccpAction") then {
  Platypus_medic_ccpAction = ["Establish_CCP","Establish CCP","",{[player] call Platypus_fnc_spawnCCP},{"ACE_personalAidKit" in items (_this select 0)},{}] call ace_interact_menu_fnc_createAction;
};

if (isNil "Platypus_medic_listOfMedicClasses") then {
  Platypus_medic_listOfMedicClasses = ["B_Medic_F"];
};

{
  [_x, 1, ["ACE_SelfActions", "ACE_Equipment"], Platypus_medic_ccpAction] call ace_interact_menu_fnc_addActionToClass;
} foreach Platypus_medic_listOfMedicClasses;
