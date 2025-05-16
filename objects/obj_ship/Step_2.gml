/// @description Insert description here
// You can write your code in this editor
if(place_meeting(x,y,obj_obstacle) or place_meeting(x,y,obj_what))
{
	sprite_index = spr_explosion
	if(!audio_is_playing(snd_explode))
	{
		audio_play_sound(snd_explode,2,0)
	}
	obj_quick_bg.end_game = true
}

