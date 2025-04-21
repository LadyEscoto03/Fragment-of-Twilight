/// @description Insert description here
// You can write your code in this editor


var _derecha=keyboard_check(vk_right);
var _izquierda=keyboard_check(vk_left);
var _jum=keyboard_check(vk_space);
var _attack2=keyboard_check_pressed(vk_up);

//paso de niveles
if(room_get_name(room)=="rm_nivel1"){
	if(vida>0 and !instance_exists(obj_jefe_bosque)){
		room_goto(rm_nivel2);
	}
}


if(instance_exists(obj_cuervoEnemigoN)){
	if(place_meeting(x,y,obj_cuervoEnemigoN)){
		if(temCuervoDanio--<=0){
			estado="Daño";
			vida-=10;
			temCuervoDanio=60;
		}
	}
}
if(instance_exists(obj_esqueleto)){
	if(place_meeting(x,y,obj_esqueleto)){
		if(temDanio--<=0){
			vida-=10;
			estado="Daño";
			temDanio=60;
		}
	}
}

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
	grav -=14;
}



if((room_get_name(room)=="rm_nivel3") and instance_exists(obj_finalNivel) and !instance_exists(obj_player_noche)){
	vida=0;
}


if(vida<=0){
	estado="muerte";
}else if(_attack2){
	estado="ataque2";
	}else if(_jum){
			estado="jump";
		}else if(_derecha or _izquierda){
				estado="walk";
			}else if(estado=="Daño"){
				estado="Daño";
			}
		
	


if(place_meeting(x,y,obj_agua)){
	velocidad=1;
}else{
	 velocidad=3;
}

if(place_meeting(x,y,obj_plantaAgresiva)){
	estado="Daño";
}else if(place_meeting(x,y,obj_hongo)){
	estado="Daño";
}else if(place_meeting(x,y,obj_cuervoEnemigoDia)){
	if(obj_cuervoEnemigoDia.estado=="ataque"){
		estado="Daño";
	}
}



switch(estado){
	case "walk": 
		sprite_index=spr_player_caminando;	
		if(!_izquierda or !_derecha){
			estado="";
		}	
		break;
	
	case "jump":
	    sprite_index=spr_player_salto;	
	
		if(image_index>=image_number-1){
			estado="";
		}
		break;
		case "Daño":
		sprite_index = spr_player_danio;
		if (!danio && floor(image_index) == 1) {
			vida -= 10;
			danio = true;
		}
		if (image_index >= image_number - 1) {
			estado = "";
			image_index = 0;
			danio = false; // reiniciamos el control
		}
		break;

		case "ataque2":
		
		sprite_index=spr_player_ataque2;

		
		if(floor(image_index)==2 and cuervoTiro<=0){
			 var cuervo=instance_create_layer(x+(16*image_xscale),y,"Instances",obj_cuervoDia);
			 cuervo.image_xscale=image_xscale;
			 cuervo.NumVX*=image_xscale; 
			 cuervoTiro=1;
		}
		if(image_index>=image_number-1){
			cuervoTiro-=1;
			estado="";
		}
	
		
		break;
		case "muerte":
		sprite_index=spr_player_muerte2;

		break;
		
	default:
	     sprite_index=spr_player_idle;	
		 break;
}


























