/// @description Insert description here
// You can write your code in this editor


draw_self();


// Obtener la posición del jugador
var x_player = x;
var y_player = y;

// Definir la longitud de las líneas
var line_length = 64;

// Calcular posiciones basadas en image_angle
var x_right = x_player + lengthdir_x(line_length, image_angle);
var y_right = y_player + lengthdir_y(line_length, image_angle);

var x_left = x_player + lengthdir_x(line_length, image_angle + 180);
var y_left = y_player + lengthdir_y(line_length, image_angle + 180);

// Dibujar las líneas
draw_set_color(c_red);
draw_line(x_player, y_player, x_right, y_right); // Línea derecha

draw_set_color(c_blue);
draw_line(x_player, y_player, x_left, y_left);   // Línea izquierda
