#region VARIÁVEIS
	global.debug = false;
	global.sound_volume = 1;
	global.selecionado = 0;
	global.guaxinim = 
	[
		obj_rex,
		obj_bolota,
		obj_fumaca
	]
#endregion

#region FUNÇÕES

function play_jump()
{
	var _pitch = random_range(0.9, 1.1)
	audio_play_sound(snd_jump, 0, 0, 1,  0, _pitch)
}

function play_dash()
{
	var _pitch = random_range(0.9, 1.1)
	audio_play_sound(snd_dash, 0, 0, 1,  0, _pitch)
}

function play_footstep()
{
	var _pitch = random_range(0.5, 0.6)
	audio_play_sound(snd_footstep, 0, 0, 1,  0, _pitch)
}

function play_damage()
{
	var _pitch = random_range(0.9, 1.1)
	var _pitch2 = random_range(1.2, 1.3)
	audio_play_sound(snd_damage1, 0, 0, 1,  0, _pitch)
	audio_play_sound(snd_damage2, 0, 0, 1,  0, _pitch2)
}

function play_landing()
{
	var _pitch = random_range(0.9, 1.1)
	audio_play_sound(snd_landing, 0, 0, 1,  0, _pitch)
}

function play_pushing()
{
	var _pitch = 0.8
	audio_play_sound(snd_pushing, 0, 0, 0.4,  0, _pitch)
}

function play_bolota()
{
	var _pitch = random_range(0.9, 1.1)
	audio_play_sound(snd_bolota, 0, 0, 0.8,  0, _pitch)
}

function play_smash()
{
	var _pitch = random_range(0.7, 0.8)
	audio_play_sound(snd_bolota_smash, 0, 0, 0.6,  0, _pitch)
}

function play_pickup()
{
	var _pitch = random_range(1.3, 1.4)
	audio_play_sound(snd_pickup, 0, 0, 1,  0, _pitch)
}
function play_win()
{
	var _pitch = random_range(1.3, 1.4)
	audio_play_sound(snd_win, 0, 0, 1,  0, _pitch)
}
#endregion