/// @description Insert description here
// You can write your code in this editor
lluvia_sys=part_system_create();

// tipo de partículas
partRain=part_type_create();
part_system_depth(lluvia_sys,-150);
part_type_shape(partRain,pt_shape_line);
part_type_size(partRain,0.2,0.3,0,0);
part_type_color2(partRain,c_teal,c_white);
part_type_alpha2(partRain,.5,.1);
part_type_gravity(partRain,0.1,290);
part_type_speed(partRain,0.5,0.5,0,0);
part_type_direction(partRain,250,330,0,1);
part_type_orientation(partRain,290,290,0, 0, 0);
part_type_life(partRain,20,room_height);



//emisor 
partRain_emisor=part_emitter_create(lluvia_sys);
part_emitter_region(lluvia_sys,partRain_emisor,0,room_width,0,0, ps_shape_line,ps_distr_linear);
part_emitter_stream(lluvia_sys,partRain_emisor,partRain,5);
