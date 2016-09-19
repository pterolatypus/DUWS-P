_msg = _this select 0;
_level = _this select 1;

if (_level call logsqf_fnc_showDebug) then {
    player globalChat (format _msg);
};
