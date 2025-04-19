/// @description Insert description here
// You can write your code in this editor

if(aparecio==false){
	if(collision_circle(x,y,96,obj_player_noche,false,false)){
		estado="aparecer";
		aparecio=true;
	}

}
if(collision_circle(x,y,32,obj_player_noche,false,false)){
	estado="ataque";
}



switch(estado){
	case "aparecer":
	sprite_index=spr_esqueleto_apareciendo;
	if(image_index>=image_number-1){
		estado="caminar";
	}
	break;
	case "caminar":
	caminar=true
	sprite_index=spr_esqueleto_caminando;
	break;
	
	case "ataque":
	sprite_index=spr_esqueleto_ataque;
	if not(collision_circle(x,y,32,obj_player_noche,false,false)){
		estado="caminar";
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

