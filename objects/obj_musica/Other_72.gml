/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if(audio_group_is_loaded(musicas))
{
	if(global.music_is_on)
	{
		audio_play_sound(music_playing, 1000, true, 0.3 * global.music_volume, 0, 2.5);
		controlar = true;
	}
}

if(audio_group_is_loaded(sfxaudios))
{
	sfx_loaded = true;
}