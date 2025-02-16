var _reset = keyboard_check_pressed(global.array_controls[TECLA.RESET])
var _rex = keyboard_check_pressed(global.array_controls[TECLA.REX])
var _fumaca = keyboard_check_pressed(global.array_controls[TECLA.FUMAS])
var _bolota = keyboard_check_pressed(global.array_controls[TECLA.BOLOTA])

if(_reset)
{
	room_restart()
}

if(rex && _rex)
{
	global.selecionado = 0
}
else if(fumaca && _fumaca)
{
	global.selecionado = 1
}
else if(bolota && _bolota)
{
	global.selecionado = 2
}


//Checando se o player existe
if (instance_exists(global.guaxinim[global.selecionado])) //Checando se o player existe
{
    alvo = global.guaxinim[global.selecionado];
}

//Seguindo o player
x = lerp(x, alvo.x, 0.1)
y = lerp(y, alvo.y, 0.1)

//Pegando valores da camera
var _larg_camera = camera_get_view_width(view_camera[0])
var _alt_camera = camera_get_view_height(view_camera[0])

//Convertendo os valores da Room para o X e Y da camera
var _cam_x = x - _larg_camera / 2
var _cam_y = y - _alt_camera / 2

//Limitando a camera
_cam_x = clamp(_cam_x, 0, room_width - _larg_camera)
_cam_y = clamp(_cam_y, 0, room_height - _alt_camera)

//Alterando a posição da camera
camera_set_view_pos(view_camera[0], _cam_x, _cam_y)