/// @description Insert description here
// You can write your code in this edi
is_anim = false
anim_timer = 60
need_ai_key = 0
window_set_fullscreen(true)
switch_key = true
can_charge = true

cur_weath = false

auto_walk = false

fwd_leg = 0
bck_leg = 0
fwd_arm = 0
bck_arm = 0
fwd_thigh =0
bck_thigh = 0
fwd_shin = 0
bck_shin = 0
torso = 0
head = 0
body_parts = [fwd_thigh,bck_thigh,fwd_shin,bck_shin,fwd_arm,bck_arm,torso,head]
body_x = [1792,1792,1794,1794,1788,1788,1792,1794]
body_y = [768,768,723,723,802,802,746,713]
bob_height = 5
isit = true
extra_chrg = 0
less_chrg = 0

spd_adjust = 0

play_energy = 125
play_draw = [0.1,0.075,0.015]
tot_play_draw = play_draw[0]+play_draw[1]+play_draw[2]
pl_click = false

ai_energy = 125
ai_draw = [AI_DRAIN_1, AI_DRAIN_2, AI_DRAIN_3]
total_draw = ai_draw[0]+ai_draw[1]*30+ai_draw[2]*30

energies = [play_energy,ai_energy]

cur_en = 0
cur_draw = play_draw

cur_drop = 0
can_move = true


ai_charge_time = 0
do_charge = true
charge_downtime = 180
charge_reset = true

dist_trav = 0

scrn_size_x = 1366
scrn_size_y =768

cam_x = 634
cam_y = 232

accum = cam_x
accum_y = cam_y
cam_lock = false

anim_cam_out = false
anim_cam_in = false
if(obj_score.rep)
{
	instance_create_depth(0,0,-1000,obj_start_cover)
}