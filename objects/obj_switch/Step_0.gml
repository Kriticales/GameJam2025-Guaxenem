var _play = collision_rectangle(x - sprite_width, y - sprite_height, x + sprite_width, y + sprite_height, obj_player, false, true)
	
	if(_play && _play.object_index = global.guaxinim[global.selecionado] && !switched)
	{
		if(keyboard_check_pressed(ord("F")))
		{
			image_speed = 1;
		}
		if(image_speed = 1)
		{
			if(image_index >= image_number-2)
			{
				with(obj_solido_switch)
				{
					if(controle == other.bloco_linkado)
					{
						active = !active;
					}
				}
				switched = true;
				image_index = image_number-1
				image_speed = 0;
			}
		}
	}