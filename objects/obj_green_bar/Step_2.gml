/// @description Insert description here
// You can write your code in this editor
x = camera_get_view_x(view_camera[0]) + scr_x
y = camera_get_view_y(view_camera[0]) + scr_y
image_yscale = obj_player.energies[rep]/125
if(image_yscale > 1.25)
{
	image_yscale = 1.25
}