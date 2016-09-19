//default globals
if (isNil "logging_levels") then {
  logging_levels = ["ALL", "TRACE", "DEBUG", "INFO", "WARNING", "ERROR"];
};
if (isNil "logging_level") then {logging_level = "ERROR"};


_return = false;
if (logging_level in logging_levels) then {
  _level_index = count logging_levels - 1;
  _param_index = 0;
  {
    if (logging_level == _x) exitwith {_level_index = _forEachIndex} //looks up the index of the logging level
  } foreach logging_levels;
  {
    if (_this == _x) exitwith {_param_index = _forEachIndex} //looks up the index of the level specified in the parameter
  } foreach logging_levels;
  _return = (_param_index >= _level_index); //if the parameter is a higher level than the current threshold, return true
};
_return;
