/// @description Insert description here
// You can write your code in this editor

//aplicar el movimiento seguiendo al player
if(instance_exists(obj_player)){
	if(moverAbajoPared==false){
		if(obj_player.x>x){
			move_x=vel;//derecha
		}else{
			move_x=-vel;//izquierda
		}
	}
	
}






// Detectar colisiones
var col_encima = !place_free(x, y + 1);
var col_abajo = !place_free(x, y - 1);

var col_izquierda = !place_free(x + 1, y);
var col_derecha = !place_free(x - 1,y);




if (col_encima) {
	//superficie encima
    image_angle = 0;
} else if (col_abajo) {
	//superficie abajo
    image_angle = 180;
} else if (col_izquierda) {
    image_angle = 90;

} else if (col_derecha) {
    image_angle = -90;
}





if(!place_free(x+1,y)){
	move_y = -vel;
	 
	 

} else if(!place_free(x-1,y)){
	move_y = -vel;
	 

}

if (!place_free(x, y - 1)){
		 
	moverAbajoPared=true;
    grav = 0;

    if (obj_player.x > x and place_free(x - 1, y)) {
        move_x = -vel; //izquierda
		esquina=true;

    } else if(obj_player.x < x ){
        move_x = vel;//derecha
		esquina=true;
    }
}else{ 
	
	if(esquina==true){
		move_y = -vel;
		
		esquina=false;
	}
	moverAbajoPared=false;
    grav=1;
}







// Colisión vertical
if (!place_free(x, y + move_y)) {
	
	
    while (place_free(x, y + sign(move_y))) {
        y += sign(move_y);
		
    }
    move_y = 0;
}

y += move_y; // Aplicar movimiento vertical

// Colisión horizontal
if (!place_free(x + move_x, y)) {
    while (place_free(x + sign(move_x), y)) {
        x += sign(move_x);
    }
    move_x = 0;
}

x += move_x; // Aplicar movimiento horizontal

// Gravedad
if (place_free(x, y + 1)){

    move_y += grav;
} else {
    move_y = 0;
}




direction=image_angle;





