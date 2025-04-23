/// @description Insert description here
// You can write your code in this editor
var _derecha = keyboard_check(vk_right);
var _izquierda = keyboard_check(vk_left);
var _jum = keyboard_check(vk_space);
var _ataqueEspada1 = keyboard_check(vk_down);
var _ataqueCuervo1 = keyboard_check(vk_up);
var _ataqueCuervo2 = keyboard_check(ord("W"));

estado = "";



if((room_get_name(room)=="rm_nivel3") and !instance_exists(obj_final) and final==false){
	final=true;
	instance_create_layer(x,y,"Instances",obj_finalNivel);
}

if((!instance_exists(obj_jefe_noche) and room_get_name(room)=="rm_nivel2")and rm2==false){
	rm2=true;
	alarm[2]=96;
}
if(instance_exists(obj_esqueleto)){
	if(place_meeting(x,y,obj_esqueleto)){
		if(temDanio--<=0){
			obj_vidaJugador.vida-=10;
			temDanio=60;
		}
	}
}
if(instance_exists(obj_plantaAgresiva)){
	if(place_meeting(x,y,obj_plantaAgresiva)){
		if(planta--<=0){
			obj_vidaJugador.vida-=10;
			planta=60;
		}
	}
}
if(instance_exists(obj_cuervoEnemigoN)){
	if(place_meeting(x,y,obj_cuervoEnemigoN)){
		if(temCuervoDanio--<=0){
			obj_vidaJugador.vida-=10;
			temCuervoDanio=60;
		}
	}
}


if(instance_exists(obj_gusano)){
	if(place_meeting(x,y,obj_gusano)){
		if(gusano--<=0){
			obj_vidaJugador.vida-=10;
			gusano=90;
		}
	}
}
if(instance_exists(obj_lava)){
	if(place_meeting(x,y,obj_lava)){
		if(lava--<=0){
			obj_vidaJugador.vida-=10;
			lava=100;
		}
	}
}

if(instance_exists(obj_jefe_noche)){
	if(place_meeting(x,y,obj_jefe_noche)){
		if(temJefeAtaque--<=0){
			obj_vidaJugador.vida-=10;
			temJefeAtaque=60;
		}
	}
}


 if(obj_vidaJugador.vida<=0 ){
	estado="muerte";
}else
if (_ataqueCuervo1) {
    estado = "ataque_cuervo1";
} else if (_ataqueEspada1) {
    estado = "ataque_espada1";
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

if not (_ataqueEspada1 or _ataqueCuervo1 or _ataqueCuervo2){
	
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

if(instance_exists(obj_finalNivel)){
	if(instance_exists(obj_player)){
		obj_vidaJugador.vida=0;
	}
}