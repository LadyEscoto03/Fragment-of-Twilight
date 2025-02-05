/// @description Insert description here
// You can write your code in this editor
radio_inicial+=radio_crecimiento;

alpha-=0.02;

if(radio_inicial>=64 or alpha<=0){
    instance_destroy();
}
