/*
ADV_aceCPR_fnc_canCPR - by Belbo

Determines if CPR has the ability to be successful
*/


params [
	["_target", objNull, [objNull]]
];

private _inCardiac = _target getVariable ["ace_medical_inCardiacArrest",false];

//rewritten to make the use cases easily distinguishable
//Dead 
if (!alive _target) exitWith { false };

//In cardiac 
if (_inCardiac) exitWith {
	private _startTime = _target getVariable ["adv_aceCPR_cardiacArrestStart", CBA_missionTime];
	private _cprMaxTime = missionNamespace getVariable ["adv_aceCPR_maxTime", 900];

	CBA_missionTime < _startTime + _cprMaxTime;
};

// Awake or unconscious with heartrate
true

