/// @description Insert description here
// You can write your code in this editor
if(keyboard_check_pressed(vk_enter)){
	//opcion volver al menú
	if(index==1){
		
		room_goto(rm_menu);
	}
	//opcion volver a jugar 
	if(index==0){
		obj_vidaJugador.vida=200;
		obj_vidaJugador.vida_max=200;
		obj_puntos.puntos=0;
		
		room_goto(rm_nivel1);
	}
	if(index==2){
		room_goto(rm_creditos);
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