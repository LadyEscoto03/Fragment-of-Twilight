/// @description Insert description here
// You can write your code in this editor


if(instance_exists(obj_player_noche)){
	objeto=obj_player_noche;
	if((place_meeting(x,y,obj_player_noche) and  obj_player_noche.estado="ataque_espada1")and danio--<=0){
		vida-=15;
		danio=50;
	}
}else if (instance_exists(obj_player)){
	objeto=obj_player;
}

//aplicar el movimiento seguiendo al player


	
	if(vida<=0){
		instance_destroy();
	}
	
	
	
	//linea derecha 
	if(collision_line(x,y,x+lengthdir_x(64, image_angle),y + lengthdir_y(64, image_angle),objeto,false,false)){
		//show_message("derecha");
		seguirPlayer=true;
	} else if(collision_line(x,y,x+lengthdir_x(64, image_angle+180),y + lengthdir_y(64, image_angle+180),objeto,false,false)){
		seguirPlayer=true;
	}
	if(seguirPlayer==true){
		if(moverAbajoPared==false){
			
			if(objeto.x>x){
				move_x=vel;//derecha
				image_xscale=1;
			}else if(objeto.x<x){
				move_x=-vel;//izquierda
				image_xscale=-1;
			} else if(objeto.x==x){
				move_x=0;
			}
		}
	}



if(seguirPlayer==false){
	move_x=dir*vel;
	if(!place_free(x+move_x,y)){
		dir*=-1;
	}
	if(move_x!=0){
		image_xscale=sign(move_x);
	}
}else {
	
	if(place_free(x+1,y) and place_free(x-1,y)){
	image_angle=0;
	}

	if(!place_free(x+1,y)){
	move_y = -vel;
	image_angle=90;
	 
	} else if(!place_free(x-1,y)){
	move_y = -vel;
	image_angle=-90;
	}
	if(!place_free(x,y-1)){ 
	moverAbajoPared=true;
	image_angle=180;
	grav = 0;

	if (objeto.x > x and place_free(x - 1, y)) {
	    move_x = -vel; //izquierda
		esquina=true;

	} else if(objeto.x < x ){
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

if(estado=="ataque1" or estado=="ataque2" or estado=="teletransportacion"){
	move_x=0;
}else{
	x += move_x; // Aplicar movimiento horizontal
}




// Gravedad
if (place_free(x, y + 1)){
    move_y += grav;
} else {
    move_y = 0;
}


if(collision_circle(x,y,10,objeto,false,false)){
	
	if(animacion==true){
		
		animacion=false;
		var num=choose(1,2);
		switch(num){
			case 1:
			estado="ataque1";
			break;
			case 2:
			estado="ataque2";
			break;
		}
	}	
}else{
	estado="caminar";
	animacion=true;
}

//área para teletransportar
if (!collision_circle(x, y, 164, objeto, false, false) and seguirPlayer==true) {
    if (timerTs-- <= 0) {
		move_x=0;
		estado="teletransportacion";   
		
    }
	
}
//teletransportar
if (teletrasportacion == true) {

    if (!instance_exists(obj_ts_control)) {
        instance_create_layer(objeto.x, objeto.y, "Instances", obj_ts_control);
    }
    
    if (instance_exists(obj_teletransportador)) {
       //cambiar posiciones
        x = obj_teletransportador.x;
        y = obj_teletransportador.y;
        
        //destruir instancias para que no interfieran en futuras teletransportaciones
        instance_destroy(obj_ts_control);
		instance_destroy(obj_teletransportador);
    }
	//reinicar datos
    teletrasportacion = false;
    timerTs = 100;
	
}









switch(estado){
	case "caminar":
	sprite_index=spr_cuervoN_caminar;
	break;
	case "ataque1":
	sprite_index=spr_cuervoN_ataque1;
	if (image_index >= image_number - 1) {
		animacion=true;
	}
	break;
	case "ataque2":
	sprite_index=spr_cuervoN_ataque3;
	if (image_index >= image_number - 1) {
		animacion=true;
	}
	break;
	
	case "teletransportacion":
	sprite_index=spr_cuervoN_teletransportacion;
	if (floor(image_index) == 11) {
		timerTs = 200;
		teletrasportacion = true;
	}

	if (image_index >= image_number - 1) {
		animacion=false;
	}
	break;	
}






















