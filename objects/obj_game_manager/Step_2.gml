/// @description Insert description here
// You can write your code in this editor
text_x = camera_get_view_x(view_camera[0]) + camera_get_view_width(view_camera[0])/2 - 64
text_y = camera_get_view_y(view_camera[0]) + 30

if(game_over)
{
	room_goto(Room4)	
}
