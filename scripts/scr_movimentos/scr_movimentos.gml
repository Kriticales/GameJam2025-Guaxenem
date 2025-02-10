#region FUNÇÕES
	//Função de movimento Horizontal (Recebe velocidade de Movimento)
	function control()
	{
		#region MOVIMENTO HORIZONTAL
			//Variável de Esquerda (verdadeiro se Esquerda OU A pressionado)
			var _esquerda = keyboard_check(vk_left) || keyboard_check(ord("A"));
		
			//Variável de Direita (verdadeiro se Direita OU D pressionado)
			var _direita = keyboard_check(vk_right) || keyboard_check(ord("D"));
		
			//Direção do Movimento. (Direita - Esquerda, onde -1 esqueda, 0 parado, 1 direita)
			var _mover = (_direita - _esquerda);
		
			//SE o objeto se move
			if(_mover != 0 && !dashing)
			{
				//Acelera a velocidade horizontal na direção do comando
				h_vel += _mover * h_acel;
			
				//Limita a velocidade horizontal
				h_vel = clamp(h_vel, -max_vel, max_vel)
			}
			//se o objeto NÃO se move
			else if(!dashing)
			{
				//Checa se existe velocidade para direita (positiva)
				if(h_vel > h_dcel)
				{
					//Desacelera
					h_vel -= h_dcel;
				}
				
				//Checa se existe velocidade para esquerda (negativa)
				else if(h_vel < -h_dcel)
				{
					//Desacelera
					h_vel += h_dcel;
				}
				
				//Zera a velocidade
				else
				{
					h_vel = 0;
					afloat = false;
				}
			}
			
			dash_c_timer -= 1;
			
			if(keyboard_check_pressed(action_key) && object_index == obj_fumaca && !dashing && dash_c_timer <= 0)
			{
				dashing = true;
				dash_c_timer = dash_cooldown;
			}
			
			if(dashing)
			{
				h_vel = dash_vel * sign(image_xscale);
				dash_timer -= 1
				
				if(dash_timer <= 0)
				{
					dashing = false;
					h_vel = lerp(h_vel, 0.1, 0.2);
					dash_timer = dash_time;
				}
			}
			
			if(keyboard_check_pressed(action_key) && object_index == obj_bolota)
			{
				if(estado = "TRAMPOLIM")
				{
					estado = "LIVRE"
				}
				else
				{
					estado = "TRAMPOLIM"
				}
			}
			if(estado = "TRAMPOLIM")
			{
				h_vel = 0;
			}
			
		#endregion	
	}
	
	function pulofunc(_chao, pulo)
		{
		#region PULO
		
			var _pulo = keyboard_check_pressed(vk_space);
			var _teto = instance_place(x, y+pulo, obj_solido)
			var _fpulo = pulo;
			
			
			if(_teto != noone)
			{
				_fpulo = _teto.bbox_bottom - bbox_top;
			}
			
			if(_pulo && _chao)
			{
				v_vel = _fpulo;
			}
		
		#endregion
		}
	
	function mover(_control = empty, _pulofunc = empty)
	{
		if (estado != "TRAMPOLIM")
		{
			estado = "LIVRE"	
		}
		
		_control()
		
		#region COLISÕES HORIZONTAIS E MOVIMENTO
		
			col_caixah(obj_caixa)
			col_defh(obj_solido)
			col_bolota(obj_bolota)
			
			x += h_vel;
			
		#endregion
		
		#region GRAVIDADE
		
		if(!dashing)
		{
			v_vel += grav;
		}
		else
		{
			v_vel = 0;
		}
			
		#endregion
		
		#region COLISÕES VERTICAIS
		
			var _esta_no_chao =
			col_defv(obj_solido) ||
			col_defv(obj_caixa) ||
			col_ghost(obj_plataforma)
			
		#endregion
		
		_pulofunc(_esta_no_chao, pulo)
		
		y += v_vel;
			if(v_vel < 0)
			{
				estado = "PULOU";
			}
			if(v_vel > 1)
			{
				estado = "CAINDO";
			}
		
		//MUDA SPRITE
		if(h_vel < 0)
		{
			image_xscale = -1;
		}else if(h_vel > 0)
		{
			image_xscale = 1
		}
	}
	
	function empty(){}
	
#endregion