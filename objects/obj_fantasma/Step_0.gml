/// @description Insert description here
// You can write your code in this editor

if(collision_circle(x,y,160,obj_player,false,false)){
	if(tempAtaque--<=0){
		estado="ataque";
	}
	var dist=point_distance(x,y,obj_player.x,obj_player.y);
	if(dist>=120){
		motion_set(point_direction(x, y, obj_player.x, obj_player.y),movespeed);
		friction=0;
	}else{
		friction=0.005;
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
			var tiro=instance_create_layer(x,y,"Disparos",obj_fantasma_ataque);
			ataqueIiro=60;	
		}
	if(image_index>=image_number-1){
		image_index=0;
		estado="";
		tempAtaque=300;
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
