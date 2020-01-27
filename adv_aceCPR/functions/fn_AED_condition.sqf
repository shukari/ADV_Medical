/*
	Author: pike713

	Description:
	The condition for the AED to be usable

	Parameters:
	_caller: OBJECT - The medic attempting to use the AED
	_target: OBJECT - The patient on whom the AED is being used

	Returns:
	BOOL - True if the AED is currently usable, false otherwise
*/

params [
	"_caller",
	"_target"
];

private _medicLevel = _caller getVariable ["ace_medical_medicClass", getNumber (configFile >> "CfgVehicles" >> typeOf _caller >> "attendant")];
private _requiredLevel = missionNamespace getVariable ["adv_aceCPR_onlyDoctors", 0];

_medicLevel >= _requiredLevel
&& { missionNamespace getVariable ['adv_aceCPR_enable', true] }
&& { !([_target] call ace_common_fnc_isAwake) }
