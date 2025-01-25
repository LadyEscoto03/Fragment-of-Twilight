/// @description Insert description here
// You can write your code in this editor

var _derecha=keyboard_check(vk_right);
var _izquierda=keyboard_check(vk_left);
var _jum=keyboard_check(vk_space);
var _attack=keyboard_check(vk_enter);
var _attack2=keyboard_check_pressed(vk_alt);




if(_attack2){
	estado="ataque2";
	var disparoRayo =instance_create_layer(x,y,"Instances",obj_disparoRayo);
	disparoRayo.speed=1;
	disparoRayo.direction=180*face;
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
	grav -=16;
}







if(_attack){
	estado="attack";
}else{
	if(_jum){
		estado="jump";
	}else{
		if(_derecha or _izquierda){
			estado="walk";
		}
	}
}

if(place_meeting(x,y,obj_plantaAgresiva)){
	estado="Daño";
}

switch(estado){
	case "walk": 
		sprite_index=spr_player_caminando;	
		if(_attack){
			estado="attack";
		}
		if(!_izquierda or !_derecha){
			estado="";
		}	
		break;
	case "attack":
	    sprite_index=spr_player_ataque;
		  if(image_index>=image_number-1){
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
		sprite_index=spr_player_danio;
		if(image_index>=image_number-1){
			estado="";
		}
		break;
		case "ataque2":
		
		sprite_index=spr_player_ataque2;
		if(image_index>=image_number-1){
			estado="";
		}
		break;
	default:
	     sprite_index=spr_player_idle;	
		 break;
}


























