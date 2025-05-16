/// @description Insert description here
// You can write your code in this editor
cur_front = obj_place_hold
weather_quote = ""

randomize()
weath_evnt = false
weath_time = 0
dust_alp = 1
player_react = false

//----Meteor Shower---///
meteor = false
meteor_spawn_time = 0

//----Moon---//
moon = false
moon_alpha = 0
moon_end_x = 1430
moon_end_y = 280

//----Sun---//
sun = false
//moon_alpha = 0
sun_end_x = 1430
sun_end_y = 280

//---Earthquake---//
quake = false
global.P_System_6 = part_system_create_layer("Particles_Fwd", false);
//------------------------------------------------------//
global.Quake = part_type_create();

global.QuakeEmit = part_emitter_create(global.P_System_6)
part_emitter_region(global.P_System_6, global.QuakeEmit,-10,-10,0,1000,ps_shape_line,ps_distr_linear)
//part_emitter_stream(global.P_System, global.Emit,global.Dust,10)
// This defines the particle's shape
part_type_shape(global.Quake,pt_shape_pixel);
//part_type_scale(global.Dust,1,10)

// This is for the size
part_type_size(global.Quake,4,5,0,2);

// This sets its colour. There are three different codes for this
part_type_color1(global.Quake,c_maroon);

// This is its alpha. There are three different codes for this
part_type_alpha1(global.Quake,1);

// The particles speed
part_type_speed(global.Quake,2,6,0.2,2);

// The direction
part_type_direction(global.Quake,80,100,1,20);

// This changes the rotation of the particle
part_type_orientation(global.Quake,32,145,1,1,true);

// This is the blend mode, either additive or normal
part_type_blend(global.Quake,1);

// This is its lifespan in steps
part_type_life(global.Quake,2,5);


//----SAND STORM---//
sand = false
global.P_System = part_system_create_layer("Particles_Fwd", false);
//------------------------------------------------------//
global.Dust = part_type_create();

global.Emit = part_emitter_create(global.P_System)
part_emitter_region(global.P_System, global.Emit,-10,-10,0,1000,ps_shape_line,ps_distr_linear)
//part_emitter_stream(global.P_System, global.Emit,global.Dust,10)
// This defines the particle's shape
part_type_shape(global.Dust,pt_shape_pixel);
//part_type_scale(global.Dust,1,10)

// This is for the size
part_type_size(global.Dust,2,2,0,2);

// This sets its colour. There are three different codes for this
part_type_color1(global.Dust,c_orange);

// This is its alpha. There are three different codes for this
part_type_alpha1(global.Dust,1);

// The particles speed
part_type_speed(global.Dust,5,20,0.2,2);

// The direction
part_type_direction(global.Dust,-2,2,0,20);

// This changes the rotation of the particle
part_type_orientation(global.Dust,32,145,1,1,true);

// This is the blend mode, either additive or normal
part_type_blend(global.Dust,1);

// This is its lifespan in steps
part_type_life(global.Dust,220,290);



//-----------------------RAIN-------------------------------------------//
rain = false
rain_alp = 0
global.P_System_2 = part_system_create_layer("Particles_Fwd", false);
//------------------------------------------------------//
global.Rain = part_type_create();

global.RainEmit = part_emitter_create(global.P_System_2)
part_emitter_region(global.P_System_2, global.RainEmit,-10,2010,-5,-1,ps_shape_line,ps_distr_linear)
//part_emitter_stream(global.P_System, global.Emit,global.Dust,10)
// This defines the particle's shape
part_type_shape(global.Rain,pt_shape_line);
//part_type_scale(global.Dust,1,10)

// This is for the size
part_type_size(global.Rain,0.05,0.3,0,0.01);

// This sets its colour. There are three different codes for this
part_type_color1(global.Rain,c_red);

// This is its alpha. There are three different codes for this
part_type_alpha1(global.Rain,0.75);

// The particles speed
part_type_speed(global.Rain,5,20,0.2,2);

// The direction
part_type_direction(global.Rain,-82,-78,0,1);

// This changes the rotation of the particle
part_type_orientation(global.Rain,180,180,0,0,true);

// This is the blend mode, either additive or normal
part_type_blend(global.Rain,1);

// This is its lifespan in steps
part_type_life(global.Rain,35,45);
//------------------------//
global.RainHit = part_type_create();

global.HitEmit = part_emitter_create(global.P_System_2)
part_emitter_region(global.P_System_2, global.HitEmit,-200,2010,600,1002,ps_shape_line,ps_distr_linear)
//part_emitter_stream(global.P_System, global.Emit,global.Dust,10)
// This defines the particle's shape
part_type_shape(global.RainHit,pt_shape_cloud);
//part_type_scale(global.Dust,1,10)

// This is for the size
part_type_size(global.RainHit,0.03,0.2,0,0.01);

// This sets its colour. There are three different codes for this
part_type_color1(global.RainHit,c_red);

// This is its alpha. There are three different codes for this
part_type_alpha1(global.RainHit,0.8);

// The particles speed
part_type_speed(global.RainHit,0.1,2,0.2,2);

// The direction
part_type_direction(global.RainHit,82,78,2,1);

// This changes the rotation of the particle
part_type_orientation(global.RainHit,-180,180,0,0,true);

// This is the blend mode, either additive or normal
part_type_blend(global.RainHit,1);

// This is its lifespan in steps
part_type_life(global.RainHit,4,7);


//---Tornado---//
tornado = false
torn_alp = 0
global.P_System_3 = part_system_create_layer("Instances_1", false);
//------------------------------------------------------//
global.Torna = part_type_create();

global.TornEmit = part_emitter_create(global.P_System_3)
part_emitter_region(global.P_System_3, global.TornEmit,10,900,640,645,ps_shape_line,ps_distr_invgaussian)
//part_emitter_stream(global.P_System, global.Emit,global.Dust,10)
// This defines the particle's shape
part_type_shape(global.Torna,pt_shape_pixel);
//part_type_scale(global.Dust,1,10)

// This is for the size
part_type_size(global.Torna,3,4,0.01,0.01);

// This sets its colour. There are three different codes for this
part_type_color1(global.Torna,c_maroon);

// This is its alpha. There are three different codes for this
part_type_alpha1(global.Torna,1);

// The particles speed
part_type_speed(global.Torna,5,10,0.2,2);

// The direction
part_type_direction(global.Torna,-60,-120,90,10);

// This changes the rotation of the particle
part_type_orientation(global.Torna,180,180,0,1,true);

// This is the blend mode, either additive or normal
part_type_blend(global.Torna,1);

// This is its lifespan in steps
part_type_life(global.Torna,20,30);
//------------------------//

global.Dust2 = part_type_create();
part_type_shape(global.Dust2,pt_shape_pixel);
//part_type_scale(global.Dust,1,10)

// This is for the size
part_type_size(global.Dust2,1,8,0,2);

// This sets its colour. There are three different codes for this
part_type_color1(global.Dust2,c_red);

// This is its alpha. There are three different codes for this
part_type_alpha1(global.Dust2,1);

// The particles speed
part_type_speed(global.Dust2,12,22,0.2,4);

// The direction
part_type_direction(global.Dust2,-20,-10,0.25,10);

// This changes the rotation of the particle
part_type_orientation(global.Dust2,32,145,1,1,true);

// This is the blend mode, either additive or normal
part_type_blend(global.Dust2,1);

// This is its lifespan in steps
part_type_life(global.Dust2,220,290);


///-----Volcano-----////
volcano = false
smoke_alp = 0
global.P_System_4 = part_system_create_layer("Instances_2", false);
//------------------------------------------------------//
global.Volc = part_type_create();

global.VolcEmit = part_emitter_create(global.P_System_4)
part_emitter_region(global.P_System_4, global.VolcEmit,10,900,640,645,ps_shape_line,ps_distr_invgaussian)
//part_emitter_stream(global.P_System, global.Emit,global.Dust,10)
// This defines the particle's shape
part_type_shape(global.Volc,pt_shape_cloud);
//part_type_scale(global.Dust,1,10)

// This is for the size
part_type_size(global.Volc,1,2,0.01,0.01);

// This sets its colour. There are three different codes for this
part_type_color1(global.Volc,c_dkgray);

// This is its alpha. There are three different codes for this
part_type_alpha1(global.Volc,0);

// The particles speed
part_type_speed(global.Volc,0.55,1.2,0.08,1);

// The direction
part_type_direction(global.Volc,80,100,-0.5,3);

// This changes the rotation of the particle
part_type_orientation(global.Volc,180,180,0,1,true);

// This is the blend mode, either additive or normal
part_type_blend(global.Volc,0);

// This is its lifespan in steps
part_type_life(global.Volc,120,160);
//------------------------//


//---Lightning---//
///-----Volcano-----////
light = false
cloud_alp = 0
global.P_System_5 = part_system_create_layer("Instances_1", false);
//------------------------------------------------------//
global.Light = part_type_create();

global.LightEmit = part_emitter_create(global.P_System_5)
//part_emitter_region(global.P_System_5, global.LightEmit,10,900,640,645,ps_shape_line,ps_distr_invgaussian)
//part_emitter_stream(global.P_System, global.Emit,global.Dust,10)
// This defines the particle's shape
part_type_shape(global.Light,pt_shape_spark);
//part_type_scale(global.Dust,1,10)

// This is for the size
part_type_size(global.Light,0.1,0.5,-0.05,0.01);

// This sets its colour. There are three different codes for this
part_type_color1(global.Light,c_white);

// This is its alpha. There are three different codes for this
part_type_alpha1(global.Light,1);

// The particles speed
part_type_speed(global.Light,0.55,1.2,0.08,1);

// The direction
part_type_direction(global.Light,60,120,0,2);

// This changes the rotation of the particle
part_type_orientation(global.Light,180,180,0,1,true);

// This is the blend mode, either additive or normal
part_type_blend(global.Light,0);

// This is its lifespan in steps
part_type_life(global.Light,1,15);
//------------------------//


