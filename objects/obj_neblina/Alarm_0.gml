/// @description Insert description here
// You can write your code in this editor
alarm_set(0,time);

var camera_x=camera_get_view_x(view_camera[0]);
var camera_y=camera_get_view_y(view_camera[0]);

var camera_w=camera_get_view_width(view_camera[0]);
var camera_h=camera_get_view_height(view_camera[0]);


repeat(50){
	var randomY=irandom_range(0,camera_h);
	
	var randomX=random_range(0,camera_w);
	
	part_particles_create(particle_system,camera_x+randomX,camera_y+camera_h-randomY,particle_fog,1);

}



