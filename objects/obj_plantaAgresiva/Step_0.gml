/// @description Insert description here
// You can write your code in this editor
if(collision_circle(x,y,32,obj_player,true,true)){
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