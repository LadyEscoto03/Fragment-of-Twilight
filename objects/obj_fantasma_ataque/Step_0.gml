/// @description Insert description here
// You can write your code in this editor

if(instance_exists(obj_player_noche)){
	objeto=obj_player_noche;
}else if(instance_exists(obj_player)){
	objeto=obj_player;
}
speed=2;
direction+=2.1*sign(angle_difference(point_direction(x,y,objeto.x,objeto.y),direction));
image_angle=direction;

if(place_meeting(x,y,obj_paredInvisible)){
	instance_destroy();
}
scr_espadaAtaque();