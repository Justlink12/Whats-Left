/// @description Insert description here
// You can write your code in this editor
if(position_meeting(mouse_x,mouse_y,obj_eject) && mouse_check_button_released(mb_left))
{
	obj_quick_bg.end_game = true
	audio_play_sound(snd_buttonClick,2,false)
}