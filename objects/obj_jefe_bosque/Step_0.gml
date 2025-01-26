/// @description Insert description here
// You can write your code in this editor


if not(collision_circle(x,y,96,obj_player,false,false)){
	
	var numero=irandom_range(1,3);
	
	switch(numero){
		case 1:
		
		break;
		
		case 2:
		break;
		
		case 3:
		break;
	}
	
	
	
	
}

switch(estado){
	
	case "ataqueCorto":
	
	break;
	
	case "ataqueLargo":
	break;
	
	case "caminar":
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