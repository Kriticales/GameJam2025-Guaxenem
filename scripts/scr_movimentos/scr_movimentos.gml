#region FUNÇÕES
	//Função de movimento Horizontal (Recebe velocidade de Movimento)
	function mover()
	{
		#region MOVIMENTO HORIZONTAL
			//Variável de Esquerda (verdadeiro se Esquerda OU A pressionado)
			var _esquerda = keyboard_check(vk_left) || keyboard_check(ord("A"));
		
			//Variável de Direita (verdadeiro se Direita OU D pressionado)
			var _direita = keyboard_check(vk_right) || keyboard_check(ord("D"));
		
			//Direção do Movimento. (Direita - Esquerda, onde -1 esqueda, 0 parado, 1 direita)
			var _mover = (_direita - _esquerda);
		
			//SE o objeto se move
			if(_mover != 0)
			{
				//Acelera a velocidade horizontal na direção do comando
				h_vel += _mover * h_acel;
			
				//Limita a velocidade horizontal
				h_vel = clamp(h_vel, -max_vel, max_vel)
			}
			//se o objeto NÃO se move
			else
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
				}
			}
		#endregion
		
		#region COLISÕES HORIZONTAIS E MOVIMENTO
		
			col_caixah(obj_caixa)
			col_defh(obj_solido)
			
			x += h_vel;
			
		#endregion
		
		#region GRAVIDADE

			v_vel += grav;
			
		#endregion
		
		#region COLISÕES VERTICAIS
		
			var _esta_no_chao =
			col_defv(obj_solido) ||
			col_defv(obj_caixa) ||
			col_ghost(obj_plataforma)
			
		#endregion
		
		#region PULO
		
			var _pulo = keyboard_check_pressed(vk_space);
			var _teto = instance_place(x, y+pulo, obj_solido)
			var _fpulo = pulo;
			
			
			if(_teto != noone)
			{
				_fpulo = _teto.bbox_bottom - bbox_top;
			}
			
			if(_pulo && _esta_no_chao)
			{
				estado = "PULO";
				v_vel = _fpulo;
			}
			
			y += v_vel;
		
		#endregion
		
		
		//MUDA SPRITE
		if(_mover < 0)
		{
			image_xscale = -1;
		}else if(_mover > 0)
		{
			image_xscale = 1
		}
	}
	
	
	
	//Função de Pulo (Recebe velocidade de pulo)
	function pular(_pulo = -5)
	{
		//Checando espaço para ver se o jogador quer pular
		var _pulando = keyboard_check_pressed(vk_space);
		
		var _obj1 = place_meeting(x, y + 1, obj_solido);
		var _obj2 = place_meeting(x, y + 1, obj_plataforma);
		//se existe um chão no pixel abaixo & pulando
		if( (_obj1 || _obj2) && _pulando)
		{
			//Adicionar Força de pular na velocidade
			vspeed = _pulo;
		}
	}
	
	
	
	//Função de Gravidade
	function gravidade(_grav = 0.1)
	{
		//Dobrando a gravidade se o player estiver caindo
		if(vspeed > 0) _grav *= 2;
		
		//Velocidade vertical é aumentada segundo as leis de newton
		vspeed += _grav;
		
		//Limita velocidade de queda
		vspeed = min(vspeed, 6)
	}
	
	
	
	//Função de Colisão
	function collision()
	{	
		
		//Define a distância mínima de erro entre player e colisão
		var _pixel_check = 0.5;
		#region COLISÃO COM O BOLOTA
			if(place_meeting(x , y + vspeed, obj_bolota))
			{
				if(obj_bolota.estado == "TRAMPOLIM")
				{
					vspeed = -10
				}
			}	
		#endregion
	}
#endregion