/*
	Author: pike713

	Description:
	Gives a heart rate to a unit

	Parameters:
	_unit: OBJECT - The unit to give a heart rate to

	Returns:
	NONE
*/

params [
	"_unit"
];

private _currentState = [_unit, ace_medical_STATE_MACHINE] call CBA_statemachine_fnc_getCurrentState;
[_unit, ace_medical_STATE_MACHINE, _currentState, "Unconscious", {}, "MANUAL"] call CBA_statemachine_fnc_manualTransition;
