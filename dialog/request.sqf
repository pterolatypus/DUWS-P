_handle = createDialog "ressourceheader";
waitUntil {dialog};
ctrlSetText [1000, format["%1",commandpointsblu1]];
ctrlSetText [1001, format["%1",zoneundercontrolblu]];
ctrlSetText [1002, format["%1",WARCOM_blufor_ap]];


// UNITS
if (isNil "spawnableUnits") then {
  spawnableUnits = call compileFinal preprocessFileLineNumbers "Platypus\cfg\unitList.sqf";
  //spawnableGroups = (missionConfigFile >> "CfgMission" >> "Platypus" >> "cfg" >> "unitList");
};

{
  _index = lbAdd [2100, format["%1 (%2CP)", _x select 0, _x select 2]];
} forEach spawnableUnits;
lbSetCurSel [2100, 0];


// SQUADS
if (isNil "spawnableGroups") then {
  spawnableGroups = call compileFinal preprocessFileLineNumbers "Platypus\cfg\squadList.sqf";
  /*spawnableGroups = call compileFinal preprocessFileLineNumbers (missionConfigFile >> "CfgMission" >> "Platypus" >> "cfg" >> "squadList");*/
  /*spawnableGroups = (missionConfigFile >> "CfgMission" >> "Platypus" >> "cfg" >> "squadList");*/
};

{
  _index = lbAdd [2101, format["%1 (%2CP)", _x select 0, _x select 2]];
} forEach spawnableGroups;
lbSetCurSel [2101, 0];

if (isNil "squadNumbers") then {
  squadNumbers = [];
  {
    squadNumbers pushBack 0;
  } forEach spawnableGroups;
};


// VEHICLES
if (isNil "spawnableVehicles") then {
  spawnableVehicles = call compileFinal preprocessFileLineNumbers "Platypus\cfg\vehicleList.sqf";
  /*spawnableGroups = (missionConfigFile >> "CfgMission" >> "Platypus" >> "cfg" >> "vehicleList");*/
};

{
  _index1 = lbAdd [2102, format["%1 (%2CP)", _x select 0, _x select 2]];
} forEach spawnableVehicles;
lbSetCurSel [2102, 0];


//Custom supports probably take a lot of scripting work,
//I may look at it later
// Supports  !!! CHECK TO ADD AT INIT
index_support_supply = lbAdd [2103, "Supply drop(5CP)"];                      // 0
index_support_arty = lbAdd [2103, "Artillery strike(20CP)"];                  // 1
index_support_mortar = lbAdd [2103, "Mortar strike(10CP)"];                   // 2
index_support_paradrop = lbAdd [2103, "Airborne troops(20CP)"];               // 3
index_support_jdam = lbAdd [2103, "JDAM strike(15CP)"];                       // 4
index_support_armory = lbAdd [2103, "Armory(8CP)"];                           // 5
index_support_pFLIR = lbAdd [2103, "Personal FLIR display(20CP)"];            // 6
index_support_uavrecon = lbAdd [2103, "UAV Recon(10CP)"];                     // 7
index_support_refit = lbAdd [2103, "Vehicle Refit(3CP)"];                     // 8
index_support_helotaxi = lbAdd [2103, "Helicopter Taxi(3CP)"];                // 9
index_support_cluster = lbAdd [2103, "Mk.20 II CBU(25CP)"];                   // 10
index_support_training = lbAdd [2103, "Specialized Infantry training(20CP)"]; // 11
index_support_boattaxi = lbAdd [2103, "Boat Taxi(2CP)"];                  // 12
index_support_vehicledrop = lbAdd [2103, "Offroad Drop (4CP)"];

//  lbSetCurSel [2103, 0];
if (support_supplydrop_available) then {
    lbSetColor [2103, 0, [0, 1, 0, 1]];
};
if (support_arty_available) then {
    lbSetColor [2103, 1, [0, 1, 0, 1]];
};
if (support_mortar_available) then {
    lbSetColor [2103, 2, [0, 1, 0, 1]];
};
if (support_paradrop_available) then {
    lbSetColor [2103, 3, [0, 1, 0, 1]];
};
if (support_jdam_available) then {
    lbSetColor [2103, 4, [0, 1, 0, 1]];
};
if (support_armory_available) then {
    lbSetColor [2103, 5, [0, 1, 0, 1]];
};
if (support_pflir_available) then {
    lbSetColor [2103, 6, [0, 1, 0, 1]];
};
if (support_uav_recon_available) then {
    lbSetColor [2103, 7, [0, 1, 0, 1]];
};
if (support_veh_refit_available) then {
    lbSetColor [2103, 8, [0, 1, 0, 1]];
};
if (support_helotaxi_available) then {
    lbSetColor [2103, 9, [0, 1, 0, 1]];
};
if (support_cluster_available) then {
    lbSetColor [2103, 10, [0, 1, 0, 1]];
};
if (support_specialized_training_available) then {
    lbSetColor [2103, 11, [0, 1, 0, 1]];
};
if (support_boattaxi_available) then {
    lbSetColor [2103, 12, [0, 1, 0, 1]];
};
if (support_vehicledrop_available) then {
    lbSetColor [2103, 13, [0, 1, 0, 1]];
};
