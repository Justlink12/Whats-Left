{
	
	draw_self();
	draw_set_font(menu_font);
	
	if(image_index == 0){
		draw_set_color(c_black);
	}else {
		draw_set_color(c_white);
	}
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_text(x,y, text);
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	image_xscale = 2
	image_yscale = 2
}