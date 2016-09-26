while {true} do {
    sleep 1800;
    DUWSP_Core_bluforCommandPoints = DUWSP_Core_bluforCommandPoints + 5;
    publicVariable "DUWSP_Core_bluforCommandPoints";
};