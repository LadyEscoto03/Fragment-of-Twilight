/// @description Insert description here
// You can write your code in this editor
if (instance_exists(obj_player)) {
     obj_vidaJugador.vida = min( obj_vidaJugador.vida + 15, 200);
} else if (instance_exists(obj_player_noche)) {
     obj_vidaJugador.vida = min( obj_vidaJugador.vida + 15, 200);
}
