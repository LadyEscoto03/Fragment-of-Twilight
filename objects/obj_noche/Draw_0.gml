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
	
	scr_luz(obj_luz);
	scr_luz(obj_ojo_disparo);
	scr_luz(obj_fantasma_ataque);
	scr_luz(obj_bulletRandom);
	scr_luz(obj_bullet);
	scr_luz(obj_circulos_360);
	scr_luz(obj_circulos_random);
	scr_luz(obj_agisFinal);
	scr_luz(obj_vida);
	scr_luz(obj_cuervoEnemigoDia);
	scr_luz(obj_disparoHongo);
	scr_luz(obj_hongo);
	scr_luz(obj_semilla);
	scr_luz(obj_cristal);
	scr_luz(obj_lava);
	if(room_get_name(room)=="rm_nivel3"){
		scr_luz(obj_player);
		scr_luz(obj_player_noche);
	}
	

	draw_set_alpha(.9);
	gpu_set_blendmode(bm_normal);
	draw_set_alpha(1);
	surface_reset_target();
}else{
	
	sombra_superficie=surface_create(room_width,room_height);
}

draw_surface(sombra_superficie,0,0);