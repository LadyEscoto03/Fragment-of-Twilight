/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_player)) {
    obj_player.vida = min(obj_player.vida + 15, 200);
} else if (instance_exists(obj_player_noche)) {
    obj_player_noche.vida = min(obj_player_noche.vida + 15, 200);
}
