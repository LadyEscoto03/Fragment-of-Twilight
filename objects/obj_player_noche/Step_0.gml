/// @description Insert description here
// You can write your code in this editor
var _derecha = keyboard_check(vk_right);
var _izquierda = keyboard_check(vk_left);
var _jum = keyboard_check(vk_space);
var _ataqueEspada1 = keyboard_check(vk_down);
var _ataqueEspada2 = keyboard_check(vk_up);
var _ataqueCuervo1 = keyboard_check(ord("W"));
var _ataqueCuervo2 = keyboard_check(ord("D"));

estado = "";


if (_ataqueCuervo1) {
    estado = "ataque_cuervo1";
} else if (_ataqueEspada1) {
    estado = "ataque_espada1";
} else if (_ataqueEspada2) {
    estado = "ataque_espada2";
} else if (_ataqueCuervo2) {
    estado = "ataque_cuervo2";
} else if (_jum) {
    estado = "salto";
} else if (_derecha or _izquierda) {
    estado = "caminando";
}

switch (estado) {
    case "caminando":
        sprite_index = spr_jugador_correr;    
        break;    
    
    case "ataque_espada1":
        sprite_index = spr_jugador_ataque1;
        break;
    
    case "ataque_espada2":
        sprite_index = spr_jugador_ataque2;
        break;
    
    case "ataque_cuervo1":
	
        sprite_index = spr_jugador_ataqueCuervo;

		if(floor(image_index)==2 and temAtaque1<=0){
			 var cuervo=instance_create_layer(x+(16*image_xscale),y,"Instances",obj_cuervoNoche);
			 cuervo.image_xscale=image_xscale;
			 cuervo.NumVX*=image_xscale; 
			temAtaque1=5;
		}
		if(image_index>=image_number-1){
			temAtaque1-=1;
		}
		
        break;
    
    case "ataque_cuervo2":
        sprite_index=spr_jugador_tripeAtaque;
		
		if (floor(image_index)==3 and temAtaque2<=0) {
			var cuervo_centro=instance_create_layer(x+(18*image_xscale),y,"Instances",obj_cuervoNoche);
			cuervo_centro.image_xscale=image_xscale;
			cuervo_centro.NumVX*=image_xscale;
			alarm[0]=5;
			alarm[1]=10;
			temAtaque2=5;
		}
		if(image_index>=image_number-1){
			temAtaque2-=1;
		}

		
		
		
		
		
		
		
        break;

    case "salto":
        sprite_index = spr_jugador_salto;    
        break;
    
    case "Daño":
        sprite_index = spr_jugador_danio;
        break;
    
    case "muerte":
        sprite_index = spr_jugador_muerte;
        break;
    
    default:
        sprite_index = spr_jugador_idle;
        break;
}

if not (_ataqueEspada1 or _ataqueEspada2 or _ataqueCuervo1 or _ataqueCuervo2){
	
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

if(_jum and !place_free(x,y+1)){
	grav -=16;
}





