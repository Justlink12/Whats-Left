/// @description Insert description here
// You can write your code in this editor
draw_self()
var near_limb = instance_nearest(mouse_x,mouse_y,obj_limbs)
var is_over = place_meeting(mouse_x,mouse_y,near_limb)
if(is_over)
{
	near_limb.image_alpha = 0.8	
}
else
{
	near_limb.image_alpha = 1	
}