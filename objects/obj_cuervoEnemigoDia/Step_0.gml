/// @description Insert description here
// You can write your code in this editor

if(instance_exists(obj_player_noche)){
	objeto=obj_player_noche;
	if((place_meeting(x,y,obj_player_noche) and  obj_player_noche.estado="ataque_espada1")and danio--<=0){
		vida-=15;
		danio=50;
	}
}else if (instance_exists(obj_player)){
	objeto=obj_player;
}
if(vida<=0){
	estado="danio";
	} else{
	estado="caminar";
}


if(collision_circle(x,y,96,objeto,false,false)){
	movespeed=2;
	var anguloDireccion=point_direction(x,y,objeto.x,objeto.y);
	hsp=lengthdir_x(movespeed,anguloDireccion);
	if(collision_circle(x,y,30,objeto,false,false)){
		estado="ataque";
	}

}else{
	movespeed=0.5;
	hsp=dir*movespeed;
	if(place_meeting(x+hsp,y,obj_paredInvisible)){
		dir*=-1;
    }
}


switch(estado){
	case "caminar":
	sprite_index=spr_cuervo_caminar;
	break;
	case "ataque":
	sprite_index=spr_cuervo_ataque;
	break;
	case "danio":
	sprite_index=spr_cuervo_danio;
	 if (image_index >= image_number - 1) {
           instance_destroy();
       }
	break;
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
