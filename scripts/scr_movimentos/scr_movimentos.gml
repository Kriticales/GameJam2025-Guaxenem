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
		
		//Define a distância mínima de erro entre player e parede
		var _pixel_check = 0.1;
		
		//Checando colisão com parede
		//SE colisão entre (playerX + distância de movimento) e Objeto Parede
		if(place_meeting(x + _mover, y, obj_parede))
		{
			//Enquanto não existir colisão entre (playerX + distância de erro) e Objeto Parede
			while(!place_meeting(x + _pixel_check, y, obj_parede))
			{
				//Acrescentar distância de erro no X do personagem
				x += _pixel_check * sign(_mover)
			}
			
			//Zerar velocidade para o player não entrar na parede
			_mover = 0;
		}
		
		//Adicionando a Velocidade horizontal a direção do movimento
		hspeed = _mover;
	}
	
	//Função de Pulo (Recebe velocidade de pulo)
	function pular(_pulo = -5)
	{
		//Checando espaço para ver se o jogador quer pular
		var _pulando = keyboard_check_pressed(vk_space);
		
		//Só pode pular se estiver no chão, então...
		
		if(place_meeting(x, y + 1, obj_chao))
		{
				if(_pulando)
			{
				//Adicionar Força de pula na velocidade
				vspeed = _pulo;
			}
		}
		//Se (Espaço pressionado)
	}
#endregion