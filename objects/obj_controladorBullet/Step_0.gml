/// @description Insert description here
// You can write your code in this editor



shotAngle = (shotAngle + 10) mod 360;   //increment that angle but keep it within a range just for fun


var _bullet = instance_create_layer(x,y,layer, obj_bullet);    //create that bullet
_bullet.speed = 1;
_bullet.direction = shotAngle;      //use the built-in variable just so we don't have to put anything in the bullet object


