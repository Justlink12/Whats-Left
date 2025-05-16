/// @description Insert description here
// You can write your code in this editor
if(obj_player.auto_walk)
{
	image_blend = c_lime
	on_off = "On"
}
else
{
	image_blend = c_red
	on_off = "Off"
}
x = camera_get_view_x(view_camera[0]) + 210
y = camera_get_view_y(view_camera[0]) + 170