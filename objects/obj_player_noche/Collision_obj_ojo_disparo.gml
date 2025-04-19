/// @description Insert description here
// You can write your code in this editor

//determinar si está de frente al disparo
var de_frente = false;

if(image_xscale == 1 && obj_ojo_disparo.x > x){
    de_frente = true;
}else if(image_xscale == -1 && obj_ojo_disparo.x < x){
    de_frente = true;
}

if(!(estado == "ataque_espada1" && de_frente)){
    vida -= 10;
    instance_destroy(obj_ojo_disparo);
}
