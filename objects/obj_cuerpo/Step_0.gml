/// @description Insert description here
// You can write your code in this editor

if(create==true){
	if(madi>0){
		var wbody=instance_create_layer(x,y,"Instances",obj_cuerpo);
		wbody.madi=madi-1;
		wbody.parent=id;
	}
	create=false;
}

if(instance_exists(parent)){
	 clam=parent.clam-(parent.clam/50);
	var podir=point_direction(parent.x,parent.y,x,y);
	var angdiff=clamp(angle_difference(podir,parent.dir),-clam,clam);
	dir=parent.dir+angdiff;
	x=parent.x+lengthdir_x(sprite_height,dir);
	y=parent.y+lengthdir_y(sprite_height,dir);
}else{
	
if(abs(x-target_x)<50 and abs(y-target_y)<50){
	target_x= irandom( camera_get_view_width(view_camera[0]));
	target_y= irandom(camera_get_view_height(view_camera[0]));
}

if(x!=target_x){
	x-=(x-target_x)/30;
}
if(y!=target_y){
	y-=(y-target_y)/30;
}

dir=point_direction(target_x,target_y,x,y);

}
image_angle=dir+90;




if(place_meeting(x,y,obj_cuervoDia)){
	instance_destroy();

}












