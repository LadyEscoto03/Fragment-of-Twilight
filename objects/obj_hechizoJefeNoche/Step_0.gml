/// @description Insert description here
// You can write your code in this editor



var ejeX = obj_player.x +(instance_number(obj_circulo_aviso) * 32); 
var ejeY = obj_player.y - 25;

// Crear la instancia
var instancia = instance_create_layer(ejeX, ejeY, "lanzamientos", obj_circulo_aviso);


// Limitar a 3 instancias eliminando la más antigua
if (instance_number(obj_circulo_aviso) == 3) {
     instance_destroy();
}
