/// @description Insert description here
// You can write your code in this editor
var _isHit = box_game(obj_circle_hole)

if(position_meeting(mouse_x,mouse_y,obj_circle) && mouse_check_button_pressed(mb_left))
{
	withMouse = !withMouse
}
/*if(mouse_check_button_pressed(mb_left) && withMouse)
{
	withMouse = false
}*/

if(withMouse)
{
	x = mouse_x
	y = mouse_y
}

if(_isHit)
{
	obj_quick_bg.trace++
	instance_destroy()	
}