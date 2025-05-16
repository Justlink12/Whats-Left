/// @description Insert description here
// You can write your code in this editor
if(image_index == life_time)
{
	instance_destroy()	
}
var rand_play = irandom_range(0,2000)
if(rand_play == 20)
{
	audio_play_sound(snd_meteor,1,0)
}