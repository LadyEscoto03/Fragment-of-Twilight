/// @description Insert description here
// You can write your code in this editor




for (var i = 0; i < 360; i += 20) {
    var a = instance_create_layer(x, y, "Instances", obj_explosion);
    a.speed = 1.5; 
    a.direction = i;  
}


alarm[1] = 100;

