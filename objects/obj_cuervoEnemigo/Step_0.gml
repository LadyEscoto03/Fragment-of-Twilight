/// @description Insert description here
// You can write your code in this editor

estado="caminar";
if(collision_circle(x,y,96,obj_player,false,false)){
	movespeed=1;
	var anguloDireccion=point_direction(x,y,obj_player.x,obj_player.y);
	hsp=lengthdir_x(movespeed,anguloDireccion);
	if(collision_circle(x,y,40,obj_player,false,false)){
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
