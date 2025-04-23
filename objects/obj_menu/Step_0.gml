/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(vk_enter)){
	//opcion salir
	if(index==2){
		game_end();
	}
	//opcion tutorial
	if(index==1){
		room_goto(rm_tutorial);
	}
	//opcion iniciar juego
	if(index==0){
		obj_vidaJugador.vida=200;
		obj_vidaJugador.vida_max=200;
		obj_puntos.puntos=0;
		room_goto(rm_nivel1);
	}
}
//sube la posición de las opciones 
if(keyboard_check_pressed(vk_up)){
	index--;
	if(index<0){
		index=op_max-1;
	}
}
//baja la posición de las opciones 
if(keyboard_check_pressed(vk_down)){
	index++;
	if(index>=op_max){
		index=0;
	}
}