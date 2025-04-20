/// @description Insert description here
// You can write your code in this editor
var frente = false;

if(image_xscale == 1 && obj_semilla.x > x){
    frente = true;
}else if(image_xscale == -1 && obj_semilla.x < x){
    frente = true;
}

if(!(estado == "ataque_espada1" && frente)){
    vida -= 10;
    instance_destroy(obj_semilla);
}
