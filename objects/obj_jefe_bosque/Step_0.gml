/// @description Insert description here
// You can write your code in this editor

 var anguloDireccion=point_direction(x,y,obj_player.x,obj_player.y);
 
 hsp=lengthdir_x(movespeed,anguloDireccion);
 
 
vsp+=grv;

if(place_meeting(x+hsp,y,obj_paredInvisible)){
    while(!place_meeting(x+sign(hsp),y,obj_paredInvisible)){
        x+=sign(hsp);
    }
    hsp=0;
}
x+=hsp;

if(place_meeting(x,y+vsp,obj_paredInvisible)){
    while(!place_meeting(x,y+sign(vsp),obj_paredInvisible)){
        y+=sign(vsp);
    }
    vsp=0;
}
y+=vsp;

if(hsp!=0){
    image_xscale=sign(hsp);
}