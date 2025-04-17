/// @description Insert description here
// You can write your code in this editor




for (var i = 0; i < 800; i += 100) {
    var a = instance_create_layer(i, 0, "Instances", obj_explosion); 
    a.speed = 1; 
    a.direction = 270;  
}


alarm[3] = 5;

