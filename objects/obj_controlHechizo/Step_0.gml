/// @description Insert description here
// You can write your code in this editor



if(timer--<=60){
	instance_create_layer(x,y,"Instances",obj_lanzamientoNatural)
	
	timer=90;
}

image_angle=point_direction(x,y,obj_player.x,obj_player.y);


if(global.time--<=0){
	instance_destroy();
	
}