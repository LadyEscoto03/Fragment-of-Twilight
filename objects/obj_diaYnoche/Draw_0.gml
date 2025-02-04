/// @description Insert description here
// You can write your code in this editor


if(surface_exists(surface_light)){
	
	surface_set_target(surface_light);
	
	draw_clear_alpha(c_black, 0);
	draw_set_alpha(alpha);
	draw_rectangle(0,0,room_width, room_height,false);
	draw_set_color(c_white);
	draw_set_alpha(1);
	
	//if(object_exists(obj_player)){
	//	draw_text(obj_player.x, obj_player.y, string(alpha));
	//}else if(object_exists(obj_player_noche)){
	//	draw_text(obj_player_noche.x, obj_player_noche.y, string(alpha));
	//}
	
	
	gpu_set_blendmode(bm_subtract);
	
	
	draw_set_color(c_black);
	
	if(instance_exists(obj_luz)){
		var _num=instance_number(obj_luz);
		
		for(var i=0;i<_num;i++){
			var _inst=instance_find(obj_luz,i);
			draw_set_alpha(.9);
			draw_circle(_inst.x,_inst.y,24+irandom(1),false);
			draw_set_alpha(0.5);
			draw_circle(_inst.x,_inst.y,32+irandom(1),false);
		}
		
		
	}
	gpu_set_blendmode(bm_normal);
	
	draw_set_alpha(1); 
	
	surface_reset_target();
	
}else{
	surface_light = surface_create(room_width, room_height);
}
draw_surface(surface_light,0,0);