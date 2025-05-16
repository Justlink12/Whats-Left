/// @description Insert description here
// You can write your code in this editor
if(obj_player.can_charge && (obj_game_manager.cur_cyc != 1 or obj_weather_manager.moon) && obj_player.charge_downtime==180)
{
	sprite_index = spr_charge
	on_off = "On"
}
else
{
	sprite_index = spr_x
	on_off = "Off"
}
x = camera_get_view_x(view_camera[0]) + 210
y = camera_get_view_y(view_camera[0]) + 75