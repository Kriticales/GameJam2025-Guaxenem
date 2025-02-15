var _play = collision_rectangle(x - sprite_width, y - sprite_height, x + sprite_width, y + sprite_height, obj_player, false, true)
	
	if(_play && _play.object_index = global.guaxinim[global.selecionado] && !switched)
	{
		if(keyboard_check_pressed(ord("F")))
		{
			image_speed = 1;
		}
	}
	
if(image_speed == 1)
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
		with(obj_death_switch)
		{
			if(link == other.bloco_linkado)
			{
				active = !active;
			}
		}
		alarm[0] = 230;
		switched = true;
		image_index = image_number-1
		image_speed = 0;
	}
}

if(image_speed == -1)
	{
		if(image_index <= 1)
		{
			switched = false;
			image_index = 0;
			image_speed = 0;
			with(obj_solido_switch)
			{
				if(controle == other.bloco_linkado)
				{
					active = !active;
				}
			}
			with(obj_death_switch)
			{
				if(link == other.bloco_linkado)
				{
					active = !active;
				}
			}
		}
	}