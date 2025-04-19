/// @description Insert description here
// You can write your code in this editor

if(aparecio==false){
	if(collision_circle(x,y,96,obj_player_noche,false,false)){
		estado="aparecer";
		aparecio=true;
	}

}
if(collision_circle(x,y,16,obj_player_noche,false,false)){
	estado="ataque";
	
}


if (instance_exists(obj_player_noche)) {
    if (place_meeting(x, y, obj_player_noche) && obj_player_noche.estado == "ataque_espada1" && puede_recibir_danio) {
        if ((floor(obj_player_noche.image_index) == 2 || floor(obj_player_noche.image_index) == 6)) {
            estado = "daño";
            puede_recibir_danio = false;
            danio_cooldown = 20; 
        }
    }
}

if (!puede_recibir_danio) {
    danio_cooldown -= 1;
    if (danio_cooldown <= 0) {
        puede_recibir_danio = true;
    }
}
if (vida <= 0 && estado != "muerte") {
    estado = "muerte";
}


switch(estado){
	case "aparecer":
	sprite_index=spr_esqueleto_apareciendo;
	if(image_index>=image_number-1){
		estado="caminar";
	}
	break;
	case "caminar":
	movespeed=1;
	caminar=true
	sprite_index=spr_esqueleto_caminando;
	break;
	
	case "ataque":
	sprite_index=spr_esqueleto_ataque;
	movespeed=0;
	if not(collision_circle(x,y,32,obj_player_noche,false,false)){
		estado="caminar";
	}
	break;

	case "daño":
    vida -= 20;
    estado = "ataque";
	break;

	case "muerte":
    if (sprite_index != spr_esqueleto_muerte) {
        sprite_index = spr_esqueleto_muerte;
        image_index = 0;
        movespeed = 0;
        caminar = false;
    }

    if (image_index >= image_number - 1) {
        image_index = image_number - 1;
    }
break;

	
}
if(caminar==true){
	var anguloDireccion=point_direction(x,y,obj_player_noche.x,obj_player_noche.y);
	hsp=lengthdir_x(movespeed,anguloDireccion);
	vsp+=grv;
	if(place_meeting(x+hsp,y,obj_paredInvisible)){
		while(!place_meeting(x+sign(hsp),y,obj_paredInvisible)){
			x+=sign(hsp);
		}
		hsp=0;
	}
	x+=hsp;
	if(place_meeting(x,y+vsp,obj_paredInvisible)){
		while(!place_meeting(x,y+sign(vsp),obj_paredInvisible)){
			y+=sign(vsp);
		}
		vsp=0;
	}
	y+=vsp;
	
	if(hsp!=0){
		image_xscale=sign(hsp);
	}
}

