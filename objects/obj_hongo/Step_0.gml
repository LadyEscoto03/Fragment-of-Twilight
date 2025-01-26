/// @description Insert description here
// You can write your code in this editor

var enRangoLargo=collision_circle(x,y,182,obj_player,false,false);
var enRangoCercano=collision_circle(x,y,22,obj_player,false,false);

if (enRangoCercano) {
    estado="ataqueCorto";
} else if(enRangoLargo){

    var anguloDireccion=point_direction(x,y,obj_player.x,obj_player.y);
    switch (estado) {
        case "correr":
            sprite_index=spr_hongo_correr;
            hsp=lengthdir_x(movespeed,anguloDireccion);
			
            if(temporizador--<=0){
                estado="ataqueLargaDistancia";
                temporizador=60;
            }
            break;
        case "ataqueLargaDistancia":
		sprite_index=spr_hongo_ataque3;
		var frameDisparo=8;
		if(floor(image_index)==frameDisparo and frecuenciaDisparo<=0){
			var tiro=instance_create_layer(x,y,"Disparos",obj_disparoHongo);
			tiro.NumVX*=image_xscale;
			frecuenciaDisparo=5;
		}
		if(image_index>=image_number-1){
			estado="correr";
			temporizador=64;
			frecuenciaDisparo=0;
		}
		break;
		
		default:
		estado="correr";
		temporizador=60;
		break;
    }
}else{
	hsp=dir*movespeed;
	if(place_meeting(x+hsp,y,obj_paredInvisible)){
		dir*=-1;
    }
	disparo = false;
}

if(estado=="ataqueCorto"){
	if(image_index>=image_number-1){
        sprite_index=choose(spr_hongo_ataque1,spr_hongo_ataque2);
        image_index=0;
    }
    if(!enRangoCercano){
        estado="correr";
        temporizador=60;
    }
}

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
