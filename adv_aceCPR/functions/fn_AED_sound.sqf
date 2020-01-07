/*
ADV-aceCPR - by Belbo
*/

(_this select 0) params [
	"_caller"
	,"_target"
	,"_selectionName"
	,"_className"
	,"_items"
];

_target setVariable ["ace_medical_CPR_provider", _caller, true];
_caller setVariable ["adv_aceCPR_var_soundHandle", (_this select 0) spawn {
	params [
		"_caller"
		,"_target"
		,"_selectionName"
		,"_className"
		,"_items"
	];
	sleep 5.4;
	playsound3d ["adv_aceCPR\ui\defib.ogg", _caller,false,getPosASL _caller,8,1,15];
	_caller setVariable ["adv_aceCPR_var_soundHandle", nil];
}];
