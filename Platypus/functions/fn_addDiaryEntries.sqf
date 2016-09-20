params [["_entries", []], ["_unit", player]];

{
  _subject = _x select 0;
  _unit createDiarySubject [_subject, _x select 1];
  {
    _unit createDiaryRecord [_subject, _x];
  } foreach _x select 2;
} foreach _entries;
