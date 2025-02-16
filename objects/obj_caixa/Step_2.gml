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
	
	ds_list_destroy(_lista)
	
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
	
	_lista = ds_list_create();
	_lista_objs = instance_place_list(x + velh, y, obj_solido_switch, _lista, false)
	
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
	
	ds_list_destroy(_lista)
	
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
			play_smash()
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
			play_smash()
			instance_destroy()
			
			var _smash = irandom_range(10, 30)
			for(var i = 0; i < _smash; i++)
			{
				var xx = random_range(x - sprite_width/2, x + sprite_width/2)
		
				instance_create_depth(xx, y, -100, obj_fragmento)
			}
		}
	}
	