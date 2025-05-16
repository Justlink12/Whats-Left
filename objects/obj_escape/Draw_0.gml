/// @description Insert description here
// You can write your code in this editor
draw_self()
{
	draw_set_font(ui_font)
	draw_text(x,y-20, "Pause Menu")	
	draw_set_font(def_font)
}

if((!obj_weather_manager.player_react && !instance_exists(obj_limb_menu))&& (!obj_player.anim_cam_in and !obj_player.anim_cam_out))
{
	image_blend = c_white
}
else
{
	image_blend = c_gray	
}