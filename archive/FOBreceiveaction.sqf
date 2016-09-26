		sleep 10;
		_fobAmount = count Array_of_FOBS;
		_fobIndex = _fobAmount - 1;
		_createdFOB = Array_of_FOBS select _fobIndex;
		[_createdFOB] call DUWSP_fnc_addFobActions;
