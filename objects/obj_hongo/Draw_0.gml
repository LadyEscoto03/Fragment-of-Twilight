/// @description Insert description here
// You can write your code in this editor
draw_self();

var bar_w = 32;
var bar_h = 2;
var bar_x1 = x - bar_w / 2;
var bar_y1 = y - sprite_height / 2-8;
var bar_x2 = bar_x1 + bar_w;
var bar_y2 = bar_y1 + bar_h;

scr_BarraVida(bar_x1, bar_y1, bar_x2, bar_y2, vida, vida_max);


