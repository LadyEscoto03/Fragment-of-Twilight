/// @description Insert description here
// You can write your code in this editor
time=30;
alarm[0]=time;

particle_system=part_system_create();

particle_wind=part_type_create();

part_type_shape(particle_wind,pt_shape_cloud);
part_type_size(particle_wind,1,1,0,0);
part_type_direction(particle_wind,180,180,0,0);
part_type_speed(particle_wind,1.5,2,0,0);
part_type_alpha1(particle_wind,0.02);
part_type_life(particle_wind,240,40);




particle_fog=part_type_create();

part_type_shape(particle_fog,pt_shape_cloud);
part_type_size(particle_fog,1,1,0,0);
part_type_direction(particle_fog,180,180,0,0);
part_type_speed(particle_fog,0.01,0.02,0,0);
part_type_alpha3(particle_fog,0.02,0.2,0.02);
part_type_life(particle_fog,240,40);










