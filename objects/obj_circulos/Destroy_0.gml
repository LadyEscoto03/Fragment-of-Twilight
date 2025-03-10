/// @description Insert description here
// You can write your code in this editor

var ataque=choose(1,2);

switch(ataque){
	
	case 1:
	for (var i=0;i<3;i++){
		var _vx=camera_get_view_x(view_camera[0]);
		var _vy=camera_get_view_y(view_camera[0]);
		instance_create_layer(irandom_range(_vx,_vy),irandom_range(_vx,_vy),"lanzamientos",obj_bulletRandom);	
	}
	
	
	break;
	
	case 2:
	instance_create_layer(x,y,"lanzamientos",obj_controladorBullet);	

	break;
}


