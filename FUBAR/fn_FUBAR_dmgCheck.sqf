params ["_unit"];

if (isServer && !hasInterface) exitWith {};

// dawg you gotta rewrite this. this is so messy. - past andy to future andy

if (isNil {_unit getVariable "ANDY1_FUBAR_status"}) then {
    _unit setVariable ["ANDY1_FUBAR_status", "NORMAL", true];
};
if (isNil {_unit getVariable "ANDY1_FUBAR_bodyPartsHP"}) then {
    /*
    
    0 - head 
    1 - neck

    2 - chest 
    3 - abdomen
    4 - pelvis

    5 - left arm
    6 - right arm
    7 - left hand 
    8 - right hand

    9 - left leg
    10 - right leg
    11 - left foot
    12 - right foot
    */
    _unit setVariable ["ANDY1_FUBAR_bodyPartsHP", [
        [
            0, // 0 - head
            0, // 1 - neck

            0, // 2 - chest
            0, // 3 - abdomen
            0, // 4 - pelvis
            
            0, // 5 - left arm
            0, // 6 - right arm
            0, // 7 - left hand
            0, // 8 - right hand

            0, // 9 - left leg
            0, // 10 - right leg
            0, // 11 - left foot
            0  // 12 - right foot
        ]
    ], true];
};

{
    if (_x == 1) exitWith {
        _unit setVariable ["ANDY1_FUBAR_status", "FUBAR", true];
    };
    if (_x > 0.5) then {
        _unit setVariable ["ANDY1_FUBAR_status", "CRITICAL", true];
    };
} forEach (_unit getVariable "ANDY1_FUBAR_bodyPartsHP");

_ANDY1_fnc_setDamage = {
    params ["_unit"];
    switch (_unit getVariable "ANDY1_FUBAR_status") do {
        case "FUBAR": {
            _unit spawn {
                //i guess that's it for you
                sleep 3;
                _this setDamage 1;
            };
        };
        case "CRITICAL": {
            _unit setDamage 0.95;
        };
        case "SEVERE": {
            _unit setDamage 0.9;
        };
        case "SERIOUS": {
            _unit setDamage 0.8;
        };
        case "MODERATE": {
            _unit setDamage 0.6;
        };
        case "MINOR": {
            _unit setDamage 0.3;
        };
        case "NORMAL": {
            _unit setDamage 0;
        };
    };
};

/*if (damage _unit >= 0.95) exitWith {
    _unit setVariable ["ANDY1_FUBAR_status", "FUBAR", true];
    _unit call _ANDY1_fnc_setDamage;
};
if (damage _unit >= 0.9) exitWith {
    _unit setVariable ["ANDY1_FUBAR_status", "CRITICAL", true];
    _unit call _ANDY1_fnc_setDamage;
};
if (damage _unit >= 0.8) exitWith {
    _unit setVariable ["ANDY1_FUBAR_status", "SEVERE", true];
    _unit call _ANDY1_fnc_setDamage;
};
if (damage _unit >= 0.6) exitWith {
    _unit setVariable ["ANDY1_FUBAR_status", "SERIOUS", true];
    _unit call _ANDY1_fnc_setDamage;
};
if (damage _unit >= 0.3) exitWith {
    _unit setVariable ["ANDY1_FUBAR_status", "MODERATE", true];
    _unit call _ANDY1_fnc_setDamage;
};
if (damage _unit >= 0.1) exitWith {
    _unit setVariable ["ANDY1_FUBAR_status", "MINOR", true];
    _unit call _ANDY1_fnc_setDamage;
};
if (damage _unit == 0) exitWith {
    _unit setVariable ["ANDY1_FUBAR_status", "NORMAL", true];
    _unit call _ANDY1_fnc_setDamage;
};*/