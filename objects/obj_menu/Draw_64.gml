/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_white);//color de letra
var dist=55;//distancia entre las opciones
var gui_largo=display_get_gui_width();
var gui_alto=display_get_gui_height();
//mitad del gui
var x1=gui_largo/2;
var y1=gui_alto/2;
//dibuja el título
draw_text(display_get_width()/5,336,"Fragment of Twilight");
//despliega y escribe las opciones
for(var i=0;i<op_max;i++){
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	//según la opción seleccionada, se dentrá un color
	if(index==i){
		draw_set_color(c_red);
		
	}else{
		draw_set_color(c_white);
	}
	draw_text(1036,333+(dist*i),opciones[i]);//dibja las opciones
}
draw_set_font(-1);