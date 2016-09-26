// CP every 30 mins (1800) 
_undercontrol = true;
while {_undercontrol} do {
    waitUntil {zoneundercontrolblu > 0};  // make sure there is at least 1 zone under control
    sleep 1800;
    waitUntil {zoneundercontrolblu > 0}; // check if there is still at least 1 zone under control
    ["CPzonehold",[(zoneundercontrolblu*3),zoneundercontrolblu]] call bis_fnc_showNotification;
    DUWSP_Core_bluforCommandPoints = DUWSP_Core_bluforCommandPoints + (zoneundercontrolblu*3);
    publicVariable "DUWSP_Core_bluforCommandPoints";
    ctrlSetText [1000, format["%1",DUWSP_Core_bluforCommandPoints]];
};