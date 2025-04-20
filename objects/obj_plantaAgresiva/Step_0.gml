/// @description Insert description here
// You can write your code in this editor

if(instance_exists(obj_player_noche)){
	objeto=obj_player_noche;
	
}else if(instance_exists(obj_player)){
	objeto=obj_player;
}


if(collision_circle(x,y,32,objeto,true,true)){
	estado="ataque";
	
}else{
	estado="";
}

switch(estado){
	case "ataque":
	sprite_index=spr_plantaAgresiva_ataque;
	break;
	default:
	sprite_index=spr_plantaAgresiva_idle;
	break;
}