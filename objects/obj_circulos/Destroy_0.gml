/// @description Insert description here
// You can write your code in this editor

var ataque=choose(1,2);

switch(ataque){
	
	case 1:
	instance_create_layer(x,y,"lanzamientos",obj_bulletRandom);	
	
	break;
	
	case 2:
	instance_create_layer(x,y,"lanzamientos",obj_controladorBullet);	

	break;
}


