/// @description Insert description here
// You can write your code in this editor

if(surface_exists(sombra_superficie)){
	
	surface_set_target(sombra_superficie);
	
	draw_set_alpha(.9);
	draw_set_color(c_black);
	
	draw_rectangle(0,0,room_width,room_height,false);

	draw_set_color(c_white);
	draw_set_alpha(1);
	
	gpu_set_blendmode(bm_subtract);
	
	if(instance_exists(obj_luz)){
		var _num=instance_number(obj_luz);
		for(var i=0;i<_num;i++){
			var _ins=instance_find(obj_luz,i);
			
				draw_set_alpha(.8);
				draw_circle(_ins.x,_ins.y,24+irandom(1),false);
				
				draw_set_alpha(.4);
				draw_circle(_ins.x,_ins.y,32+irandom(1),false);
				
		}
	}	
	draw_set_alpha(.9);
	gpu_set_blendmode(bm_normal);
	draw_set_alpha(1);
	surface_reset_target();
}else{
	
	sombra_superficie=surface_create(room_width,room_height);
}

draw_surface(sombra_superficie,0,0);