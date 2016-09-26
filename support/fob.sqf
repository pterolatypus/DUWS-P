_position = _this select 0;
_size = _this select 1;

if (DUWSP_Core_bluforCommandPoints < 10) exitWith {
  ["info",["Not enough command points","Not enough Command Points (10CP required)"]] call bis_fnc_showNotification;
  sleep 15;
  _art = [player1,"fob_support"] call BIS_fnc_addCommMenuItem;
};

// REGARDE SI LA ZONE EST OK
Hint "Requesting a FOB...";
player sidechat "Requesting a FOB on my position...";

_trg=createTrigger["EmptyDetector",_position];
_trg setTriggerArea[_size,_size,0,false];
_trg setTriggerActivation["EAST","PRESENT",true];
_trg setTriggerStatements["this", "", ""];
sleep 10;
_amountOPFOR = count list _trg;

deleteVehicle _trg;

if (_amountOPFOR > 0) exitWith {
Hint "This position is not clear from enemies";
PAPABEAR sidechat "Request denied. Enemies are too close to this position.";
sleep 15;
  _art = [player1,"fob_support"] call BIS_fnc_addCommMenuItem;
};

// try to find a pos, if no pos is found exit the script
_foundPickupPos = [_position, 0,50,10,0,0.2,0,[],[[0,0],[0,0]]] call BIS_fnc_findSafePos; // find a valid pos
if (0 == _foundPickupPos select 0 && 0 == _foundPickupPos select 1) exitWith {hint "No valid FOB pos nearby\nTry to go near a flat, object free zone."; sleep 5; _art = [player1,"fob_support"] call BIS_fnc_addCommMenuItem;};

// LA ZONE EST OK

DUWSP_Core_bluforCommandPoints = DUWSP_Core_bluforCommandPoints - 10;
publicVariable "DUWSP_Core_bluforCommandPoints";
PAPABEAR sidechat "Roger that, the FOB is being deployed...";

_fobname = [] call Platypus_fnc_getRandomCallsign;
// create marker on FOB
_markername = format["fob%1%2",round (_foundPickupPos select 0),round (_foundPickupPos select 1)]; // Define marker name
//hint _markername;
_markerstr = createMarker [str(_markername), _foundPickupPos];
_markerstr setMarkerShape "ICON";
str(_markername) setMarkerType "loc_Bunker";
str(_markername) setMarkerColor "ColorBLUFOR";
str(_markername) setMarkerText format["FOB %1",_fobname];
str(_markername) setMarkerSize [2.5, 2.5];



sleep 5;


_fob = "Land_Cargo_HQ_V1_F" createVehicle _foundPickupPos;

[_fob] remoteExecCall ["DUWSP_fnc_addFobActions", 0, true];
[missionNamespace, _createdFOB] remoteExecCall ["BIS_fnc_addRespawnPosition", 0, true];

// For fortifying
_fob addaction ["<t color='#ff0000'>Fortify FOB(4CP)</t>","inithq\fortifyFOB.sqf", [(getpos _fob), _fob], 0, true, true, "", "_this == player"];

[_foundPickupPos, _size] execvm "createpatrol.sqf";
[_foundPickupPos, _size] execvm "createpatrol.sqf";
[_foundPickupPos, _size] execvm "createpatrol.sqf";

PAPABEAR sidechat "The FOB has been deployed.";

_handle = [_foundPickupPos, _fob] execVM "initHQ\guardsFOB.sqf";


// CREATE ZONE NOTIFICATION TRIGGER
_size = 75;
_trg23=createTrigger["EmptyDetector",_foundPickupPos];
_trg23 triggerAttachVehicle [player];
_trg23 setTriggerArea[_size,_size,0,false];
_trg23 setTriggerActivation["VEHICLE","PRESENT",true];
_trg23 setTriggerStatements["this", format["[""FOB %1"",thislist] execvm 'enterlocation.sqf'",_fobname], ""];

// warning trigger when an enemy approaches the camp
_trgWarning=createTrigger["EmptyDetector",_foundPickupPos];
_trgWarning setTriggerArea[300,300,0,false];
_trgWarning setTriggerActivation["EAST","PRESENT",true];
_trgWarning setTriggerStatements["this",format["PAPABEAR sidechat 'This is HQ, enemies have been reported around FOB %1'",_fobname], ""];

//ADD THE FOB TO Array_of_FOBS
fobSwitch = true; // tell that this is the player who created the FOB (to avoid variableEventHandler to trigger)
Array_of_FOBS = Array_of_FOBS + [_fob];
publicVariable "Array_of_FOBS";

Array_of_FOBname = Array_of_FOBname + [_fobname];
publicVariable "Array_of_FOBname";



sleep 1;

saveGame;

sleep 1;

sleep 600;
_art = [player1,"fob_support"] call BIS_fnc_addCommMenuItem;

// Land_Cargo_HQ_V1_F
