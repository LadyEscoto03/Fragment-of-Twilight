/// @description Insert description here
// You can write your code in this editor



if(instance_exists(obj_player_noche)){
	objeto=obj_player_noche;
	if (place_meeting(x, y, obj_player_noche) && obj_player_noche.estado == "ataque_espada1") {
		if (floor(obj_player_noche.image_index) == 2 or floor(obj_player_noche.image_index) == 6) {
			estado="muerte";
		}
	}
}else if(instance_exists(obj_player)){
	objeto=obj_player;
	
}



if(collision_circle(x,y,196,objeto,false,false)){
	if(tempAtaque--<=0){
		estado="ataque";
	}
	var dist=point_distance(x,y,objeto.x,objeto.y);

	if(dist>=120){
		motion_set(point_direction(x, y, objeto.x, objeto.y),movespeed);
		friction=0;
	}else{
		friction = movespeed * 0.05;
	}
	seguir=false;
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

switch(estado){
	case "ataque":
	sprite_index=spr_fantasma_ataque;
	
	var frameDisparo=7;
		if(floor(image_index)==7 and ataqueIiro<=0){
			var tiro=instance_create_layer(x,y,"Instances",obj_fantasma_ataque);
			tiro.direction=direction;
			ataqueIiro=10;	
		}
	if(image_index>=image_number-1){
		image_index=0;
		estado="";
		tempAtaque=196;
		ataqueIiro=0;
		
	}
	break;
	case "muerte":
	sprite_index=spr_fantasma_muerte;
	break;
	default: 
	sprite_index=spr_fantasma_movimiento;
	 if(direction>=90 and direction<=270){
            image_xscale=-1;
	}else{
		image_xscale=1;
    }
	break;
}
