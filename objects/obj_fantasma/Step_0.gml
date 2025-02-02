/// @description Insert description here
// You can write your code in this editor

if(collision_circle(x,y,160,obj_player,false,false)){
	var dist=point_distance(x,y,obj_player.x,obj_player.y);
	seguir=false;
	if(dist>=100){
		motion_set(point_direction(x, y, obj_player.x, obj_player.y),movespeed);
		friction=0;
	}else{
		friction=0.005;
	}
	


}else{
	seguir=true;
}


if(seguir==true){
	cambioDireccion-=1;
	if(cambioDireccion== 0){
		motion_set(irandom(360),movespeed);
		//actualizar el tiempo para el proximo cambio de dirección
		cambioDireccion=irandom_range(120, 180);//nuevo tiempo entre 1 y 2 segundos
	}
}

if(place_meeting(x,y,all)){
	pared=true;
}else{
	pared=false;
}


//switch(estado){
//	case "ataque":
//	sprite_index=spr_fantasma_ataque;
//	//if(image_index>=image_number-1){
//	//	tempAtaque-=1;
//	//}
//	sprActual=sprite_index;
//	break;
//	case "muerte":
//	sprite_index=spr_fantasma_muerte;
//	sprActual=sprite_index;
//	break;
//	default: 
//	sprite_index=spr_fantasma_movimiento;
	
//	sprActual=spr_fantasma_movimiento;
//	break;

//}
