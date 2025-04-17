// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_BarraVida(_x1,_y1,_x2,_y2,_current,_max){
	if (_max > 0 && _current > 0) {
        var _percent = clamp(_current / _max, 0, 1);
        draw_healthbar(_x1, _y1, _x2, _y2, _percent * 100, c_black, c_red, c_lime, c_white, false, true);
    }

}