#region MOVIMENTAÇÃO VERTICAL

	//--------------COLISÕES
	var _plat = instance_place(x, y + max(1, velv), obj_plataforma);
	
	var _desce = keyboard_check(vk_down) || keyboard_check(ord("S"))
	if(!_desce)
	{
		if(velv > 0 && _plat && (bbox_bottom <= _plat.bbox_top + 1) && bbox_top <= _plat.bbox_top)
		{
			if(place_meeting(x, y + max(1, velv), obj_plataforma))
			{
				while(!place_meeting(x, y + sign(velv), obj_plataforma))
				{
					y += sign(velv);
				}
				velv = 0;
			}
		}
	}
	
	if(place_meeting(x, y + velv, obj_player))
	{
		var _player = instance_place(x, y + velv, obj_player);
		
		if(_player.estado == STATE.TRAMPOLIM)
		{
			velv = -(max_velv * _player.bolota_jump_force);
			_player.xscale = 1.3 * _player.facing;
			_player.yscale = 0.7;
			trampolim = true;
		}
		else
		{
			trampolim = false;
			while(!place_meeting(x, y + sign(velv), obj_player))
			{
				y += sign(velv);
			}
			velv = 0;
		}
	}
	
	var _inst = instance_place(x, y + velv, obj_solido_switch)
	
	if(_inst && _inst.visible)
	{
		while(!place_meeting(x, y + sign(velv), obj_solido_switch))
		{
			y += sign(velv);
		}
		velv = 0;
	}
	
	if(place_meeting(x, y + velv, obj_solido))
	{
		while(!place_meeting(x, y + sign(velv), obj_solido))
		{
			y += sign(velv);
		}
		velv = 0;
	}
	
	if(place_meeting(x, y + velv, obj_box_pass))
	{
		while(!place_meeting(x, y + sign(velv), obj_box_pass))
		{
			y += sign(velv);
		}
		velv = 0;
	}
	
	if(estado != STATE.SMASH)
	{	
		if(place_meeting(x, y + velv, obj_caixa))
		{
			while(!place_meeting(x, y + sign(velv), obj_caixa))
			{
				y += sign(velv);
			}
			velv = 0;
		}
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
	
	if(place_meeting(x + velh, y, obj_box_pass))
	{
		while(!place_meeting(x + sign(velh), y, obj_box_pass))
		{
			x += sign(velh);
		}
		velh = 0;
	}
	
	_inst = instance_place(x + velh, y, obj_solido_switch)
	
	if(_inst && _inst.visible)
	{
		while(!place_meeting(x + sign(velh), y, obj_solido_switch))
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
	
	if(collision_circle(x, y - 3, 1, obj_caixa, false, true))
	{
		y -= 32;
	}
#endregion