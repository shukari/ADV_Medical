/*
ADV_aceCPR_fnc_probability - by Belbo
*/

params ["_caller", "_target"];

//probability for custom cpr success:
private _medicLevel = _caller getVariable ["ace_medical_medicClass", getNumber (configFile >> "CfgVehicles" >> typeOf _caller >> "attendant")];
private _probabilities = missionNamespace getVariable ["adv_aceCPR_probabilities", [40,15,5,85]];

//backwards compatibility:
private _onlyDoctors = missionNamespace getVariable ["adv_aceCPR_onlyDoctors", 0];
if ( _onlyDoctors isEqualType true ) then {
	_onlyDoctors = if (_onlyDoctors) then {2} else {0};
};
if ( (_onlyDoctors isEqualTo 2 && _medicLevel < 2) || (_onlyDoctors > 0 && _medicLevel < 1)) exitWith {0};

//probability depends on medicClass of _caller:
private _probability = call {
	if ( _medicLevel isEqualTo 2 ) exitWith { _probabilities select 0 };
	if ( _medicLevel isEqualTo 1 ) exitWith { _probabilities select 1 };
	_probabilities select 2
};

//diagnostics
[_caller,format ["probability started at %1, with a adv_aceCPR_probabilities of %2",_probability, _probabilities]] call adv_aceCPR_fnc_diag;

//exit if probability has been set to 0:
if ( _probability isEqualTo 0 ) exitWith {0};

//if patient has morphine or epinephrine in his circulation, the probability changes depending on amount of medication in system:
(_target call adv_aceCPR_fnc_getMedications) params [
	"_gotMorphine",
	"_gotEpi",
	"_gotAdenosine"
];

private _reduction = _gotMorphine + _gotAdenosine;
if ( _reduction > 0 ) then {
	private _probabilityGain = 10*_reduction;
	_probability = _probability - (round _probabilityGain);
	
	//diagnostics:
	[_caller,format ["probability has been reduced by %1 due to morphine. New probability is %2",_probabilityGain,_probability]] call adv_aceCPR_fnc_diag;
};

if ( _gotEpi > 0 ) then {
	private _probabilityGain = 20*_gotEpi;
	_probability = _probability + (round _probabilityGain);
	
	//diagnostics:
	[_caller,format ["probability has been raised by %1 due to epinephrine. New probability is %2",_probabilityGain,_probability]] call adv_aceCPR_fnc_diag;
};

//reduces probability depending on total blood loss of patient:
private _bloodLoss = [_caller, _target] call adv_aceCPR_fnc_getBloodLoss;
call {
	if (_bloodLoss >= 0.3) exitWith {
		private _probabilityLoss = 10 + (floor random 15);
		_probability = _probability - _probabilityLoss;
	};
	if (_bloodLoss >= 0.15) exitWith {
		private _probabilityLoss = 5 + (floor random 8);
		_probability = _probability - _probabilityLoss;	
	};
};

//diagnostics:
[_caller,format ["probability has been reduced by %1 due to blood loss. New probability is %2",_probabilityLoss,_probability]] call adv_aceCPR_fnc_diag;

//and let at least a chance of 2%...:
if ( _probability < 1 ) then {
	_probability = 2;
};

_probability;
