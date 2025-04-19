// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_espadaAtaque(){
	if (instance_exists(obj_player_noche)) {
		if (place_meeting(x, y, obj_player_noche) && obj_player_noche.estado == "ataque_espada1") {
			if (floor(obj_player_noche.image_index) == 2 or floor(obj_player_noche.image_index) == 6) {
				instance_destroy();
			}
		}
	}
}