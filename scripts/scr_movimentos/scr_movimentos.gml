#region FUNÇÕES
	//CONTROLE DO PLAYER
	function control()
	{
		#region MOVIMENTAÇÃO HORIZONTAL
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
				h_vel = clamp(h_vel, -max_vel, max_vel);
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
					h_vel = 0; //Zera a velocidade
				}
			}
		#endregion
		
		#region CHECANDO O DASH
			dash_c_timer -= 1; //Reduz o timer em 1 por tick
			
			//Tecla de ação pressionada?
			var _key = keyboard_check_pressed(action_key)
			
			//Objeto é o fumaça?
			var _index_obj = object_index == obj_fumaca
			
			//timer de cooldown zerou?
			var _timer = dash_c_timer <= 0
			
			//se for o OBJ & Pressionar ação & timer zerou & NÃO está dashando
			if(_index_obj && _key && _timer && !dashing)
			{
				//começa o dash
				dashing = true;
				
				//reseta o cooldown
				dash_c_timer = dash_cooldown;
			}
			
			//Se está dashando
			if(dashing)
			{
				//reduz o timer do dash
				dash_timer -= 1
				
				//Velocidade = direção * velocidade do dash
				h_vel = dash_vel * sign(image_xscale);
				
				//se o timer do dash zerou
				if(dash_timer <= 0)
				{
					//desliga o dash
					dashing = false;
					
					//reduz a velocidade para 0
					h_vel = lerp(h_vel, 0, 0.2);
					
					//reseta o tempo de dash
					dash_timer = dash_time;
				}
			}
		#endregion
			
		#region SETTANDO ESTADOS DE TRAMPOLIM DO BOLOTA
			//Qual objeto?
			_index_obj = object_index == obj_bolota;
			
			//Se tecla pressionada e Objeto
			if(_key && _index_obj)
			{
				switch(estado)
				{
					//caso for trampolim
					case "TRAMPOLIM":
					
						//mudar pra livre
						estado = "LIVRE"
					break;
					
					//caso for livre
					case "LIVRE":
					
						//mudar pra trampolim
						estado = "TRAMPOLIM"
					break;
				}
			}
			
			if(estado = "TRAMPOLIM")
			{
				h_vel = 0;
			}
		#endregion
	}
	
	function pulofunc(_chao, _pulo)
		{
			#region PULO
		
				//setta key de pulo
				var _key = keyboard_check_pressed(vk_space);
			
				//procura se existe um teto
				var _teto = instance_place(x, y + _pulo, obj_solido);
			
				//define a força do pulo
				var _fpulo = _pulo;
			
			
				//se existir um teto
				if(_teto != noone)
				{
				
					//faz a força ser igual a altura do teto
					_fpulo = _teto.bbox_bottom - bbox_top;
				}
			
				//Se clicou no pulo e está no chão
				if(_key && _chao)
				{
					//velocidade vertical = força do pulo
					v_vel = _fpulo;
				}
			#endregion
		}
	
	//chama a física, passando (controle horizontal) e (controle de pulo)
	function mover(_control = empty, _pulofunc = empty)
	{
		//Checa se o estado é Trampolim
		if (estado != "TRAMPOLIM")
		{
			//Se não for, se torna livre
			estado = "LIVRE";	
		}
		
		//chama a variavel de controle (só existe se for o objeto selecionado)
		_control()
		
		#region COLISÕES HORIZONTAIS E MOVIMENTO
		
			col_caixah(obj_caixa); //colido com caixas
			col_defh(obj_solido); //colido com sólidos
			col_bolota(obj_bolota); //colido com o bolota
			
			x += h_vel; //aumento meu X baseado na minha velocidade
			
		#endregion
		
		#region GRAVIDADE
		
			//checa se está dashando
			if(!dashing)
			{
				//NÂO está dashando, aplica gravidade
				v_vel += grav;
			}
			else
			{
				//está dashando, ignora a gravidade;
				v_vel = 0;
			}
			
		#endregion
		
		#region COLISÕES VERTICAIS
		
			var _esta_no_chao =
			col_defv(obj_solido) ||
			col_defv(obj_caixa) ||
			col_ghost(obj_plataforma)
			
		#endregion
		
		//chama função de pulo
		_pulofunc(_esta_no_chao, pulo)
		
		//adiciona velocidade vertical ao Y
		y += v_vel;
		
		//controla o estado do pulo;
		if(v_vel < 0)
		{
			//se Vel negativa, PULOU
			estado = "PULOU";
		}
		if(v_vel > 1)
		{
			//se Vel positiva, CAIU
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