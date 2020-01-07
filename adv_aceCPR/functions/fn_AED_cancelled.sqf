/*
	Author: pike713

	Description:
	Callback for handling cancellation of the AED action.

	Parameters:
	PARAMS

	Returns:
	NONE
*/

params [
	"_caller"
];

if (!isNil {_caller getVariable ["adv_aceCPR_var_soundHandle", nil]}) then {
	private _handle = _caller getVariable ["adv_aceCPR_var_soundHandle", nil];

	if (!isNil "_handle") then {
		terminate _handle;
		_caller setVariable ["adv_aceCPR_var_soundplayed", false];
		_caller setVariable ["adv_aceCPR_var_soundHandle", nil];
	};
};
