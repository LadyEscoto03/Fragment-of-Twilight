/// @description Insert description here
// You can write your code in this editor

if(abs(x-target_x)<50 and abs(y-target_y)<50){
	target_x= irandom(camera_get_view_width(view_camera[0]));
	target_y= irandom(camera_get_view_height(view_camera[0]));
}

if(x!=target_x){
	x-=(x-target_x)/30;
}
if(y!=target_y){
	y-=(y-target_y)/30;
}

dir=point_direction(target_x,target_y,x,y);
image_angle=dir+90;



if(place_meeting(x,y,obj_cuervoDia)){
	instance_destroy();
}
