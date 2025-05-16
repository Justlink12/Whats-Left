/// @description Insert description here
// You can write your code in this editor
var _mx = mouse_x
var _my = mouse_y

if obj_quick_bg.loaded
{
	image_alpha = 1	
}

if(mouse_x >= 0 && mouse_x < 400)
{
	x = 0 - 50	
}else if(mouse_x >=400 && mouse_x <=800)
{
	x = 0 - 25
}else if(mouse_x >800 && mouse_x <=1200)
{
	x = 0
}else if(mouse_x >1200 && mouse_x <=1600)
{
	x = 0 + 25
}
else
{
	x = 0 + 50	
}

if(mouse_y >= 0 && mouse_y < 200)
{
	y = 0 - 50	
}else if(mouse_y >= 200 && mouse_y <= 400)
{
	y = 0 - 25
}else if(mouse_y > 400 && mouse_y <= 600)
{
	y = 0
}else if(mouse_y > 600 && mouse_y <= 800)
{
	y = 0 + 25
}
else
{
	y = 0 + 50	
}