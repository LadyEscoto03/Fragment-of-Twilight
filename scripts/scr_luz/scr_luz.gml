// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_luz(objeto){
	if(instance_exists(objeto)){
		var _num=instance_number(objeto);
		for(var i=0;i<_num;i++){
			var _ins=instance_find(objeto,i);
			
				draw_set_alpha(.8);
				draw_circle(_ins.x,_ins.y,64+irandom(1),false);
				
				draw_set_alpha(.4);
				draw_circle(_ins.x,_ins.y,96+irandom(1),false);
				
		}
	}	
	
}