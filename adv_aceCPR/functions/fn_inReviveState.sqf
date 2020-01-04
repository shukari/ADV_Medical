/*
	Author: pike713

	Description:
	Checks if the unit is unconscious.

	Parameters:
	_unit: OBJECT - The unit to check

	Returns:
	BOOL - True if the unit is in the unconscious state, false otherwise
*/

params [
	"_unit"
];

private _currentState = [_unit, ace_medical_STATE_MACHINE] call CBA_statemachine_fnc_getCurrentState;
_currentState == "Unconscious"
