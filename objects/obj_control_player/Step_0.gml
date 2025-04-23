/// @description Insert description here
// You can write your code in this editor



if(!instance_exists(obj_cambioPlayer)){
	oscuro=true;
	if(EsNoche==false){
		instance_create_layer(0,0,"Instances",obj_noche);
		EsNoche=true;
	}
	if(instance_exists(obj_player)){
		if(alpha==1){
			instance_create_layer(obj_player.x, obj_player.y-32, "Instances", obj_player_noche);
			view_set_visible(0, false);//deshabilitar el viewport o
			view_set_visible(1, true);//habilitar viewport 1
			instance_destroy(obj_player);
			oscuro=false;
		}
	}
	if(instance_exists(obj_player_noche)){
		oscuro=false;
	}
	if(oscuro==false and instance_exists(obj_player_noche)){
		instance_destroy();
	}
}

