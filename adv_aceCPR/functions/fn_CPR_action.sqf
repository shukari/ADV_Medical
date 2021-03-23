/*
ADV-aceCPR - by Belbo
*/

params [
	"_caller"
	,"_target"
	,"_selectionName"
	,"_className"
	,"_items"
];

private _enable = missionNamespace getVariable ["adv_aceCPR_enable",true];

//if revive is enabled execute the custom cpr action:
if ( _enable ) exitWith {
	//diagnostics:
	[_target,"custom CPR is being executed"] call adv_aceCPR_fnc_diag;

	if (local _target) exitWith {
		//cpr call:
		["adv_aceCPR_evh_CPR_local", [_caller, _target]] call CBA_fnc_localEvent;
	};

	//cpr call:
	["adv_aceCPR_evh_CPR_local", [_caller, _target], _target] call CBA_fnc_targetEvent;

	true;
};

//Calls normal ace function for a completed round of CPR 
[_caller, _target] call ace_medical_treatment_fnc_cprSuccess;

//diagnostics:
[_target, "Custom CPR action is not being executed"] call adv_aceCPR_fnc_diag;

//return:
false;
