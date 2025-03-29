/// @description Insert description here
// You can write your code in this editor

randomize(); 
alarma_seleccionada = irandom(3); 

for (var i = 0; i <3; i++) {
    alarm[i] = -1;
}

alarm[alarma_seleccionada] = 60; 
