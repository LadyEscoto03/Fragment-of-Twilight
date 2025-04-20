/// @description Insert description here
// You can write your code in this editor

if(place_meeting(x,y,obj_paredInvisible)){
	instance_destroy();
}

if(instance_exists(obj_player_noche)){
	if((place_meeting(x,y,obj_player_noche) and  obj_player_noche.estado="ataque_espada1")and danio--<=0){
		instance_destroy();
	}
}
