/// @description Insert description here
// You can write your code in this editor


shotAngle = (shotAngle + 10) mod 360;

var _bullet = instance_create_layer(x,y,layer, obj_bullet);
_bullet.speed = 1;
_bullet.direction = shotAngle;

tem--;
if(tem<=0){
	instance_destroy();
}