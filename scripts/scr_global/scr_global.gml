#region VARIÁVEIS
	
	enum TECLA
	{
		ESQUERDA,
		DIREITA,
		CAIR,
		PULAR,
		ACTION,
		INTERACT,
		RESET,
		BOLOTA,
		REX,
		FUMAS
	}


	global.pause = false;
	global.debug = false;
	global.selecionado = 0;
	global.guaxinim = 
	[
		obj_rex,
		obj_fumaca,
		obj_bolota
	]
	
	//----------------- TROCA DE CONTROLES
	global.array_controls =
	[
		ord("A"), //DIREITA
		ord("D"), //ESQUERDA
		ord("S"), //CAIR
		vk_space, // PULAR
		vk_shift, //HABILIDADE
		ord("F"), //INTERAGIR
		ord("R"), //RESETAR
		ord("3"), //BOLOTA
		ord("2"), //REX
		ord("1") //FUMAÇA
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

function pega_nome_tecla(_input = 0)
{
	if(_input == vk_space)
	{
		return "Espaço";
	}
	else if(_input == vk_shift)
	{
		return "Shift";
	}
	else if(_input == vk_tab)
	{
		return "Tab";
	}
	else if(_input == vk_left)
	{
		return "Esquerda";
	}
	else if(_input == vk_right)
	{
		return "Direita";
	}
	else if(_input == vk_up)
	{
		return "Cima";
	}
	else if(_input == vk_down)
	{
		return "Baixo";
	}
	else if(_input == vk_alt || _input == 164)
	{
		return "Alt";
	}
	else if(_input == vk_control || _input == 162 || _input = 163)
	{
		return "Ctrl";
	}
	else if(_input == vk_enter)
	{
		return "Enter";
	}
	else if(_input == vk_backspace)
	{
		return "Backspace";
	}
	else if(_input == 20)
	{
		return "Capslock";
	}
	else
	{
		return chr(_input);
	}
	
}
#endregion