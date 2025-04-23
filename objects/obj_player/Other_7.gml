/// @description Insert description here
// You can write your code in this editor
if(sprite_index==spr_player_muerte2){
	if(room_get_name(room)=="rm_nivel3" and instance_exists(obj_finalNivel)){
		instance_destroy();
	}else{
		room_goto(rm_gameOver);
	}
}