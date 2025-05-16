// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function box_game(_needBox){
	
	if(place_meeting(x,y,_needBox))
	{
		instance_destroy(_needBox)
		audio_play_sound(snd_confetti,2,0)
		return true
	}
	
	return false
	
}