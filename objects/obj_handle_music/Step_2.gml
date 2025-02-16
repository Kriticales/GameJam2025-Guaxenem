image_blend = c_white;
switch(tipo)
{
	case "MUSICA":
		if(obj_musica.controlar)
		{
			var _is_click = mouse_check_button(mb_left);
	
			if(_is_click && collision_point(mouse_x, mouse_y, id, false, false) != noone && !held)
			{
				xscale = 0.7;
				yscale = 0.7;
				held = true;
			}
			if(held)
			{
				var _dir = point_direction(x, y, mouse_x, mouse_y)
				var _len = distance_to_point(mouse_x, mouse_y)
				var _go = lengthdir_x(_len, _dir)
				x += _go
				x = clamp(mouse_x, 277, 310);
		
				if(!_is_click)
				{
					held = false;
				}
			}
	
			with(obj_musica)
			{
				music_volume = ((other.x-277) / (310-277)) * 2;
				audio_group_set_gain(musicas, music_volume, 0)
			}
		}
		else
		{
			image_blend = c_dkgray;
		}
	break;
	case "SFX":
		if(obj_musica.sfx_loaded)
		{
			var _is_click = mouse_check_button(mb_left);
	
			if(_is_click && collision_point(mouse_x, mouse_y, id, false, false) != noone && !held)
			{
				xscale = 0.7;
				yscale = 0.7;
				held = true;
			}
			if(held)
			{
				var _dir = point_direction(x, y, mouse_x, mouse_y)
				var _len = distance_to_point(mouse_x, mouse_y)
				var _go = lengthdir_x(_len, _dir)
				x += _go
				x = clamp(mouse_x, 277, 310);
		
				if(!_is_click)
				{
					held = false;
				}
			}
	
			with(obj_musica)
			{
				sfx_volume = ((other.x-277) / (310-277)) * 2;
				audio_group_set_gain(sfxaudios, sfx_volume, 0)
			}
		}
		else
		{
			image_blend = c_dkgray;
		}
	break;
}

	xscale = lerp(xscale, image_xscale, 0.1)
	yscale = lerp(yscale, image_yscale, 0.1)