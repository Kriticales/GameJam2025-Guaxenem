var _play = collision_rectangle(x - sprite_width, y - sprite_height, x + sprite_width, y + sprite_height, obj_player, false, true)
	
	if(_play)
	{
		_play.tem_dash += 1
		instance_destroy()
	}