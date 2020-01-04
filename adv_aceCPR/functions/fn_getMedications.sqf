/*
	Author: pike713

	Description:
	Checks if the status of a unit's medications.

	Parameters:
	_unit: OBJECT - The object to check for morphine

	Returns:
	ARRAY - number array in the form [morphine, epinephrine, adenosine], indicating the amount of each
		medication present.
*/

params [
	"_unit"
];

private _result =  [0, 0, 0];
private _adjustments = _unit getVariable ["ace_medical_medications", []];

{
	_x params ["_xMed", "_timeAdded", "_timeTillMaxEffect", "_maxTimeInSystem"];

	private _timeInSystem = CBA_missionTime - _timeAdded;
	private _add = if (_getCount) then {
		linearConversion [_timeTillMaxEffect, _maxTimeInSystem, _timeInSystem, 1, 0, true];
	} else {
		(((_timeInSystem / _timeTillMaxEffect) ^ 2) min 1) * (_maxTimeInSystem - _timeInSystem) / _maxTimeInSystem;
	};

	switch (_xMed) do {
		case "Morphine":    { _result set [0, (_result#0) + _add]; };
		case "Epinephrine": { _result set [1, (_result#1) + _add]; };
		case "Adenosine":   { _result set [2, (_result#2) + _add]; };
	};
} forEach (_adjustments);

_result
