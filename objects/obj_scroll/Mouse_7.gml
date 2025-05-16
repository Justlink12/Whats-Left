/// @description Insert description here
// You can write your code in this editor
cur += dir
if(cur >= array_length(sprites))
{
	cur = 0	
}
if(cur == -1)
{
	cur = array_length(sprites)-1
}