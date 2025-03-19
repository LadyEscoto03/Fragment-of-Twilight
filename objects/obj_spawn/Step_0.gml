/// @description Insert description here
// You can write your code in this editor



var num = irandom_range(1, 50);
var makeThis;

// Si el número es menor a 20
if (num < 20) {
    // Obtiene la posición y tamaño de la vista actual
    var cam_x = camera_get_view_x(view_camera[0]);
    var cam_y = camera_get_view_y(view_camera[0]);
    var cam_w = camera_get_view_width(view_camera[0]);

    // Genera una posición X aleatoria dentro del ancho de la vista
    var xp = irandom_range(cam_x, cam_x + cam_w);
    // Genera la posición Y justo arriba del viewport
    var yp = cam_y - 50;

    // Decide qué objeto crear
    var r = irandom_range(1, 2);
    if (r == 1) {
        makeThis = obj_dropper_n;
    }
    if (r == 2) {
        makeThis = obj_dropper_semilla;
    }

    // Crea el objeto en la capa "Instances"
    var abc = instance_create_layer(xp, yp, "Instances", makeThis);

    // Velocidad y dirección de caída
    abc.speed = 12;
    abc.direction = 270;
}

if(instance_number(obj_dropper_semilla)+instance_number(obj_dropper_n)==15){
	instance_destroy();
}