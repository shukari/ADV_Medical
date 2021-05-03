/*
ADV_aceCPR_fnc_getBloodLoss - by Belbo
*/

params ["_caller", "_target"];

//Blood loss of all unbandaged, untourniquetted wounds
private _totalBloodLoss = (_target getVariable ["ace_medical_woundBleeding", 0]);


//diagnostics:
[_caller,format ["the patient has a bloodloss of %1",_totalBloodLoss]] call adv_aceCPR_fnc_diag;

//return
_totalBloodLoss;