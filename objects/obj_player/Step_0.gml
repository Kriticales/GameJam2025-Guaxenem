
#region CONTROLE HORIZONTAL
	//Variável de Esquerda (verdadeiro se Esquerda OU A pressionado)
	var _esquerda = keyboard_check(global.array_controls[TECLA.ESQUERDA])
	//keyboard_check(vk_left) || keyboard_check(ord("A"));
		
	//Variável de Direita (verdadeiro se Direita OU D pressionado)
	var _direita = keyboard_check(global.array_controls[TECLA.DIREITA])
	//keyboard_check(vk_right) || keyboard_check(ord("D"));
	
	//Variável de Descer (verdadeiro se Baixo OU S pressionado)
	var _desce = keyboard_check(global.array_controls[TECLA.CAIR])
	//keyboard_check(vk_down) || keyboard_check(ord("S"))

	//Variável de Pulo (Alto)
	var _jump = keyboard_check_pressed(global.array_controls[TECLA.PULAR]);
	//keyboard_check_pressed(vk_space);
	
	//Variável de Pulo (Baixo)
	var _jump2 = keyboard_check_released(global.array_controls[TECLA.PULAR]);
	//keyboard_check_released(vk_space);
	
	//Action Key (Baixo)
	var _action_key_press = keyboard_check_pressed(global.array_controls[TECLA.ACTION])
	//keyboard_check_pressed(action_key);
	
	//Action Key (Solta)
	var _action_key_release = keyboard_check_released(global.array_controls[TECLA.ACTION]);
	//keyboard_check_released(action_key);
		
	//Direção do Movimento. (Direita - Esquerda, onde -1 esqueda, 0 parado, 1 direita)
	var _velocidade = (_direita - _esquerda) * max_velh;
#endregion
		
	if(global.guaxinim[global.selecionado] != object_index)
	{
		_esquerda = 0;
		
		//Variável de Direita (verdadeiro se Direita OU D pressionado)
		_direita = 0;
		
		_desce = 0;

		//Variável de Pulo (Alto)
		_jump = 0;
	
		//Variável de Pulo (Baixo)
		_jump2 = 0;
	
		//Action Key (Baixo)
		_action_key_press = 0;
	
		//Action Key (Solta)
		_action_key_release = 0;
	
		_velocidade = 0;
	}
		
#region CONTROLE VERTICAL

	var _plat = instance_place(x, y + max(1, velv), obj_plataforma);
	var _is_on_plat = (_plat && bbox_bottom <= _plat.bbox_top+2) && !_desce
	
	//Atualizando o chao (existe chão?)
	chao =
	place_meeting(x, y + max(1, velv), obj_solido) ||
	place_meeting(x, y + max(1, velv), obj_player) ||
	place_meeting(x, y + max(1, velv), obj_box_pass) ||
	_is_on_plat ||
	place_meeting(x, y + max(1, velv), obj_caixa);
	
	if(_desce && (_plat && bbox_bottom <= _plat.bbox_top+2))
	{
		y += grav*2;
		velv = grav*3;
	}
	
	var _inst = instance_place(x, y + max(1, velv), obj_solido_switch)
	
	chao = chao ||
	(place_meeting(x, y + max(1, velv), obj_solido_switch) 
	&&	_inst.visible)
	
	//se tiver chão
	if(chao){
		
		//Aceleração do chão é ativa
		acel = acel_chao
		//se está no chão, tem coyote timer
		kyote_timer = kyote_time;
		//atualizando o dash;
		tem_dash = carga_dash;
		
		trampolim = false;
		
	}
	//se não tiver chão
	else
	{
		//Aceleração do ar é ativa
		acel = acel_ar;
		//se não está no chão, checa se existe coyote timer
		if(kyote_timer > 0)
		{
			//se sim, reduz o timer
			kyote_timer -= 1;
		}
	}
	
	//atualizando o jump buffer
	if(is_buffered)
	{
		//reduz o timer do buffer;
		jump_buffer_timer -= 1;
	}
	
#endregion

#region MÁQUINA DE ESTADOS

	switch(estado)
	{
		#region PARADO
		case STATE.PARADO:
			estado_string = "PARADO";
	
			velv = 0; //Zera velocidade vertical
			velh = 0; //Zera velocidade horizontal
		
			//checa se o player pulou & está no chão
			if(_jump && (chao))
			{
				//define a velocidade vertical do pulo
				velv = -max_velv
				play_jump()
			}
			
			gravidade();
		
			//checa se existe algum movimento no player
			if(abs(velh) > 0 || abs(velv) > 0 || _esquerda || _direita)
			{
				//caso exista, muda o estado para movimento
				estado = STATE.MOVENDO;	
			}
			
			
			//Estado de dash
			dash(_action_key_press);
			
			
			//Estado de Push/Pull
			if(_action_key_press && object_index == obj_rex)
			{
				var _collision = collision_line(x, y-(sprite_height/2), x+(20 * facing), y-(sprite_height/2), obj_caixa, false, true)
				if(_collision != noone)
				{
					estado = STATE.HOLD;
					hold = _collision;
					hold_side = sign(facing);
				}
			}
			
			if(_action_key_press && object_index == obj_bolota)
			{
				estado = STATE.TRAMPOLIM
				image_index = 0
			}
			//--------------SPRITE CONTROL
			
			sprite_index = idle_spr;
		break;
		#endregion
		
		#region MOVENDO
			case STATE.MOVENDO:
				estado_string = "MOVENDO";
			
				//Aplica aceleração horizontal
				velh = lerp(velh, _velocidade, acel*2)
	
				gravidade();
			
				//Buffer de pulo
				if(_jump)
				{
					jump_buffer_timer = jump_buffer;
				}
			
				if(jump_buffer_timer > 0)
				{
					is_buffered = true;
				}
				else
				{
					is_buffered = false;
				}
		
				//Checa se está no chão & Pulando
				if(is_buffered && (chao || kyote_timer))
				{
					play_jump()
					//Se sim, aplica força do pulo
					velv = -max_velv;
				
					//Modifica as escalas da imagem
					xscale *= 0.5;
					yscale *= 1.5;
				
					kyote_timer = 0;
					jump_buffer_timer = 0;
				}
			
				if(_jump2 && velv < 0)
				{
					velv *= 0.7;
				}
			
				dash(_action_key_press);
			
				if(abs(velh) > -0.5 && abs(velh) < 0.5 && abs(velv) == 0)
				{
					//caso exista, muda o estado para movimento
					estado = STATE.PARADO;	
				}
			
				if(!chao){
					sprite_index = jump_spr;
				}
				else
				{
					sprite_index = idle_spr;
				}
				//Estado de Push/Pull
				if(_action_key_press && chao && object_index == obj_rex)
				{
					var _collision = collision_line(x, y-(sprite_height/2), x+(15 * facing), y-(sprite_height/2), obj_caixa, false, true)
					if(_collision != noone)
					{
						estado = STATE.HOLD;
						hold = _collision;
						hold_side = sign(facing);
					}
				}
			
				if(_action_key_press && chao && object_index == obj_bolota)
				{
					estado = STATE.TRAMPOLIM;
					image_index = 0
				}
				
				if(_action_key_press && !chao && object_index == obj_bolota)
				{
					estado = STATE.SMASH;
					image_index = 0
					dir = 270;
				}
			
				//--------------SPRITE CONTROL
				//mudando sprite
				if(abs(velh) > 0.5)
				{
					sprite_index = walk_spr;
				}
			
				if(velv < 0)
				{
					sprite_index = jump_spr;
				
					if(!jump_start)
					{
						image_index = 0;
						jump_start = true;
					}
				
					if(image_index >= 5)
					{
						image_index = 5
					}
				}
			
				if(velv > 0)
				{
					sprite_index = jump_spr
				
					if(!jump_start)
					{
						image_index = 5
						jump_start = true;
					}
				
					if(image_index >= image_number)
					{
						image_index = image_number -1
					}
				}
			
			break;
		#endregion
		
		#region DASH
			case STATE.DASH:
				estado_string = "DASH";
			
				//reduz o dash
				dash_timer -= 1;
			
				velh = lengthdir_x(dash_lenght, dir)
				velv = lengthdir_y(dash_lenght, dir)
				
				xscale = 1.3 * facing;
				yscale = 0.7;
				image_yscale = 0.7;
			
				//Saindo do dash
				if (dash_timer < 0)
				{
					estado = STATE.MOVENDO;
					dash_timer = dash_duration;
					velh = (max_velh * sign(velh) * 0.5);
					velv = (max_velv * sign(velv) * 0.5);
				}
			
				//--------------SPRITE CONTROL
				//mudando sprite
			
				sprite_index = spr_fumaca_dash;
			
			break;
		#endregion
		
		#region HOLD
			case STATE.HOLD:
				estado_string = "SEGURANDO";
			
				//CONFIGURA OS EMPURRÕES
				empurra_puxa(_velocidade, _action_key_release, _jump)
			
			
				//MUDA O ESTADO DE ACORDO COM O PUXÃO
				if(sign(velh) != hold_side && abs(velh) > 0)
				{
					estado = STATE.PUXANDO;
				}
				if(sign(velh) == hold_side && abs(velh) > 0)
				{
					estado = STATE.EMPURRANDO;
				}
			
				//--------------SPRITE CONTROL
				//mudando sprite
				sprite_index = spr_rex_idle_push;
			
				//settando a direção
				xscale = hold_side;
			
			break;
		#endregion
		
		#region PUXANDO
			case STATE.PUXANDO:
				estado_string = "PUXANDO";
		
				//CONFIGURA OS EMPURRÕES
				empurra_puxa(_velocidade, _action_key_release, _jump)
			
			
				//MUDA O ESTADO DE ACORDO COM O PUXÃO
				if(velh == 0)
				{
					audio_stop_sound(snd_pushing)
					estado = STATE.HOLD;
				}
				else if(sign(velh) == hold_side)
				{
					estado = STATE.EMPURRANDO;
				}
			
				//--------------SPRITE CONTROL
				//mudando sprite
				sprite_index = spr_rex_pull;
			
				//settando a direção
				xscale = -hold_side;
			
			break;
		#endregion
		
		#region EMPURRANDO
			case STATE.EMPURRANDO:
				estado_string = "EMPURRANDO";
		
				//CONFIGURA OS EMPURRÕES
				empurra_puxa(_velocidade, _action_key_release, _jump)
			
		
				//MUDA O ESTADO DE ACORDO COM O PUXÃO
				if(velh == 0)
				{
					estado = STATE.HOLD;
					audio_stop_sound(snd_pushing)
				}
				else if(sign(velh) != hold_side)
				{
					estado = STATE.PUXANDO;
				}
			
				//--------------SPRITE CONTROL
				//mudando sprite
				sprite_index = spr_rex_push;
			
				//settando a direção
				xscale = hold_side;
			break;
		#endregion
		
		#region TRAMPOLIM
			case STATE.TRAMPOLIM:
				estado_string = "TRAMPOLIM";
				
				gravidade()
		
				velh = lerp(velh, 0, 0.2)
			
				if(_jump && (chao || kyote_timer))
				{
					play_jump()
					//define a velocidade vertical do pulo
					velv = -max_velv
					kyote_timer = 0;
					estado = STATE.MOVENDO;
				}
			
				if(_action_key_press)
				{
					image_speed = -1;
				}
			
				if(image_speed = -1)
				{
					if(image_index <= 1)
					{
						estado = STATE.PARADO;
						image_speed = 1;
					}
				}
		
				//--------------SPRITE CONTROL
				//mudando sprite
				sprite_index = spr_bolota_lay;
				if(image_index >= 3)
				{
					image_index = image_number - 1;
				}
			
			break;
		#endregion
		
		#region SMASH
			case STATE.SMASH:
				velh = 0
				velv += grav * 3;
				xscale = 0.7 * facing;
				yscale = 1.3;
				
				var _caixa = instance_place(x, y + velv, obj_caixa)
				
				if(chao && _caixa = noone)
				{
					estado = STATE.PARADO;
				}
			break;
		#endregion
	}
	
if(chao && velh != 0 && !audio_is_playing(snd_footstep))
{
	play_footstep()
}
#endregion

#region RESET DE VARIÁVEIS

	if(velh != 0)
	{
		facing = sign(velh);
	}

	if(estado != STATE.HOLD && estado != STATE.PUXANDO && estado != STATE.EMPURRANDO)
	{
		xscale = lerp(xscale, facing, 0.2); //Reset de imagem X
	}
	yscale = lerp(yscale, 1, 0.2); //Reset de imagem Y
	
	if(!trampolim && estado != STATE.SMASH)
	{
		velv = clamp(velv, -max_velv, max_velv) //Limitando Velocidade
	}
	image_yscale = lerp(image_yscale, 1, 0.3);

#endregion