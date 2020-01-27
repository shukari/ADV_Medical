# ADV ACE - CPR

This is an updated version of [ADV ACE-CPR][ADV], made compatible with the ACE medical rewrite (v1.13.0). The functionality of
certain aspects of this mod have changed slightly from pre-medical rewrite editions, as detailed below.

Mod can be downloaded here: https://steamcommunity.com/sharedfiles/filedetails/?id=1957746437

## Overview:

Giving you a second chance if your everyday CPR doesn't do squat. With ADV - ACE CPR you can finally use ACE CPR to get someone
out of the revive state without healing him completely, making gameplay much more interesting. Of course [ACE][ACE] and
[CBA][CBA] are required.

After successfully "stabilizing" the patient, he/she will have a basic pulse of at least 30bpm. Doctors have a default 40%
success rate and medics have a default 15% success rate. Regular riflemen can resuscitate a patient, but they will have a much
lower success rate. They can still keep the patient from dying due to an expired revive timer though.

The success rate is lowered if the patient looses blood or has morphine in his blood system and is raised if the patient received
epinephrine right before CPR. The minimum rate is always 2%, unless the player starts with a success probability of 0 (see
below).

Depending on your settings (`adv_aceCPR_maxTime`, see below) you might be too late to resuscitate a player solely with CPR. In that
case, the mod provides a new item: a defibrillator. The defibrillator works almost like the CPR action, but you have to have an
AED in your inventory and it's much faster and the success rate is way higher. Using the defibrillator will induce pain to all
units who stand too close to a patient when the defibrillator is used (except for the operator). By default, you can only use the
defibrillator if you're a medic.

The mod also includes the option to use stationary AEDs. You can set the stationary AED objects via CBA settings. Default is
`Land_Defibrillator_F`. You can place a stationary AED via editor or curator. Players can approach the item and use an ACE action
to activate the stationary AED. By activating it they have 12 seconds to use it on any unconscious patient in a radius of five
meters. After 12 seconds the stationary AED will deactivate again.

### Differences from original:

* In the original mod, the patient would gain a heart rate of 40bpm from the defibrillator. In this version, the patient's heart
  rate will jump to 120-140bpm instead.
* The check pulse action override provided by this mod is not active. This may change in the future.
* The `adv_aceCPR_onlyDoctors` setting can now restrict AED usage to any ace medic class. This can be adjusted in the CBA
  settings. Title and description for this setting lack translations.
  
## For mission builders:

You can set the probabilities for successful resuscitation individually depending on the value for ace_medical_medicClass a
player's unit has, or the time to be added to the revive timer or the duration during which CPR can still be applied
successfully. The easiest way to do this is via the [CBA Settings][1] provided by the mod.


[ADV]: https://github.com/Pergor/ADV_Medical/tree/master/adv_aceCPR "Original mod"
[ACE]: https://steamcommunity.com/sharedfiles/filedetails/?id=463939057
[CBA]: https://steamcommunity.com/sharedfiles/filedetails/?id=450814997&searchtext

[1]: https://github.com/CBATeam/CBA_A3/wiki/CBA-Settings-System
