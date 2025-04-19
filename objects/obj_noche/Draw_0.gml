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
	
	//luciérnagas
	if(instance_exists(obj_luz)){
		var _num=instance_number(obj_luz);
		for(var i=0;i<_num;i++){
			var _ins=instance_find(obj_luz,i);
			
				draw_set_alpha(.8);
				draw_circle(_ins.x,_ins.y,64+irandom(1),false);
				
				draw_set_alpha(.4);
				draw_circle(_ins.x,_ins.y,96+irandom(1),false);
				
		}
	}	
	//disparo del ojo
	if(instance_exists(obj_ojo_disparo)){
		var _num=instance_number(obj_ojo_disparo);
		for(var i=0;i<_num;i++){
			var _ins=instance_find(obj_ojo_disparo,i);
			
				draw_set_alpha(.8);
				draw_circle(_ins.x,_ins.y,64+irandom(1),false);
				
				draw_set_alpha(.4);
				draw_circle(_ins.x,_ins.y,96+irandom(1),false);
				
		}
	}	
	//ataque del fantasma
	if(instance_exists(obj_fantasma_ataque)){
		var _num=instance_number(obj_fantasma_ataque);
		for(var i=0;i<_num;i++){
			var _ins=instance_find(obj_fantasma_ataque,i);
			
				draw_set_alpha(.8);
				draw_circle(_ins.x,_ins.y,64+irandom(1),false);
				
				draw_set_alpha(.4);
				draw_circle(_ins.x,_ins.y,96+irandom(1),false);
				
		}
	}	
	if(instance_exists(obj_bulletRandom)){
		var _num=instance_number(obj_bulletRandom);
		for(var i=0;i<_num;i++){
			var _ins=instance_find(obj_bulletRandom,i);
			
				draw_set_alpha(.8);
				draw_circle(_ins.x,_ins.y,64+irandom(1),false);
				
				draw_set_alpha(.4);
				draw_circle(_ins.x,_ins.y,96+irandom(1),false);
				
		}
	}	
	if(instance_exists(obj_bullet)){
		var _num=instance_number(obj_bullet);
		for(var i=0;i<_num;i++){
			var _ins=instance_find(obj_bullet,i);
			
				draw_set_alpha(.8);
				draw_circle(_ins.x,_ins.y,64+irandom(1),false);
				
				draw_set_alpha(.4);
				draw_circle(_ins.x,_ins.y,96+irandom(1),false);
				
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