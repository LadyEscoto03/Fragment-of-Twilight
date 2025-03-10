/// @description Insert description here
// You can write your code in this editor



instance_create_layer(x,y,"lanzamientos",obj_bulletRandom);
if(instance_number(obj_bulletRandom)==1){
	instance_destroy();
}