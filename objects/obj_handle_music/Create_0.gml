
switch(tipo)
{
	case "MUSICA":	
		x = 277 + (16.5 * obj_musica.music_volume)
	break;
	case "SFX":	
		x = 277 + (16.5 * obj_musica.sfx_volume)
	break;
}

xscale = image_xscale;
yscale = image_yscale;
held = false;



