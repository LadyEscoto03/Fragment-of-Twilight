/// @description Insert description here
// You can write your code in this editor


if (collision_circle(x, y, 96, obj_player, false, false)) {
    estado = "ataque";
	
} else {
    estado = "Vigilancia";
}
switch (estado) {
    case "Vigilancia":
        sprite_index = spr_plantaA_espera;
        ataqueIiro = 0; // Reinicia el cooldown al volver a vigilancia
        break;

    case "ataque":
        sprite_index = spr_plantaA_ataque;
        // Solo dispara una vez en el frame 6
        if (floor(image_index) ==2 && ataqueIiro == 0) {
            for (var i = 0; i < 4; i++) {
                instance_create_layer(x + (i * 10), y, "Disparos", obj_semilla);
            }
            ataqueIiro = 1; 
        }

        // Resetea ataqueIiro cuando la animación termina
        if (image_index >= image_number - 1) {
            ataqueIiro = 0; // Permite atacar de nuevo en el próximo ciclo
        }
        break;
}
