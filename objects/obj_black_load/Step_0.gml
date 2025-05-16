/// @description Insert description here
// You can write your code in this editor
//show_debug_message(string(depth))
depth = -601
if(instance_exists(obj_quick_bg) && !fade_out)
{
	if(image_alpha <= 1 && !obj_quick_bg.loaded)
	{
		image_alpha += 0.05
	}

	if(image_alpha == 1 && !obj_quick_bg.loaded)
	{
		obj_quick_bg.loaded = true
	}

	if(image_alpha >= 0 && obj_quick_bg.loaded && !fade_out)
	{
		image_alpha -=0.05
	}
}

if(image_alpha < 1 && fade_out && instance_exists(obj_quick_bg))
{
	image_alpha += 0.05
	if(audio_is_playing(snd_beeping) && audio_sound_get_gain(snd_beeping)>=0.15)
	{
		audio_sound_gain(snd_beeping,0,1000)
		
	}
	if(image_alpha >= 1)
	{
		finish_it = true
		
	}
}

if(image_alpha > 0 && finish_it && fade_out)
{
	if(instance_exists(obj_quick_bg))
	{
		instance_destroy(obj_eyes)
		instance_destroy(obj_iris)
		instance_destroy(obj_quick_bg)
	}
	image_alpha -= 0.05
}

if(image_alpha <=0 && fade_out && !instance_exists(obj_quick_bg))
{
	instance_destroy(obj_pause_menu)
	instance_destroy()
}

