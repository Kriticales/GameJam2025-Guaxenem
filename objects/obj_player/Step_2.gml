#region MOVIMENTAÇÃO VERTICAL

	//--------------COLISÕES
	if(place_meeting(x, y + velv, obj_player))
	{
		var _player = instance_place(x, y + velv, obj_player);
		
		if(_player.estado == STATE.TRAMPOLIM)
		{
			velv = -(max_velv * bolota_jump_force);
			_player.xscale = 1.3 * _player.facing;
			_player.yscale = 0.7;
			trampolim = true;
		}
		else
		{
			while(!place_meeting(x, y + sign(velv), obj_player))
			{
				y += sign(velv);
			}
			velv = 0;
		}
	}
	
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
	if(place_meeting(x + velh, y, obj_player))
	{
		while(!place_meeting(x + sign(velh), y, obj_player))
		{
			x += sign(velh);
		}
		velh = 0;
	}
	if(estado != STATE.HOLD)
	{
		if(place_meeting(x + velh, y, obj_caixa))
		{
			while(!place_meeting(x + sign(velh), y, obj_caixa))
			{
				x += sign(velh);
			}
			velh = 0;
		}	
	}
	//--------------APLICANDO VELOCIDADE
	x += velh
#endregion