xscale = 0.7;
yscale = 0.7;

if(toggled)
{
	with(obj_musica)
	{
		controlar = false;
		audio_stop_sound(music_playing)
	}
	toggled = false;
	global.music_is_on = false;
}
else
{
	with(obj_musica)
	{
		controlar = true;
		audio_play_sound(music_playing, 0, true, 0.3 * global.music_volume, 0, 2.5)
	}
	toggled = true;
	global.music_is_on = true;
}