#region VARIÁVEIS
#endregion

#region FUNÇÕES
	//Função de movimento Horizontal (Recebe velocidade de Movimento)
	function mover(_velocidade = 1)
	{
		//Variável de Esquerda (verdadeiro se Esquerda OU A pressionado)
		var _esquerda = keyboard_check(vk_left) || keyboard_check(ord("A"));
		
		//Variável de Direita (verdadeiro se Direita OU D pressionado)
		var _direita = keyboard_check(vk_right) || keyboard_check(ord("D"));
		
		//Direção do Movimento. (Direita - Esquerda, onde -1 esqueda, 0 parado, 1 direita)
		var _mover = (_direita - _esquerda) * _velocidade;
		
		if(_mover < 0)
		{
			image_xscale = -1;
		}else if(_mover > 0)
		{
			image_xscale = 1
		}
		
		//Adicionando a Velocidade horizontal a direção do movimento
		hspeed = _mover;
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
		var _pixel_check = 0.1;
		
		#region COLISÃO COM CAIXAS
			
			var _caixa = instance_place(x + hspeed, y, obj_caixa);
			if(_caixa)
			{
				hspeed = (hspeed/2)
				_caixa.x += hspeed
			}
			
			
		#endregion
		
		#region COLISÃO COM PLATAFORMAS
			var _plataforma = instance_place(x, y + max(1, vspeed), obj_plataforma);
			if (_plataforma && round(bbox_bottom) <= _plataforma.bbox_top)
			{
				//Pixel-perfect collisions
				if (vspeed > 0)
				{
					while (!place_meeting(x, y + _pixel_check, obj_plataforma)) {
						y += _pixel_check;
					}
	
					vspeed = 0;
				}
	
				//// Add velocity
				hspeed += _plataforma.hspd;
				y += _plataforma.vspd;
			}
		#endregion
		
		#region COLISÃO HORIZONTAL E VERTICAL
			//COLISÃO HORIZONTAL
			//SE colisão entre (playerX + distância de movimento) e Objeto Parede
			if(place_meeting(x + hspeed, y, obj_solido))
			{
			
				//Pega a direção
				var _direction = sign(hspeed);
			
				//Enquanto não existir colisão entre (playerX + distância de erro) e Objeto Parede
				while(!place_meeting(x + (_direction * _pixel_check), y, obj_solido))
				{
					//Acrescentar distância de erro no X do personagem
					x += _pixel_check * _direction;
				}
			
				//Zerar velocidade para o player não entrar na parede
				hspeed = 0;
			}
		
			//COLISÃO VERTICAL
			//Checa se o player está encima do chão
			if(place_meeting(x, y + vspeed, obj_solido))
			{
			
				//pega a direção
				var _direction = sign(vspeed);
			
				//Enquanto player não estiver encostando no chão
				while(!place_meeting(x, y + (_direction * _pixel_check), obj_solido))
				{
					//Aumenta o Y pela margem de erro;
					y += (_direction * _pixel_check)
				}
			
				//Zera a velocidade no chão, para não entrar no chão
				vspeed = 0;
			}	
		#endregion
		
		#region COLISÃO COM O BOLOTA
			if(place_meeting(x + hspeed, y + vspeed, obj_bolota))
			{
				if(obj_bolota.estado == "TRAMPOLIM")
				{
					vspeed = -10
				}
			}	
		#endregion
	}
#endregion