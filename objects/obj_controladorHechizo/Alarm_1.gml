/// @description Insert description here
// You can write your code in this editor




for (var i = 0; i < 360; i += 5) {
    var a = instance_create_layer(x, y, "Instances", obj_explosion);  // Crear explosión
    a.speed = 3; 
    a.direction = i;  
}


alarm[1] = 100;
