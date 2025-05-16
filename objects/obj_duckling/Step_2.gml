/// @description Insert description here
// You can write your code in this editor

if(drown)
{
	sprite_index = splash_spr
	
}
if(sprite_index == splash_spr && image_index == 2)
{
	audio_play_sound(snd_quack,1,false)
	instance_destroy(obj_red_1)
	instance_destroy()	
}

if(!instance_exists(obj_quick_bg))
{
	instance_destroy()
}