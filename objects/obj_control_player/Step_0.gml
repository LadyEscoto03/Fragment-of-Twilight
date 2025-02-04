/// @description Insert description here
// You can write your code in this editor

if(object_exists(obj_diaYnoche)){
    if(obj_diaYnoche.alpha>=0.50){//estamos en el día y vamos a pasar a noche
        if (instance_exists(obj_player)) {
            if(!oscuro){
				oscuro=true;
			} 
            //esperar la oscuridad para hacer el cambio
            if(alpha==1){
                instance_create_layer(obj_player.x, obj_player.y - sprite_get_height(obj_player.sprite_index) / 2, "Instances", obj_player_noche);
				//habilitar la respectiva
                view_set_visible(0, false);
                view_set_visible(1, true);
                instance_destroy(obj_player);
                oscuro=false;
            }
        }
    } 
    else if (obj_diaYnoche.alpha<=0.50) {//es de noche y vamos a pasar de día
        if (instance_exists(obj_player_noche)) {
            if (!oscuro){
				oscuro=true;
			}
			
            if (alpha == 1) {

                 instance_create_layer(obj_player_noche.x, obj_player_noche.y - sprite_get_height(obj_player_noche.sprite_index) / 2, "Instances", obj_player);
                view_set_visible(1, false);
                view_set_visible(0, true);
                instance_destroy(obj_player_noche);
               oscuro= false;  // Iniciar la transición de regreso
            }
        }
    }
}
