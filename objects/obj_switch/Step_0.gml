var _play = collision_rectangle(x - sprite_width, y - sprite_height, x + sprite_width, y + sprite_height, obj_player, false, true)
	
	if(_play && _play.object_index = global.guaxinim[global.selecionado])
	{
		if(keyboard_check_pressed(ord("F")))
		{
			bloco_linkado.active = !bloco_linkado.active;
		}
	}
