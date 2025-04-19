/// @description Insert description here
// You can write your code in this editor


shotAngle = (shotAngle + 10) mod 360;

var _bullet = instance_create_layer(x,y,"Instances", obj_bullet);
_bullet.speed = 2;
_bullet.direction = shotAngle;

tem--;
if(tem<=0){
	instance_destroy();
}