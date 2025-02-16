global.niveis =
[
	true,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false,
	false
]

global.music_volume = 1;
global.sfx_volume = 1.5;
global.music_is_on = true;

function save()
{
	if(file_exists("save.guaxinim")) file_delete("save.guaxinim")
	
	ini_open("save.guaxinim");
		
		//salvar as teclas do jogador
		
		for(var _i = 0; _i < array_length(global.array_controls); _i++)
		{
			var _key = "controle" + string(_i);
			ini_write_real("CONTROLES", _key, global.array_controls[_i])
		}
		
		//salvar os níveis concluidos
		
		for(var _i = 0; _i < array_length(global.niveis); _i++)
		{
			var _key = "nivel" + string(_i);
			ini_write_real("FASES", _key, global.niveis[_i])
		}
		
		//salvar o volume da musica e SFX
		ini_write_real("AUDIO", "music_volume", global.music_volume);
		ini_write_real("AUDIO", "music_on", global.music_is_on);
		ini_write_real("AUDIO", "sfx_volume", global.sfx_volume);
		
	ini_close()
}

function load()
{
	if(file_exists("save.guaxinim"))
	{
		ini_open("save.guaxinim")
		
		//carrega os controles
		for(var _i = 0; _i < array_length(global.array_controls); _i++)
		{
			var _key = "controle" + string(_i);
			global.array_controls[_i] = ini_read_real("CONTROLES", _key, global.array_controls[_i])
		}
		
		//carrega os níveis
		for(var _i = 0; _i < array_length(global.niveis); _i++)
		{
			var _key = "nivel" + string(_i);
			global.niveis[_i] = ini_read_real("FASES", _key, global.niveis[_i])
		}
		
		//carrega dados de audio
		global.music_volume = ini_read_real("AUDIO", "music_volume", 0);
		global.music_is_on = ini_read_real("AUDIO", "music_on", 0);
		global.sfx_volume = ini_read_real("AUDIO", "sfx_volume", 0);
		
		ini_close()
	}
}

load();