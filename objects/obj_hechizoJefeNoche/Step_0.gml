/// @description Insert description here
// You can write your code in this editor

var ataqueCualquiera=choose(1,2);



switch(ataqueCualquiera){
	case 1:
	var ejeX = obj_player.x +(instance_number(obj_circulo_aviso) * 32); 
	var ejeY = obj_player.y - 25;
	instance_create_layer(ejeX, ejeY, "lanzamientos", obj_circulo_aviso);
	break;
	
	case 2:
		//instance_create_layer(irandom(camera_get_view_width(view_camera[0])),irandom(camera_get_view_height(view_camera[0])),"lanzamientos",obj_Ojo);	

	break;
	
}

if (instance_number(obj_circulo_aviso) == 3) {
     instance_destroy();
}

