/// @description Insert description here
// You can write your code in this editor

x+=NumVX;

if not (place_free(x,y)){
	instance_destroy();
}
if(place_meeting(x,y,obj_hongo)){
	instance_destroy();
}
if(place_meeting(x,y,obj_jefe_bosque)){
	instance_destroy();
}