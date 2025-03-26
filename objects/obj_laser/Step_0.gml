/// @description Insert description here
// You can write your code in this editor
dir=point_direction(x,y,obj_player.x,obj_player.y);
image_angle=dir;
image_xscale=1;

while(!place_meeting(x,y,obj_paredInvisible)){
	image_xscale+=1;
	
}

beam.x=x+lengthdir_x(image_xscale,dir);
beam.y=y+lengthdir_y(image_xscale,dir);