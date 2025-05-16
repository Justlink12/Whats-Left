/// @description Insert description here
// You can write your code in this editor
if(image_alpha != 1)
{
	image_alpha += 0.1	
}

if(place_meeting(x,y,obj_duck_mom) && !drown)
{
	obj_quick_bg.countdown = 120
	obj_quick_bg.trace += 1
	audio_play_sound(snd_quack,1,false)
	instance_destroy(obj_red_1)
	instance_destroy()	
}