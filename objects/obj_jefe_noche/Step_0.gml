/// @description Insert description here
// You can write your code in this editor

if(!instance_exists(obj_InicioJefe)){
	
	
	if((place_meeting(x,y,obj_player_noche) and  obj_player_noche.estado="ataque_espada1")and danio--<=0){
		vida-=10;
		danio=50;
	}
	if(vida<=0){
		estado="muerte";
	}
	
	
	
if(estado=="hechizo"){
    tiempo_hechizo--; 
    if(tiempo_hechizo<=0){
        estado="caminar";
        tiempo_hechizo=60;
        ataque=false;
    }
} else {
    if (!collision_circle(x,y,75,obj_player_noche,false,false)) {
        if(tem>0){
			tem--;
		}

        if(tem<=0 and !instance_exists(obj_bulletRandom) and !instance_exists(obj_controladorBullet)){
            estado="hechizo";
            tem=300;
        }else{
			estado="caminar";
        }
    }else if(collision_circle(x,y,46,obj_player_noche,false,false)and enEspada--<=0){
        estado="espada";
		movespeed=0;
		
    }
}



switch (estado) {
    case "hechizo":
        sprite_index = spr_jefe_noche_hechizo;
        if (ataque==false and(floor(image_index)==6)) { 
			var num=choose(1,2);
			switch(num){
				case 1:
				for(var i=0;i<5;i++){
					var direccion =irandom_range(0,360);
					var ejeX=obj_player_noche.x+lengthdir_x(96,direccion);
					var ejeY=obj_player_noche.y+lengthdir_y(96,direccion);
					instance_create_layer(ejeX,ejeY,"Instances",obj_circulos_random);
				}
				 
				break;
				
				case 2:
				instance_create_layer(obj_player_noche.x,obj_player_noche.y-64,"Instances",obj_circulos_360);
				
				break;
			}
           
            ataque=true;
        }
        break;

    case "caminar":
	movespeed=1.5;
	sprite_index = spr_jefe_noche_caminar;
	break;

    case "espada":
	if (sprite_index != spr_jefe_noche_ataqueEspada) {
            sprite_index = spr_jefe_noche_ataqueEspada;
            image_index = 0;
	}
	
	if(image_index>=image_number-1){
		enEspada=60;
		estado="espera";
		image_index=0;
	}
	break;
	case "espera":
	sprite_index=spr_jefe_noche_idle;
	break;
	
	case "muerte":
	sprite_index=spr_jefe_noche_muerte;
	
	break;
}


var anguloDireccion=point_direction(x,y,obj_player_noche.x,obj_player_noche.y);

// Si NO está en estado "hechizo", puede moverse
if (estado != "hechizo") {
    hsp = lengthdir_x(movespeed, anguloDireccion);
} else {
    hsp = 0; // Se queda quieto mientras lanza el hechizo
}

vsp+=grv;

if(place_meeting(x+hsp,y,obj_paredInvisible)){
    while(!place_meeting(x+sign(hsp),y,obj_paredInvisible)){
        x+=sign(hsp);
    }
    hsp=0;
}
if (collision_circle(x, y, 24, obj_player_noche, false, false)) {
    var angulo = point_direction(x, y, obj_player_noche.x, obj_player_noche.y) + 180;
    x+=lengthdir_x(1, angulo);
}else{
	x+=hsp;
}


if(place_meeting(x,y+vsp,obj_paredInvisible)){
    while(!place_meeting(x,y+sign(vsp),obj_paredInvisible)){
        y+=sign(vsp);
    }
    vsp=0;
}
y+=vsp;

if(hsp!=0){
    image_xscale=sign(hsp);
}
}
