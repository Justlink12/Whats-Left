/// @description Insert description here
// You can write your code in this editor
var last_x = x
x = mouse_x
y = mouse_y

if(last_x < x)
{
	image_xscale = -1
}
if(last_x > x)
{
	image_xscale = 1	
}
depth = -601