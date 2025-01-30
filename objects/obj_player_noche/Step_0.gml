/// @description Insert description here
// You can write your code in this editor

var _derecha=keyboard_check(vk_right);
var _izquierda=keyboard_check(vk_left);
var _jum=keyboard_check(vk_space);
var _ataqueEspada1=keyboard_check(vk_down);
var _ataqueEspada2=keyboard_check(vk_alt);
var _ataqueCuervo1=keyboard_check(vk_control);
var _ataqueCuervo2=keyboard_check(vk_up);










if(_derecha){
	face=0;
image_xscale=1;
	repeat(velocidad){
		if(place_free(x+1,y)){
			x++;
		}
	}
}
if(_izquierda){
	face=1;
image_xscale=-1;
	repeat(velocidad){
		if(place_free(x-1,y)){
			x--;
		}
	}

}

if(place_free(x,y+1)){
	grav++;
}

if(grav>0){
	repeat(grav){
		if(place_free(x,y+1)){
			y++;
		}else{
			grav=0;
		}
	}
}
if(grav<0){
	repeat(-grav){
		if(place_free(x,y-1)){
			y--;
		}else{
			grav=0;
		}
	}
}

if(_jum && !place_free(x,y+1)){
	grav -=16;
}



var en_ataque=(estado=="ataque_espada1"or estado=="ataque_espada2" or estado == "ataque_cuervo1" or estado=="ataque_cuervo2");

if (!en_ataque) {
    if(_ataqueEspada1){
        estado="ataque_espada1";
    }else if(_ataqueEspada2){
        estado="ataque_espada2";
    }else if(_ataqueCuervo1){
        estado="ataque_cuervo1";
		
		
		
		
		
		
		
		
		
		
    }else if(_ataqueCuervo2){
        estado="ataque_cuervo2";
    }else if(_jum){
        estado="salto";
    }else if(_derecha or _izquierda){
        estado="caminando";
    } 
}





switch(estado){
	case "caminando": 
		sprite_index=spr_jugador_correr;	
		if(!_izquierda or !_derecha){
			estado="";
		}	
	break;	
	case "ataque_espada1":
	    sprite_index=spr_jugador_ataque1;
		if(image_index>=image_number-1){
			estado="";
		}
	break;
	case "ataque_espada2":
	    sprite_index=spr_jugador_ataque2;
		if(image_index>=image_number-1){
			estado="";
		}
	break;
	
	case "ataque_cuervo1":
		sprite_index=spr_jugador_ataqueCuervo;
		
		var frameDisparo=2;
		if(floor(image_index)==frameDisparo){
			var tiro=instance_create_layer(x,y,"Disparos",obj_cuervo);
			tiro.NumVX*=image_xscale;
		}
		
		
		
		
		
		
		
		
		
		if(image_index>=image_number-1){
			estado="";
		}
	break;
	case "ataque_cuervo2":
		sprite_index=spr_jugador_tripeAtaque;
		if(image_index>=image_number-1){
			estado="";
		}
	break;

	case "salto":
	    sprite_index=spr_jugador_salto;	
	
		if(image_index>=image_number-1){
			estado="";
		}
	break;
		case "Daño":
		sprite_index=spr_jugador_danio;
		if(image_index>=image_number-1){
			estado="";
		}
		break;
		case "muerte":
		sprite_index=spr_jugador_muerte;
		if(image_index>=image_number-1){
			instance_destroy();
		}

		break;
	default:
	     sprite_index=spr_jugador_idle;	
	 break;
}





