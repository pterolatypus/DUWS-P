_index2 = lbCurSel 2103;

switch (_index2) do {
    case 0: {
        if (DUWSP_Core_bluforCommandPoints >= 5) then {
            if (!support_supplydrop_available) then {
                DUWSP_Core_bluforCommandPoints = DUWSP_Core_bluforCommandPoints - 5;
                ctrlSetText [1000, format["%1",DUWSP_Core_bluforCommandPoints]];
                _supplydrop = [player,"ammo"] call BIS_fnc_addCommMenuItem;
                lbSetColor [2103, index_support_supply, [0, 1, 0, 1]];
                playSound "boots";
                support_supplydrop_available = true;
            } else {
                hint "This support is already available";
            };
        } else {
            hint "Not enough command points";
        };
    };
    case 1: {
        if (DUWSP_Core_bluforCommandPoints >= 20) then {
            if (!support_arty_available) then {
                DUWSP_Core_bluforCommandPoints = DUWSP_Core_bluforCommandPoints - 20;
                ctrlSetText [1000, format["%1",DUWSP_Core_bluforCommandPoints]];
                _supplydrop = [player,"artillery"] call BIS_fnc_addCommMenuItem;
                lbSetColor [2103, index_support_arty, [0, 1, 0, 1]];
                playSound "boots";
                support_arty_available = true;
            } else {
                hint "This support is already available";
            };
        } else {
            hint "Not enough command points";
        };
    };
    case 2: {
        if (DUWSP_Core_bluforCommandPoints >= 10) then {
            if (!support_mortar_available) then {
                DUWSP_Core_bluforCommandPoints = DUWSP_Core_bluforCommandPoints - 10;
                ctrlSetText [1000, format["%1",DUWSP_Core_bluforCommandPoints]];
                _supplydrop = [player,"mortar"] call BIS_fnc_addCommMenuItem;
                lbSetColor [2103, index_support_mortar, [0, 1, 0, 1]];
                playSound "boots";
                support_mortar_available = true;
            } else {
                hint "This support is already available";
            };
        } else {
            hint "Not enough command points";
        };
    };
    case 3: {
        if (DUWSP_Core_bluforCommandPoints >= 20) then {
            if (!support_paradrop_available) then {
                DUWSP_Core_bluforCommandPoints = DUWSP_Core_bluforCommandPoints - 20;
                ctrlSetText [1000, format["%1",DUWSP_Core_bluforCommandPoints]];
                _supplydrop = [player,"paradrop"] call BIS_fnc_addCommMenuItem;
                lbSetColor [2103, index_support_paradrop, [0, 1, 0, 1]];
                playSound "boots";
                support_paradrop_available = true;
            } else {
                hint "This support is already available";
            };
        } else {
            hint "Not enough command points";
        };
    };
    case 4: {
        if (DUWSP_Core_bluforCommandPoints >= 15) then {
            if (!support_jdam_available) then {
                DUWSP_Core_bluforCommandPoints = DUWSP_Core_bluforCommandPoints - 15;
                ctrlSetText [1000, format["%1",DUWSP_Core_bluforCommandPoints]];
                _supplydrop = [player,"jdam"] call BIS_fnc_addCommMenuItem;
                lbSetColor [2103, index_support_jdam, [0, 1, 0, 1]];
                playSound "boots";
                support_jdam_available = true;
            } else {
                hint "This support is already available";
            };
        } else {
            hint "Not enough command points";
        };
    };
    case 5: {
        if (DUWSP_Core_bluforCommandPoints >= 8) then {
            if (!support_armory_available) then {
                DUWSP_Core_bluforCommandPoints = DUWSP_Core_bluforCommandPoints - 8;
                ctrlSetText [1000, format["%1",DUWSP_Core_bluforCommandPoints]];
                lbSetColor [2103, index_support_armory, [0, 1, 0, 1]];
                support_armory_available = true;
                publicVariable "support_armory_available";
                playSound "loadgun";
                ["armory",["Armory Unlocked","Access the armory at the HQ and at the dropped supply crates"]] call bis_fnc_showNotification;
            } else {
                hint "This support is already available";
            };
        } else {
            hint "Not enough command points";
        };
    };
    case 6: {
        if (DUWSP_Core_bluforCommandPoints >= 20) then {
            if (!support_PFLIR_available) then {
                DUWSP_Core_bluforCommandPoints = DUWSP_Core_bluforCommandPoints - 20;
                ctrlSetText [1000, format["%1",DUWSP_Core_bluforCommandPoints]];
                lbSetColor [2103, index_support_pFLIR, [0, 1, 0, 1]];
                support_pflir_available = true;
                playSound "loadgun";
                pFLIRenable = player addaction ["<t color='#a9ff59'>Activate FLIR</t>","pflir\livefeed.sqf","", 0,false,true,"","_target == _this"];
                ["pflir",["Personal FLIR display","Toggle you personal FLIR display using the action menu"]] call bis_fnc_showNotification;
            } else {
                hint "This support is already available";
            };
        } else {
            hint "Not enough command points";
        };
    };
    case 7: {
        if (DUWSP_Core_bluforCommandPoints >= 10) then {
            if (!support_uav_recon_available) then {
                DUWSP_Core_bluforCommandPoints = DUWSP_Core_bluforCommandPoints - 10;
                ctrlSetText [1000, format["%1",DUWSP_Core_bluforCommandPoints]];
                _uav_recon = [player,"uav_recon"] call BIS_fnc_addCommMenuItem;
                lbSetColor [2103, index_support_uavrecon, [0, 1, 0, 1]];
                playSound "boots";
                support_uav_recon_available = true;
            } else {
                hint "This support is already available";
            };
        } else {
            hint "Not enough command points";
        };
    };
    case 8: {
        if (DUWSP_Core_bluforCommandPoints >= 3) then {
            if (!support_veh_refit_available) then {
                DUWSP_Core_bluforCommandPoints = DUWSP_Core_bluforCommandPoints - 3;
                ctrlSetText [1000, format["%1",DUWSP_Core_bluforCommandPoints]];
                _veh_refit = [player,"vehicle_refit"] call BIS_fnc_addCommMenuItem;
                lbSetColor [2103, index_support_refit, [0, 1, 0, 1]];
                playSound "loadgun";
                support_veh_refit_available = true;
            } else {
                hint "This support is already available";
            };
        } else {
            hint "Not enough command points";
        };
    };
    case 9: {
        if (DUWSP_Core_bluforCommandPoints >= 3) then  {
            if (!support_helotaxi_available) then {
                DUWSP_Core_bluforCommandPoints = DUWSP_Core_bluforCommandPoints - 3;
                ctrlSetText [1000, format["%1",DUWSP_Core_bluforCommandPoints]];
                _veh_refit = [player,"helo_taxi"] call BIS_fnc_addCommMenuItem;
                lbSetColor [2103, index_support_helotaxi, [0, 1, 0, 1]];
                playSound "boots";
                support_helotaxi_available = true;
            } else {
                hint "This support is already available";
            };
        } else {
            hint "Not enough command points";
        };
    };
    case 10: {
        if (DUWSP_Core_bluforCommandPoints >= 25) then  {
            if (!support_cluster_available) then {
                DUWSP_Core_bluforCommandPoints = DUWSP_Core_bluforCommandPoints - 25;
                ctrlSetText [1000, format["%1",DUWSP_Core_bluforCommandPoints]];
                _cluster = [player1,"cluster"] call BIS_fnc_addCommMenuItem;
                lbSetColor [2103, index_support_cluster, [0, 1, 0, 1]];
                playSound "boots";
                support_cluster_available = true;
            } else {
                hint "This support is already available";
            };
        } else {
            hint "Not enough command points";
        };
    };
    case 11: {
        if (DUWSP_Core_bluforCommandPoints >= 20) then {
            if (!support_specialized_training_available) then {
                DUWSP_Core_bluforCommandPoints = DUWSP_Core_bluforCommandPoints - 20;
                ctrlSetText [1000, format["%1",DUWSP_Core_bluforCommandPoints]];
                ["inf_training",["Specialized Infantry training","Our troops are now more skilled in battle"]] call bis_fnc_showNotification;
                blufor_ai_skill = [(blufor_ai_skill select 0)+0.3,(blufor_ai_skill select 1)+0.3];
                lbSetColor [2103, index_support_training, [0, 1, 0, 1]];
                support_specialized_training_available = true;
                publicVariable "support_specialized_training_available";
                playSound "boots";
                publicVariable "blufor_ai_skill";
            } else {
                hint "This support is already available";
            };
        } else {
            hint "Not enough command points";
        };
    };
    case 12: {
        if (DUWSP_Core_bluforCommandPoints >= 2) then {
            if (!support_boattaxi_available) then {
                DUWSP_Core_bluforCommandPoints = DUWSP_Core_bluforCommandPoints - 2;
                ctrlSetText [1000, format["%1",DUWSP_Core_bluforCommandPoints]];
                lbSetColor [2103, index_support_boattaxi, [0, 1, 0, 1]];
                support_boattaxi_available = true;
                _supplydrop = [player,"boat_taxi"] call BIS_fnc_addCommMenuItem;
                playSound "boots";
            } else {
                hint "This support is already available";
            };
        } else {
            hint "Not enough command points";
        };
    };
    case 13: {
        if (DUWSP_Core_bluforCommandPoints >= 4) then {
            if (!support_vehicledrop_available) then {
                DUWSP_Core_bluforCommandPoints = DUWSP_Core_bluforCommandPoints - 4;
                ctrlSetText [1000, format["%1",DUWSP_Core_bluforCommandPoints]];
                _vehicledrop = [player,"vehicle_drop"] call BIS_fnc_addCommMenuItem;
                lbSetColor [2103, index_support_vehicledrop, [0, 1, 0, 1]];
                playSound "boots";
                support_vehicledrop_available = true;
            } else {
                hint "This support is already available";
            };
        } else {
            hint "Not enough command points";
        };
    };
};
//hint format["index: %1",_index2];
publicVariable "DUWSP_Core_bluforCommandPoints";
