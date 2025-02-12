/// @description Insert description here
// You can write your code in this editor

// Si el jefe ya está en ataque largo, dejar que termine la animación antes de cambiar de estado
if (estado == "ataqueLargo") {
    if (image_index >= image_number - 1) {
        estado = "caminar";
        ataque = false;
    }
} 
// Si no está en ataque largo, evaluar las condiciones normales
else {
    if (temporizadorAtaqueLargo >= 0) {
        estado = "caminar";
    }

    // Si el jugador está fuera del radio de 96 y el temporizador de ataque largo se ha agotado, ejecutar ataque largo
    if (!collision_circle(x, y, 90, obj_player, false, false) && temporizadorAtaqueLargo-- <= 0) {
        estado = "ataqueLargo";
        ataque = false;
        temporizadorAtaqueLargo = 150;
    } 
    // Si el jugador está dentro del radio de 96, ejecutar ataque corto
    else if (collision_circle(x, y, 90, obj_player, false, false)) {
        estado = "ataqueCorto";
    } 
    // Si no está atacando, simplemente caminar
    else if (estado != "ataqueLargo" && estado != "caminar") {
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
            instance_create_layer(0, 0, "Instances", obj_ataqueJefeBosque);
            ataque = true;
        }
        break;

    case "caminar":
        sprite_index = spr_jefe_caminando;
        break;

    case "ataqueCorto":
        sprite_index = spr_jefe_ataque;
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
