/// @description Insert description here
// You can write your code in this editor
// Detectar si el jugador está en rango
var enRangoLargo = collision_circle(x, y, 182, obj_player, false, false);
var enRangoCercano = collision_circle(x, y, 22, obj_player, false, false);

// Cambio de estado basado en la proximidad del jugador
if (enRangoCercano) {
    estado = "ataqueCorto";
} else if (enRangoLargo && estado == "correr" && temporizador-- <= 0) {
    estado = "ataqueLargaDistancia";
    temporizador = 60;
}

// Máquina de estados (siempre se ejecuta)
switch (estado) {
    case "correr":
        sprite_index = spr_hongo_correr;
        hsp = (enRangoLargo) ? lengthdir_x(movespeed, point_direction(x, y, obj_player.x, obj_player.y)) : dir * movespeed;

        if (place_meeting(x + hsp, y, obj_paredInvisible)) {
            dir *= -1;
        }
        break;

    case "ataqueLargaDistancia":
        if (!enRangoLargo) {  // Si el jugador sale del rango, vuelve a correr
            estado = "correr";
            sprite_index = spr_hongo_correr;
            image_index = 0;
            temporizador = 60;
            frecuenciaDisparo = 0;
            break;
        }

        sprite_index = spr_hongo_ataque3;
        var frameDisparo = 8;

        if (floor(image_index) == frameDisparo && frecuenciaDisparo <= 0) {
            var tiro = instance_create_layer(x, y, "Disparos", obj_disparoHongo);
            frecuenciaDisparo = 5;
        }

        if (image_index >= image_number - 1) {
            estado = "correr";
            sprite_index = spr_hongo_correr;
            image_index = 0;
            temporizador = 64;
            frecuenciaDisparo = 0;
        }
        break;

    case "ataqueCorto":
        if (image_index >= image_number - 1) {
            sprite_index = choose(spr_hongo_ataque1, spr_hongo_ataque2);
            image_index = 0;
        }

        if (!enRangoCercano) {
            estado = "correr";
            temporizador = 60;
        }
        break;
		
		case "danio":
		sprite_index = spr_hongo_danio;
		if (image_index >= image_number - 1) {
           estado="";
        }
		break;
		case "muerte":
		sprite_index = spr_hongo_muerte;
		 if (image_index >= image_number - 1) {
           instance_destroy();
        }
		break;

    default:
        estado = "correr";
        temporizador = 60;
        break;
}


if(place_meeting(x,y,obj_cuervoDestrucion)){
	estado="danio";
	
}



// Aplicar gravedad
vsp += grv;

// Colisiones con paredes invisibles (horizontal)
if (place_meeting(x + hsp, y, obj_paredInvisible)) {
    while (!place_meeting(x + sign(hsp), y, obj_paredInvisible)) {
        x += sign(hsp);
    }
    hsp = 0;
}
x += hsp;

// Colisiones con paredes invisibles (vertical)
if (place_meeting(x, y + vsp, obj_paredInvisible)) {
    while (!place_meeting(x, y + sign(vsp), obj_paredInvisible)) {
        y += sign(vsp);
    }
    vsp = 0;
}
y += vsp;

// Ajustar dirección del sprite
if (hsp != 0) {
    image_xscale = sign(hsp);
}
