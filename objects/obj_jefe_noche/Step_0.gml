/// @description Insert description here
// You can write your code in this editor

estado="caminar";
if not(collision_circle(x,y,82,obj_player,false,false)){
	if(temporizadorAtaqueLargo--<=0){
		estado="ataqueLargo";
		ataque=false;
		temporizadorAtaqueLargo=150;
	}

	if(ataque==false){
		instance_create_layer(0,0,"Instances",obj_hechizoJefeNoche);
		ataque=true;
	}

}else {
	
	estado="ataqueCorto";
}

switch(estado){
	
	case "ataqueCorto":
	//sprite_index=spr_jefe_noche_ataqueEspada;
	movespeed=0;
	break;
	
	case "ataqueLargo":
	sprite_index=spr_jefe_noche_hechizo;
	
	break;
	
	case "caminar":
	sprite_index=spr_jefe_noche_caminar;
	break;
	
	case "muerte":
	break;
	
	case "aparece":
	break;
	
	case "desaparece":
	break;
	
}


var anguloDireccion=point_direction(x,y,obj_player.x,obj_player.y);

hsp=lengthdir_x(movespeed,anguloDireccion);

vsp+=grv;

if(place_meeting(x+hsp,y,obj_paredInvisible)){
    while(!place_meeting(x+sign(hsp),y,obj_paredInvisible)){
        x+=sign(hsp);
    }
    hsp=0;
}
if (collision_circle(x, y, 32, obj_player, false, false)) {
    var angulo = point_direction(x, y, obj_player.x, obj_player.y) + 180;
    x+=lengthdir_x(1, angulo);
}else{
	x+=hsp;
}


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