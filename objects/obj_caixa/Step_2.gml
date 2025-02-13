#region MOVIMENTAÇÃO VERTICAL

	//--------------COLISÕES
	if(place_meeting(x, y + velv, obj_solido))
	{
		while(!place_meeting(x, y + sign(velv), obj_solido))
		{
			y += sign(velv);
		}
		velv = 0;
	}
	
	if(place_meeting(x, y + velv, obj_caixa))
	{
		while(!place_meeting(x, y + sign(velv), obj_caixa))
		{
			y += sign(velv);
		}
		velv = 0;
	}
	
	if(place_meeting(x, y + velv, obj_player))
	{
		while(!place_meeting(x, y + sign(velv), obj_player))
		{
			y += sign(velv);
		}
		velv = 0;
	}

	//--------------APLICANDO VELOCIDADE
	y += velv;
#endregion

#region MOVIMENTAÇÃO HORIZONTAL

	//--------------COLISÕES
	if(place_meeting(x + velh, y, obj_solido))
	{
		while(!place_meeting(x + sign(velh), y, obj_solido))
		{
			x += sign(velh);
		}
		velh = 0;
	}
	if(place_meeting(x + velh, y, obj_caixa))
	{
		while(!place_meeting(x + sign(velh), y, obj_caixa))
		{
			x += sign(velh);
		}
		velh = 0;
	}	
	if(place_meeting(x + velh, y, obj_player))
	{
		while(!place_meeting(x + sign(velh), y, obj_player))
		{
			x += sign(velh);
		}
		velh = 0;
	}	
	//--------------APLICANDO VELOCIDADE
	x += velh
#endregion

var _play = collision_rectangle(x+6-(sprite_width/2), y-5- (sprite_height/2), x-6+(sprite_width/2), y+(sprite_height/2), obj_player, false, true)
	if(_play)
	{
		if(_play.estado == STATE.SMASH)
		{
			instance_destroy()
			
			var _smash = irandom_range(10, 30)
			for(var i = 0; i < _smash; i++)
			{
				var xx = random_range(x - sprite_width/2, x + sprite_width/2)
		
				instance_create_depth(xx, y, -100, obj_fragmento)
			}
		}
	}
	
	_play = collision_rectangle(x-5- (sprite_width/2), y- (sprite_height/2), x+5+ (sprite_width/2), y+ (sprite_height/2), obj_player, false, true)
	
	if(_play)
	{
		if(_play.estado == STATE.DASH)
		{
			instance_destroy()
			
			var _smash = irandom_range(10, 30)
			for(var i = 0; i < _smash; i++)
			{
				var xx = random_range(x - sprite_width/2, x + sprite_width/2)
		
				instance_create_depth(xx, y, -100, obj_fragmento)
			}
		}
	}
	