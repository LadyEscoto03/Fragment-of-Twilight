/// @description Insert description here
// You can write your code in this editor

if(collision_circle(x,y,96,obj_player,false,false)){
	estado="correr";
}else{
	estado="quieto";
}


switch(estado){
	case "quieto":
	sprite_index=spr_duende_esperar;
	break;
	
	case "correr":
	sprite_index=spr_duende_correr;
	break;
}


if(estado!="quieto"){
	hsp=dir*movespeed;
}
if(place_meeting(x+hsp,y,obj_paredInvisible)){
	dir*=-1;
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