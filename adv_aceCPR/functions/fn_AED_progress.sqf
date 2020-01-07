/*
	Author: pike713
*/

params ["_args"];
_args params ["_medic", "_patient"];

!([_patient] call ace_common_fnc_isAwake)
