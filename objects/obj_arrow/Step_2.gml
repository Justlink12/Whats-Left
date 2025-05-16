/// @description Insert description here
// You can write your code in this editor
var cur_charge = obj_player.energies[1]
if(cur_charge < prior_chg)
{
	image_index = 0
	
}
else if(cur_charge > prior_chg)
{
	image_index = 1
}
else
{
	image_index = 2	
}
prior_chg = obj_player.energies[1]
x = camera_get_view_x(view_camera[0]) + 170
y = camera_get_view_y(view_camera[0]) + 28