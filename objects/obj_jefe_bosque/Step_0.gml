/// @description Insert description here
// You can write your code in this editor
if (!collision_circle(x, y, 96, obj_player, false, false) && temporizadorAtaqueLargo-- <= 0) {
    estado = "ataqueLargo";
    ataque = false;
    temporizadorAtaqueLargo = 150; // Resetear temporizador
} else if (estado != "ataqueLargo") {
    estado = "caminar";
}

switch (estado) {
    case "ataqueLargo":
        if (sprite_index != spr_jefe_hechizo) {
            sprite_index = spr_jefe_hechizo;
            image_index = 0;
        }

        if (!ataque) {
            instance_create_layer(x, y, "Instances", obj_ataqueJefeBosque);
            ataque = true;
        }

        if (image_index >= image_number - 1) {
            estado = "caminar";
            ataque = false;
        }
        break;

    case "caminar":
        sprite_index = spr_jefe_caminando;
        break;
}


var anguloDireccion=point_direction(x,y,obj_player.x,obj_player.y);

hsp=lengthdir_x(movespeed,anguloDireccion);
vsp+=grv;

if(place_meeting(x+hsp,y,obj_paredInvisible)){
    while(!place_meeting(x+sign(hsp),y,obj_paredInvisible)){
        x+=sign(hsp);
    }
    hsp=0;
}
x+=hsp;

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