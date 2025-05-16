/// @description Insert description here
// You can write your code in this editor
draw_self()
percent = (obj_player.energies[rep]/125)*100

/*if(rep == 0)
{
	if(obj_player.is_anim && obj_player.pl_click)
	{
		var consumpt = (obj_player.tot_play_draw + PASSIVE_DRAIN) * 10
	}
	else
	{
		var consumpt = PASSIVE_DRAIN * 10
	}
	draw_text_color(x+text_x,y+text_y+20,string_format(consumpt,2,3)+"%",c_black,c_black,c_black,c_black,1)	
}*/

//draw_text(x-13,y+20,string_format(percent,2,0)+"%")
if(percent < type)
{
	draw_text_color(x+text_x,y+text_y,string_format(percent,2,0)+"%",c_maroon,c_maroon,c_maroon,c_maroon,1)
}
else
{
	draw_text_color(x+text_x,y+text_y,string_format(percent,2,0)+"%",c_black,c_black,c_black,c_black,1)
}

