/// @description Insert description here
// You can write your code in this editor

draw_set_color(c_white);//color de letra
var dist=100;//distancia entre las opciones
var gui_largo=display_get_gui_width();//largo del gui
var gui_alto=display_get_gui_height();//ancho del gui
//mitad del gui
var x1=gui_largo/2;
var y1=gui_alto/2;
//dibuja el título
draw_text(display_get_width()/2.8,148,"GAME OVER");
draw_text(display_get_width()/2.8,300,string("Puntaje:  ")+string(score));
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
	draw_text(x1,450+(dist*i),opciones[i]);//dibja las opciones
}
draw_set_font(-1);