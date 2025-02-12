#region FUNÇÕES
	//CONTROLE DO PLAYER
	function control()
	{
			
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
		
		if(h_vel < 0 || h_vel > 1)
		{
			//se Vel negativa, PULOU
			estado = "ANDA";
		}
		
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