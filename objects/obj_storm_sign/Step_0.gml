/// @description Insert description here
// You can write your code in this editor
/*if(obj_weather_manager.weath_time !=0 and x > end_x)
{
	x -= 5	
}
else if(obj_weather_manager.weath_time ==0 and x < 2512)
{
	x += 5	
}*/

if(obj_weather_manager.player_react and x > end_x)
{
	x -= 5	
}
else if(!obj_weather_manager.player_react and x < 2512)
{
	x += 5	
}