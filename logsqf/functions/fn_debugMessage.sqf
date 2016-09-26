params ["_msg", "_level", ["_force", false]];

if (_force || (_level call logsqf_fnc_showDebug)) then {
    switch ( typeName _msg ) do {
      case "ARRAY": {
        player globalChat (format _msg);
      };
      case "STRING": {
        player globalChat _msg;
      };
      default {
        [str _msg, _level] call logsqf_fnc_debugMessage;
      };
    }
};
