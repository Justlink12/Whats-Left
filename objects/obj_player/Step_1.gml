/// @description Insert description here
// You can write your code in this editor
if isit
{
	if(instance_exists(obj_main_button) && !instance_exists(obj_pause_screen))
	{
		instance_destroy(obj_main_button)	
	}
	if(instance_exists(obj_main_quit_button) && !instance_exists(obj_pause_screen))
	{
		instance_destroy(obj_main_quit_button)	
	}
	if(obj_score.rep && !audio_is_playing(snd_safe))
	{
		audio_play_sound(snd_safe,0,0)
		audio_play_sound(snd_sad,0,0)
	}
	fwd_arm = instance_nearest(0,0,obj_arm_fwd)
	bck_arm = instance_nearest(0,0,obj_arm_back)
	fwd_thigh = instance_nearest(0,0,obj_thigh_fwd)
	bck_thigh = instance_nearest(0,0,obj_thigh_back)
	fwd_shin = instance_nearest(0,0,obj_shin_fwd)
	bck_shin = instance_nearest(0,0,obj_shin_back)
	
	torso = instance_nearest(0,0,obj_body)
	head = instance_nearest(0,0,obj_head)
	body_parts = [fwd_thigh, bck_thigh, fwd_arm, bck_arm, fwd_shin, bck_shin, torso, head]
	isit = false
	camera_set_view_pos(view_camera[0],634,232)
	camera_set_view_size(view_camera[0],1366,768)
}

if(audio_is_playing(snd_sad) && !audio_is_playing(snd_safe) && !audio_is_playing(snd_explode) && obj_score.rep)
{
	audio_sound_gain(snd_sad,0,800)
	audio_stop_sound(snd_safe)
	audio_play_sound(snd_explode,0,0)
	obj_score.rep = false
}
if(!obj_score.rep && !audio_is_playing(snd_explode) && instance_exists(obj_start_cover))
{
	obj_start_cover.image_alpha -= 0.1	
	if(obj_start_cover.image_alpha <= 0)
	{
		instance_destroy(obj_start_cover)	
	}
}


//bck_leg.x -= 40