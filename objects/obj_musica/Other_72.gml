/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if(audio_group_is_loaded(musicas))
{
	audio_play_sound(music_playing, 1000, true, 0.2, 0, 2.5);
	controlar = true;
}

if(audio_group_is_loaded(sfxaudios))
{
	sfx_loaded = true;
}