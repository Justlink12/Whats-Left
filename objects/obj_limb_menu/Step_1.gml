/// @description Insert description here
// You can write your code in this editor
if((alp_num!=1 or set_destroy) && !instance_exists(obj_quick_bg))
{
	alp_num = limb_checker(obj_limb_head,x,y,-501, alp_num, set_destroy,false,1)
	limb_checker(obj_limb_arm_left,x,y,-501, alp_num, set_destroy,false,-1)
	limb_checker(obj_limb_arm_right,x,y,-501, alp_num, set_destroy,false,-1)
	limb_checker(obj_limb_leg_left,x,y,-501, alp_num, set_destroy,false,-1)
	limb_checker(obj_limb_leg_right,x,y,-501, alp_num, set_destroy,false,-1)
	limb_checker(obj_limb_torso,x,y,-501, alp_num, set_destroy, true,-1)
}
/*if(!instance_exists(obj_limb_torso))
{
	instance_destroy()	
}


/*if(!instance_exists(obj_limb_head)){
	//show_debug_message("wut")
	instance_create_depth(x,y,-499,obj_limb_head)
	show_debug_message("huh")
	obj_limb_head.image_alpha = 1
	obj_weather_manager.player_react = true
}

if(set_destroy && image_alpha <= 0)
{
	instance_destroy(obj_limb_head)
	instance_destroy()
}

if(set_destroy)
{
	image_alpha -= 0.1	
}

if(!set_destroy && (image_alpha < 1))
{
	image_alpha += 0.1
}