/// @description Insert description here
// You can write your code in this editor

var ataqueCualquiera=choose(1,2,3);

switch(ataqueCualquiera){
	case 1: 
	//ataque alrededor del player
	var direccion =irandom_range(0,360);
	var ejeX=obj_player.x+lengthdir_x(64,direccion);
	var ejeY=obj_player.y+lengthdir_y(64,direccion);
	instance_create_layer(ejeX,ejeY,"lanzamientos",obj_circulos);	
	if(instance_number(obj_circulos)==5){
		instance_destroy();
	}
	break;
	
	case 2:
	//ataque de izquierda o derecha
	var dir =choose(0,180);
	var XX=obj_player.x+lengthdir_x(64,dir);
	var YY=obj_player.y+lengthdir_y(64,dir);
	instance_create_layer(XX,YY,"lanzamientos",obj_circulos);	
	if(instance_number(obj_circulos)>=5){
		instance_destroy();
	}	
	break;
	
	case 3:
	//ataque random en el viewport
	instance_create_layer(irandom_range(camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0])),irandom_range(camera_get_view_width(view_camera[0]),camera_get_view_height(view_camera[0])),"lanzamientos",obj_circulos);	
	if(instance_number(obj_circulos)>=5){
		instance_destroy();
	}	
	break;
}


