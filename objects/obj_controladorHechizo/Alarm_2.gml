/// @description Insert description here
// You can write your code in this editor




for (var i=0;i<360;i+=10) {
    var a = instance_create_layer(x, y, "Instances", obj_explosion); 
    a.speed = i/36; 
    a.direction = i;  
}


alarm[2] = 50;