/// @description Insert description here
// You can write your code in this editor





if (place_meeting(x, y, obj_player_noche) && obj_player_noche.estado == "ataque_espada1") {
	if (floor(obj_player_noche.image_index) == 2 or floor(obj_player_noche.image_index) == 6) {
		estado="muerte";
	}
} else if (place_meeting(x, y, obj_cuervoNoche)){
	
	estado="muerte";
	
} else if(collision_circle(x,y,132,obj_player_noche,false,false)){
	if(tempAtaque--<=0){
		estado="ataque";
	}
	var dist=point_distance(x,y,obj_player_noche.x,obj_player_noche.y);
	if(dist>=96){
		motion_set(point_direction(x, y, obj_player_noche.x, obj_player_noche.y),movespeed);
		friction=0;
	}
	seguir=false;
}else{
	seguir=true;
}
if(seguir==true){
	cambioDireccion-=1;
	if(cambioDireccion==0){
		motion_set(irandom(360),movespeed);
		//actualizar el tiempo para el proximo cambio de dirección
		cambioDireccion=irandom_range(60, 120);//nuevo tiempo entre 1 y 2 segundos
	}
}

switch(estado){
	case "ataque":
	sprite_index=spr_ojo_ataque;
	if(floor(image_index)==10 and ataqueIiro<=0){
		var tiro=instance_create_layer(x,y,"Instances",obj_ojo_disparo);
		ataqueIiro=60;	
	}
	if(image_index>=image_number-1){
		estado="";
		tempAtaque=60;
		ataqueIiro=0;	
	}
	break;
	case "muerte":

	sprite_index=spr_ojo_muerte;
	
	break;
	default: 
	sprite_index=spr_ojo_movimiento;
	 if(direction>=90 and direction<=270){
            image_xscale=1;
	}else{
		image_xscale=-1;
    }
	break;
}
friction=0.005;