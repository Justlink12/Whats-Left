/// @description Insert description here
// You can write your code in this editor
wait_time = 180

x = 0
y = 0
start_game = false
image_alpha = 0
loaded = false
instance_create_depth(0,0,0,obj_pause_menu)
instance_create_depth(0,0,0,obj_eyes)
letter_list = ["h","e","l","p"]
trace = 0
countdown = 60
pts = 0
in_time = 60
game_type = 0

dead_duck = 0

fade_time = 120
end_game = false

instruct = ["Press the buttons fast enough!", "Save all the ducklings!","Pick the Right Hole!","Steer the ship!","Click the button!","",""]
ears = ["User is unable to speak...", "Finding new resource target...","Target Acquired... Ears now being recycled"]
eyes = ["User is unable to speak...", "Finding new resource target...","Target Acquired... Eyes now being recycled"]
if(audio_is_playing(snd_beeping))
{
	audio_stop_sound(snd_beeping)
	
}