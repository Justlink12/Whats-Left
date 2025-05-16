/// @description Insert description here
// You can write your code in this editor
draw_self()
if(obj_game_manager.game_type == 6 && obj_quick_bg.start_game)
{
	draw_set_font(quote_font)
	draw_set_halign(fa_center)
	if(!instance_exists(obj_black_1))
	{
		instance_create_depth(700,300,-501,obj_black_1)
	}
	draw_set_color(c_white)
	draw_text(1000,300,obj_quick_bg.eyes[obj_quick_bg.trace])
	draw_set_halign(fa_left)
	draw_set_color(c_black)
}
if(obj_game_manager.game_type == 5 && obj_quick_bg.start_game)
{
	draw_set_font(quote_font)
	draw_set_halign(fa_center)
	if(!instance_exists(obj_black_1))
	{
		instance_create_depth(700,300,-501,obj_black_1)
	}
	draw_set_color(c_white)
	draw_text(1000,300,obj_quick_bg.ears[obj_quick_bg.trace])
	draw_set_halign(fa_left)
	draw_set_color(c_black)
}