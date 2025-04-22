/// @description Insert description here
// You can write your code in this editor
draw_set_font(fnt_letra);
draw_set_halign(fa_left);
draw_set_valign(fa_top);
//dibujar el área en donde irán los créditos,rectangulo
draw_set_color(c_black);

draw_rectangle(0,display_get_height()-768,display_get_width(),display_get_height(),false);
draw_set_color(c_white);

//recorrer el arreglo de los créditos
for (var i=0;i<array_length(creditos_texto);i++) {
    draw_text((display_get_width()-string_width(creditos_texto[i]))/2,creditos_inicio+i*64,creditos_texto[i]);
}
creditos_inicio-=1.5;//velocidad de subida del texto

//los creditos pasaron, entonces mostrar un mensaje
if (creditos_inicio+(array_length(creditos_texto)*70)<0){
    draw_text((display_get_width()-string_width("¡Gracias por jugar Fragment of Twilight!"))/2,display_get_height()/2,"¡Gracias por jugar Fragment of Twilight!");
	smsFinal=true;
	
}

