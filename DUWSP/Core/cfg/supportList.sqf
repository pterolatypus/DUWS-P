//List of supports
//entry syntax: ["supportID":String, "Readable Name":String, cpCost:Number, unlocksForAllPlayers:Boolean, "commandMenuItem":String]
[
  ["ammobox", "ammobox", 5, false, { [player,"ammo"] call BIS_fnc_addCommMenuItem }],
  ["arty", "arty", 20, false, { [player,"artillery"] call BIS_fnc_addCommMenuItem }],
  ["mortar", "mortar", 10, false, { [player,"mortar"] call BIS_fnc_addCommMenuItem }],
  ["paradrop", "paradrop", 20, false, { [player,"paradrop"] call BIS_fnc_addCommMenuItem }],
  ["jdam", "jdam", 15, false, { [player,"jdam"] call BIS_fnc_addCommMenuItem }],
  ["armory", "armory", 8, true, { ["armory",["Armory Unlocked","Access the armory at the HQ and at the dropped supply crates"]] call bis_fnc_showNotification }],
  ["pflir", "pflir", 20, false, {
    pFLIRenable = player addaction ["<t color='#a9ff59'>Activate FLIR</t>","pflir\livefeed.sqf","", 0,false,true,"","_target == _this"];
    ["pflir",["Personal FLIR display","Toggle you personal FLIR display using the action menu"]] call bis_fnc_showNotification
  }],
  ["uav_recon", "uav_recon", 10, false, { [player,"uav_recon"] call BIS_fnc_addCommMenuItem }],
  ["veh_refit", "veh_refit", 3, false, { [player,"vehicle_refit"] call BIS_fnc_addCommMenuItem }],
  ["helotaxi", "helotaxi", 3, false, { [player,"helo_taxi"] call BIS_fnc_addCommMenuItem }],
  ["cluster", "cluster", 25, false, { [player,"cluster"] call BIS_fnc_addCommMenuItem }],
  ["specialized_training", "specialized_training", 20, true, {
    ["inf_training",["Specialized Infantry training","Our troops are now more skilled in battle"]] call bis_fnc_showNotification;
    blufor_ai_skill = [(blufor_ai_skill select 0)+0.3,(blufor_ai_skill select 1)+0.3]
  }],
  ["boat_taxi", "boat_taxi", 2, false, { [player,"boat_taxi"] call BIS_fnc_addCommMenuItem }],
  ["vehicledrop", "vehicledrop", 4, false, { [player,"vehicle_drop"] call BIS_fnc_addCommMenuItem }]
];
