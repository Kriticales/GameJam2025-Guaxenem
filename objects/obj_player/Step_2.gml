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
			play_bolota();
			play_jump();
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
	
	var _lista = ds_list_create();
	var _lista_objs = instance_place_list(x, y + velv, obj_solido_switch, _lista, false);
	for(var i=0; i < _lista_objs; i++)
	{
		if(_lista[| i] && _lista[| i].visible)
		{
			while(!place_meeting(x, y + sign(velv), obj_solido_switch))
			{
				y += sign(velv);
			}
			velv = 0;
		}
	}
	ds_list_destroy(_lista);
	
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
	
	_lista = ds_list_create();
	_lista_objs = instance_place_list(x + velh, y, obj_solido_switch, _lista, false);
	for(var i=0; i < _lista_objs; i++)
	{
		if(_lista[| i] && _lista[| i].visible)
		{
			while(!place_meeting(x + sign(velh), y, obj_solido_switch))
		{
			x += sign(velh);
		}
		velh = 0;
		}
	}
	
	ds_list_destroy(_lista);
	
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