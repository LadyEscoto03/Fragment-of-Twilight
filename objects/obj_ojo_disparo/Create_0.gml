/// @description Insert description here
// You can write your code in this editor
objeto=noone;
if(instance_exists(obj_player)){
	objeto=obj_player;
}else if(instance_exists(obj_player_noche)){
	objeto=obj_player_noche;
}
direction = point_direction(x, y, objeto.x, objeto.y);
image_angle = direction;
speed = 2;
