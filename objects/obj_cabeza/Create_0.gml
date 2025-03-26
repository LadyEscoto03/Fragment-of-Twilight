/// @description Insert description here
// You can write your code in this editor
target_x= irandom( camera_get_view_width(view_camera[0]));
target_y= irandom(camera_get_view_height(view_camera[0]));
dir=0;


madi=10;
clam=60;

wbody=instance_create_layer(x,y,"Instances",obj_cuerpo);
wbody.madi=madi-1;
wbody.parent=id;