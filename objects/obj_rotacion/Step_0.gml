/// @description Insert description here
// You can write your code in this editor

if(object_exists(obj_player)){
	camera_set_view_angle(view_camera[0], angle);
	angle+=0.1;
}else if(object_exists(obj_player)){
	camera_set_view_angle(view_camera[1], angle);
	angle+=0.1;
}
