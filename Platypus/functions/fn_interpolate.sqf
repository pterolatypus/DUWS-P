params [["_first", 0], ["_second", 0], ["_factor", 0.5]];
_first = _this param [0, 0];
_second = _this param [1, 0];
_factor = _this param [2, 0.5];

_result = (_factor * (_first - _second)) + _second;
_result;
