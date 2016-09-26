params [["_center", [x_mapsize/2, y_mapsize/2]], ["_min_distance", 500], ["_max_distance", 10000], ["_num_locations", 6], ["_max_combine_range", 400], ["_precision", 0.01]];

//number of positions to initially generate
_n = 1000;

//find _n random map positions which are near houses
_places = selectBestPlaces [_center, _max_distance, "houses", _precision, _n];

//remove all locations which are too close to the center
{
  if ((_x select 0) distance _center < _min_distance) then {
    _places set [_forEachIndex, ObjNull];
  };
} foreach _places;
_places = _places - [ObjNull];


_newPlaces = [];
_change = 1;

//merge nearby results together to identify dense areas
while {_change > 0;} do {
  _num_places = count _places;

  /*
  *   loop over the entire list:
  *   -remove the first element
  *   -find the closest other location to it
  *     -if they're within _max_combine_range, merge them
  *     -otherwise leave it unchanged
  *   -push the result back onto the list
  * continue looping until we do a pass which doesn't merge any locations
  */
  for "_i" from 0 to (count _places) do {

    _place = _places select 0;

    //remove this element from the list
    //otherwise it'll register itself as the closest location
    _places = [_places, 0] call BIS_fnc_removeIndex;

    //loop to find the closest other location
    _closest = [];
    _cdist = 9999999;
    _cIndex = -1;
    {
      _dist = ((_place select 0) distance (_x select 0));
      if (_dist < _cdist) then {
        _closest = _x;
        _cdist = _dist;
        _cIndex = _forEachIndex;
      };
    } foreach _places;

    //if the closest one is within combine range, combine them and add the result onto the end of the list
    if (_cdist < _max_combine_range) then {

      //remove the other location
      _places = [_places, _cIndex] call BIS_fnc_removeIndex;

      //combine the scores of the two locations
      _total = (_place select 1) + (_closest select 1);

      //interpolate between the two locations, first X then Y
      _placePos = _place select 0;
      _closestPos = _closest select 0;
      _newX = [_placePos select 0, _closestPos select 0, 0.5] call Platypus_fnc_interpolate;
      _newY = [_placePos select 1, _closestPos select 1, 0.5] call Platypus_fnc_interpolate;

      //shove the new result on the end of the list
      _places pushBack [[_newX, _newY], _total];
    } else {
      //if it can't be merged just add it back onto the end of the list
      _places pushBack _place;
    };
  };

  //how many merges have we performed on this pass?
  _change = _num_places - count _places;

};

//swap the parameters (position and score) to allow us to sort the list
{
   _newPlaces pushBack [_x select 1, _x select 0];
} foreach _places;
_places = _newPlaces;
_places sort false;


//take only the 2*_num_locations best results
_newPlaces = [];
for "_i" from 0 to 2*_num_locations do {
  _newPlaces pushBack (_places select _i);
};
_places = _newPlaces;

//select _num_locations randomly from this subset
_newPlaces = [];
for "_i" from 0 to _num_locations-1 do {

  _rand = floor (random (count _places));

  //return only the location; the scores are no longer important
  _newPlaces pushBack ((_places select _rand) select 1);

  //remove the location to prevent duplicates
  _places = [_places, _rand] call BIS_fnc_removeIndex;
};
_newPlaces;
