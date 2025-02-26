
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

if(!place_free(x+1,y)){
	move_y = -vel;
	 
} else if(!place_free(x-1,y)){
	move_y = -vel;
}

if(!place_free(x,y-1)){ 
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


















var _derecha_y_libre=place_free(x+1,y);

var _izquierda_y_libre=place_free(x-1,y);

var subir_y_libre=place_free(x,y-1);

var abajo_y_ocupado=place_free(x,y+1);


if(_derecha_y_libre or _izquierda_y_libre and !abajo_y_ocupado){
	image_angle=0;
} else if(subir_y_libre and abajo_y_ocupado and !_derecha_y_libre and image_angle!=90){
	image_angle=90;
}






























