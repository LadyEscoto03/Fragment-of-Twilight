/// @description Insert description here
// You can write your code in this editor

if(instance_exists(obj_player_noche)){
	instance_create_layer(x, y, "Instances", obj_teletransportador);
}else if(instance_exists(obj_player)){
	instance_create_layer(x, y, "Instances", obj_teletransportador);
}



