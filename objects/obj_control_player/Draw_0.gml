/// @description Insert description here
// You can write your code in this editor

if(!instance_exists(obj_cambioPlayer)){
	
	draw_set_color(c_black);
	draw_set_alpha(alpha);
	draw_rectangle(0, 0, room_width, room_height, false);
}




if (oscuro) {
    alpha += speed;  // Aumentamos la opacidad (oscurecer)
    
    if (alpha >= 1) {
        alpha = 1;  // Asegurar que la pantalla está completamente oscura
    }
} 
else {
    alpha -= speed;  // Reducimos la opacidad (aclarar)
    if (alpha <= 0) {
        alpha = 0;  // Asegurar que la pantalla vuelve a la normalidad
    }
}

// Restaurar la opacidad para no afectar otros objetos
draw_set_alpha(1);
