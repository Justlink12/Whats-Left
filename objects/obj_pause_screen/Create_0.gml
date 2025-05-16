/// @description Insert description here
// You can write your code in this editor
x = camera_get_view_x(view_camera[0])
y = camera_get_view_y(view_camera[0])
depth = -900
instance_create_depth(x+600,y+600,-901,obj_main_quit_button)
instance_create_depth(x+200,y+200,-901,obj_resume_button)
instance_create_depth(x+400,y+400,-901,obj_main_button)