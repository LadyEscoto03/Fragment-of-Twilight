/// @description Insert description here
// You can write your code in this editor


if(estado=="hechizo"){
    tiempo_hechizo--; 
    if(tiempo_hechizo<=0){
        estado="caminar";
        tiempo_hechizo=60;
        ataque=false;
    }
} 
else {
    if (!collision_circle(x,y,82,obj_player,false,false)) {
        if(tem>0){
			tem--;
		}

        if(tem<=0){
            estado="hechizo";
            tem=300;
        }else{
			estado="caminar";
        }
    }else if(collision_circle(x,y,46,obj_player,false,false)) {
        estado="espada";
    }
}

switch (estado) {
    case "hechizo":
	
        sprite_index = spr_jefe_noche_hechizo;
        if (ataque==false and(floor(image_index)==6)) { 
            instance_create_layer(x,y,"lanzamientos",obj_circulos);
            ataque=true;
        }
        break;

    case "caminar":
        sprite_index = spr_jefe_noche_caminar;
        break;

    case "espada":
        sprite_index = spr_jefe_noche_ataqueEspada;
        break;
}


var anguloDireccion=point_direction(x,y,obj_player.x,obj_player.y);

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
if (collision_circle(x, y, 32, obj_player, false, false)) {
    var angulo = point_direction(x, y, obj_player.x, obj_player.y) + 180;
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