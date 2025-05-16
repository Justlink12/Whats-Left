/// @description Insert description here
// You can write your code in this editor
depth = -501
if(is_exo)
{
	obj_shin_fwd.sprite_index = exo_sprite
	obj_thigh_fwd.sprite_index = spr_exoleg_upper
}
if(obj_shin_fwd.sprite_index == exo_sprite)
{
	instance_destroy()	
}