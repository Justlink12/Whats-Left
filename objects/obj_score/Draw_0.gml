/// @description Insert description here
// You can write your code in this editor
draw_self()
if(room == Room4)
{
	draw_set_font(quote_font)
	draw_set_color(c_white)
	draw_text(100,20,"Now, I'll never know if I made it...")
	draw_text(800,20,"Distance Travelled: "+string(dist))
	draw_text(800,60,"Days: "+string(days))
	draw_text(100,80,"Credits: \n Made for Game Programming CSCI 280 \n Will Pariseau \n Kate Lambert \n Marco Casco \n Lara Rohkohl")
	draw_set_color(c_black)
}
