// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
#macro MOVE_SPD 6


//---Player Variables---//
#macro PASSIVE_DRAIN 0.0075  //Speed at which player energy drains. Percent per Second = Passive * 60 0.0075

//--AI VARIABLES--//
#macro AI_DRAIN_1 0.1 //Initial Draw for movement
#macro AI_DRAIN_2 0.05 //Secondary draw: amnt * 30 (Least effect on battery level)
#macro AI_DRAIN_3 0.02 //Third draw: amnt * 60


//--DAY and Night Lengths--//
//--Applies this number for each one. Example-600 means day last 10 seconds, night lasts 10 seconds--//
#macro DAY_LEN 3600


//---Moon Event---//
#macro MOON_LEN 1000  //Time moon event is active
#macro MOON_AI_CHG true //Moon effect on AI battery (moon at night)
#macro MOON_AI_EX 0.01  //Moon extra charge during event
#macro MOON_PL_PASS -0.0075  //Moon's effect on player passive draining

//---Sun Event---//
#macro SUN_LEN 900  //Time flare event is active
#macro SUN_AI_CHG false //Sun effect on AI battery (Sun during Day)

//---Meteor Event---//
#macro METEOR_LEN 600  //Time meteor event is active
#macro MET_SPAWN_RATE 8 //The bigger the number, the less meteors spawned

//---Sand Storm Event---//
#macro SAND_LEN 400  //Time sand storm event is active
#macro SAND_AI_CHG false //Sand effect on AI battery (moon at night)
#macro SPD_CHANGE 0.05  //Sand effect on speed


//---Nitrogen Rain Event---//
#macro RAIN_LEN 600
#macro RAIN_PL_PASS -0.0075  //Moon's effect on player passive draining

//---Tornado Event---//
#macro TORN_LEN 900
#macro TORN_AI_CHG false //Tornado Effect on AI Battery
#macro TORN_MAX_ALPHA 0.9
#macro TORN_FADE_IN_SPD 0.005
#macro TORN_FADE_OUT_SPD 0.025
#macro TORN_SPD_CHANGE 0.1  //Sand effect on speed
#macro TORN_PL_PASS 0.015  //Tornado's effect on player passive draining


//---Volcano Event---///
#macro VOLC_LEN 900
#macro VOLC_AI_CHG false
#macro VOLC_PL_PASS 0.005


//---Lightning Event---//
#macro LIGHT_LEN 900
#macro LIGHT_CHG_PLUS 0.005
#macro LIGHT_AI_CHG false

//---Quake Event---//
#macro QUAKE_LEN 900
#macro QUAKE_CHG_PLUS -0.005
