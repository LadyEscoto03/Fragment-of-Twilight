/// @description Insert description here
// You can write your code in this editor

if(agis==false and !instance_exists(obj_player) and !instance_exists(obj_player_noche)){
	agis=true;
	instance_create_layer(x,y-24,"Instances",obj_agisFinal);
}