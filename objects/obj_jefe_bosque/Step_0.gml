/// @description Insert description here
// You can write your code in this editor

// Si el jefe ya está en ataque largo, dejar que termine la animación antes de cambiar de estado

if(!instance_exists(obj_InicioJefe)){
	
	
	if(vida<=0){
		estado="muerte";
	}else if (estado == "ataqueLargo") {
    if (image_index >= image_number - 1) {
        estado = "caminar";
        ataque = false;
    }
} else {
    if (temporizadorAtaqueLargo >= 0) {
        estado = "caminar";
    }

    if (!collision_circle(x, y, 90, obj_player, false, false) && temporizadorAtaqueLargo-- <= 0 ) {
        estado = "ataqueLargo";
        ataque = false;
        temporizadorAtaqueLargo = 450;
    } 
    else if (collision_circle(x, y, 60, obj_player, false, false) and temCorto--<=0) {
        estado = "ataqueCorto";
		
		
		
    } else if (estado != "ataqueLargo" && estado != "caminar") {
        estado = "ataqueCorto";
    }
}


// Manejo de estados
switch (estado) {
    case "ataqueLargo":
        if (sprite_index != spr_jefe_hechizo) {
            sprite_index = spr_jefe_hechizo;
            image_index = 0;
        }

        if (!ataque) {
            var num=choose(1,2);
			switch(num){
				case 1:
				instance_create_layer(obj_player.x,obj_player.y-96,"Instances",obj_inicioHechizo);
				break;
				
				case 2:
				instance_create_layer(obj_player.x,obj_player.y-96,"Instances",obj_controladorHechizo);
				
				break;
			}
            ataque = true;
        }
        break;

    case "caminar":
        sprite_index = spr_jefe_caminando;
        break;

    case "ataqueCorto":
	if (sprite_index != spr_jefe_ataque) {
            sprite_index = spr_jefe_ataque;
            image_index = 0;
			
        }
		if(estado=="ataqueCorto" and floor(image_index)==5){
			global.ataqueJ=true;
		}
		
		 if (image_index >= image_number - 1) {
			  image_index = 0;
			  temCorto=100;
			  estado = "caminar";
		  
        }
		break;
		
		case "muerte":
		sprite_index = spr_jefe_muerte;
		 if (image_index >= image_number - 1) {
			  instance_destroy();
		  
        }
		break;
		
}





// Movimiento
var anguloDireccion = point_direction(x, y, obj_player.x, obj_player.y);
hsp = lengthdir_x(movespeed, anguloDireccion);
vsp += grv;

// Evitar colisiones horizontales
if (place_meeting(x + hsp, y, obj_paredInvisible)) {
    while (!place_meeting(x + sign(hsp), y, obj_paredInvisible)) {
        x += sign(hsp);
    }
    hsp = 0;
}

// Solo moverse si está en "caminar"
if (estado == "caminar") {
    x += hsp;
}

// Evitar colisiones verticales
if (place_meeting(x, y + vsp, obj_paredInvisible)) {
    while (!place_meeting(x, y + sign(vsp), obj_paredInvisible)) {
        y += sign(vsp);
    }
    vsp = 0;
}

y += vsp;

// Ajustar dirección de la imagen
if (hsp != 0) {
    image_xscale = sign(hsp);
}
//if(place_meeting(x,y,obj_cuervoDestrucion)){
//	if(danio==false){
//		vida-=10;
//		danio=true;
//	}
	
//}else{
//	danio=false;
//}
if(obj_player.estado=="attack") and place_meeting(x,y,obj_player){
	if(danioEspada==false){
		vida-=15;
		danioEspada=true;
	}
}else{
	danioEspada=false;
}


}

