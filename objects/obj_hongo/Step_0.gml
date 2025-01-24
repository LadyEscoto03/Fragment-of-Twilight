/// @description Insert description here
// You can write your code in this editor

//movimiento del enemigo
if(collision_circle(x,y,128,obj_player,false,false)){
    var anguloDireccion=point_direction(x,y,obj_player.x,obj_player.y);
    hsp=lengthdir_x(movespeed,anguloDireccion);
	disparo=true;
}else{
	disparo=false;
    hsp=dir*movespeed;
}

 vsp+=grv;
if(place_meeting(x+hsp,y,obj_paredInvisible)){
	while(!place_meeting(x+sign(hsp),y,obj_paredInvisible)){
		x+=sign(hsp);
	}
	hsp=0;
	dir*=-1;
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

//sistema de tiro
if(disparo==true){
	frecuenciaDisparo-=1;
	if(frecuenciaDisparo<=0){
		var tiro=instance_create_layer(x,y,"Disparos",obj_disparoHongo);
		tiro.NumVX*=image_xscale;
		frecuenciaDisparo = 60;
	}
}












switch(estado){
	case "Caminando":
	sprite_index=spr_hongo_correr;
	break;
	case "ataque1":
	sprite_index=spr_hongo_ataque1;
	break;
	case "ataque2":
	sprite_index=spr_hongo_ataque2;
	break;
	case "ataque3":
	sprite_index=spr_hongo_ataque3;
	break;
}
















