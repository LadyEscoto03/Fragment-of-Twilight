/// @description Insert description here
// You can write your code in this editor

speed=2;
direction+=2.1*sign(angle_difference(point_direction(x,y,obj_player_noche.x,obj_player_noche.y),direction));
image_angle=direction;

if(place_meeting(x,y,obj_paredInvisible)){
	instance_destroy();
}