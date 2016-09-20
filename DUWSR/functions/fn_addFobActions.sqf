params ["_fob"];


["AmmoboxInit",[_fob, true, support_armory_available]] spawn BIS_fnc_arsenal;

_fob addaction ["<t color='#ff00ff'>Player stats</t>","dialog\info\info.sqf", "", 0, true, true, "", "_this == player"];
_fob addaction ["<t color='#15ff00'>Request units</t>","dialog\request.sqf", "", 0, true, true, "", "_this == player"];
_fob addaction ["<t color='#15ff00'>Request ammobox drop(2CP)</t>","support\fob_ammobox.sqf", "", 0, true, true, "", "_this == player"];
_fob addaction ["<t color='#ffb700'>Squad manager</t>","dialog\squad\squadmng.sqf", "", 0, true, true, "", "_this == player"];
_fob addaction ["<t color='#ffb700'>FOB manager</t>","dialog\fob\FOBmanageropen.sqf", "", 0, true, true, "", "_this == player"];

if (isServer) then {
  _fob addaction ["<t color='#00b7ff'>Rest (wait/save)</t>",{ [] call DUWSR_fnc_restServer }, "", 0, true, true, "", "_this == player"];
  } else {
    _fob addaction ["<t color='#00b7ff'>Rest</t>",{ [] call DUWSR_fnc_restClient }, "", 0, true, true, "", "_this == player"];
  };
