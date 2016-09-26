if (DUWSP_Core_bluforCommandPoints < 10) exitWith {hint "You don't have enough CP to convert into AP";};

DUWSP_Core_bluforCommandPoints = DUWSP_Core_bluforCommandPoints - 10;
WARCOM_blufor_ap = WARCOM_blufor_ap + 15;

ctrlSetText [1000, format["%1",DUWSP_Core_bluforCommandPoints]];
ctrlSetText [1002, format["%1",WARCOM_blufor_ap]];

publicVariable "DUWSP_Core_bluforCommandPoints";
publicVariable "WARCOM_blufor_ap";

hint "Conversion successful";
