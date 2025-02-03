/// @description Insert description here
// You can write your code in this editor

draw_circle(x,y,160,true);

var alpha_valor=pared ? 0.3:1;

// Dibuja el sprite con alpha personalizado
draw_sprite_ext(sprite_index, image_index,x,y,image_xscale,image_yscale,image_angle,c_white,alpha_valor);
