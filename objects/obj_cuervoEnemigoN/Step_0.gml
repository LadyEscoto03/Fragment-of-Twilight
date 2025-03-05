
/// @description Insert description here
// You can write your code in this editor

//aplicar el movimiento seguiendo al player
if(instance_exists(obj_player)){
	
	//linea derecha 
	if(collision_line(x,y,x+lengthdir_x(64, image_angle),y + lengthdir_y(64, image_angle),obj_player,false,false)){
		//show_message("derecha");
		seguirPlayer=true;
	} else if(collision_line(x,y,x+lengthdir_x(64, image_angle+180),y + lengthdir_y(64, image_angle+180),obj_player,false,false)){
		seguirPlayer=true;
	}
	if(seguirPlayer==true){
		if(moverAbajoPared==false){
			if(obj_player.x>x){
				move_x=vel;//derecha
				image_xscale=1;
			}else if(obj_player.x<x){
				move_x=-vel;//izquierda
				image_xscale=-1;
			}else if(obj_player.x==x){
				move_x=0;
			}
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


if(collision_circle(x,y,24,obj_player,false,false)){
	if(animacion==true){
		animacion=false;
		var num=choose(1,2,3);
		switch(num){
			case 1:
			estado="ataque1";
			break;
			case 2:
			estado="ataque2";
			break;
			case 3:
			estado="ataque3";
			teletrasportacion=true;
			break;
		}
	}	
}else{
	estado="caminar";
	animacion=true;
}

if(teletrasportacion==true){
	var player = instance_find(obj_player, 0);

	if(player!=noone){
	
		var distancia=28;
		var tp_x,tp_y;
	
	
		if(player.image_xscale==-1){
		
			tp_x=player.x+distancia;
		
		}else if(player.image_xscale==1){
			tp_x=player.x-distancia;
		}
	
		tp_y = player.y;
	
		if (!place_meeting(tp_x, tp_y, obj_player)) {
 
			x = tp_x;
			y = tp_y;
		}	
	}
	
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
	case "ataque3":
	sprite_index=spr_cuervoN_ataque3;
	if (image_index >= image_number - 1) {
		animacion=true;
		teletrasportacion=false;
	}
	break;

	
	
}






















