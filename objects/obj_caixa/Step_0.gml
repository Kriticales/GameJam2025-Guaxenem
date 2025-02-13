if(gravit)
{
	velv += grav
}

velv = clamp(velv, -max_velv, max_velv)

var _plat = instance_place(x, y + max_velv, obj_plataforma);


if(_plat && bbox_bottom <= _plat.bbox_top + 1)
{
	if(place_meeting(x, y + velv, obj_plataforma))
	{
		while(!place_meeting(x, y + sign(velv), obj_plataforma))
		{
			y += sign(velv);
		}
		velv = 0;
		
		if(!held)
		{
			if(!place_meeting(x + _plat.velh, y, obj_solido))
			{
				x += _plat.velh
			}
			
			if(place_meeting(x + _plat.velh, y, obj_player))
			{
				var _play = instance_place(x + _plat.velh, y, obj_player);
				
				_play.x += _plat.velh;
			}
		}
			
	}
}

if(!trampolim)
{
	velv = clamp(velv, -max_velv, max_velv)
}