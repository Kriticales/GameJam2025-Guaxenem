var _play = collision_rectangle(x - sprite_width/2, y - sprite_height/2, x + sprite_width/2, y + sprite_height/2, obj_player, false, true)
	
	if(_play && visible)
	{
		play_pickup()
		_play.tem_dash += 1
		visible = false;
		alarm[0] = 120;
		_play.pop_dash = true;
	}