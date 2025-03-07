/// @description Insert description here
// You can write your code in this editor


// Crear el teletransportador en una posición válida
if (place_free(x + 64, y)) {
    instance_create_layer(x + 64, y, "Instances", obj_teletransportador);
} else if (place_free(x - 64, y)) {
    instance_create_layer(x - 64, y, "Instances", obj_teletransportador);
}


