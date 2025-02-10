// Os recursos de script mudaram para a v2.3.0; veja
//PARA COLISÕES COM OBJETOS SÓLIDOS

//COLISÃO VERTICAL
function col_defv(_instance = obj_solido)
{
	//Define a distância mínima de erro entre player e colisão
	var _pixel_check = 1;
	
	//Define Pulo
	var _ta_no_chao = false;
	
	//Checa se o player está encima do chão
	if(place_meeting(x, y + v_vel, _instance))
	{
			
		//pega a direção
		var _direction = sign(v_vel);
			
		//Enquanto player não estiver encostando no chão
		while(!place_meeting(x, y + (_direction * _pixel_check), _instance))
		{
			//Aumenta o Y pela margem de erro;
			y += (_direction * _pixel_check)
		}
			
		//Zera a velocidade no chão, para não entrar no chão
		v_vel = 0;
		_ta_no_chao = true;
	}
	return _ta_no_chao;
}

//COLISÃO HORIZONTAL
function col_defh(_instance = obj_solido)
{
	//Define a distância mínima de erro entre player e colisão
	var _pixel_check = 1;
	
	//SE colisão entre (playerX + distância de movimento) e Objeto Parede
	if(place_meeting(x + h_vel, y, _instance))
	{
			
		//Pega a direção
		var _direction = sign( h_vel);
			
		//Enquanto não existir colisão entre (playerX + distância de erro) e Objeto Parede
		while(!place_meeting(x + (_direction * _pixel_check), y, _instance))
		{
			//Acrescentar distância de erro no X do personagem
			x += _pixel_check * _direction;
		}
			
		//Zerar velocidade para o player não entrar na parede
		 h_vel = 0;
	}
}

//PARA COLISÕES DE UMA VIA (EX: PLATAFORMAS)
function col_ghost(_instance = obj_plataforma)
{
	//Define a distância mínima de erro entre player e colisão
	var _pixel_check = 1;
	var _ta_no_chao = false;
	
	var _plataforma = instance_place(x, y + max(1, v_vel), _instance);
			if (_plataforma && round(bbox_bottom) <= _plataforma.bbox_top)
			{
				//Pixel-perfect collisions
				if (v_vel > 0)
				{
					while (!place_meeting(x, y + _pixel_check, _instance)) {
						y += _pixel_check;
					}
	
					v_vel = 0;
				}
	
				//// Add velocity
				x += _plataforma.hspd;
				y += _plataforma.vspd;
				_ta_no_chao = true;
			}
			return _ta_no_chao
}

//PARA COLISÕES COM CAIXA (Empurra/puxa)
function col_caixah(_instance = obj_caixa)
{
	var _key = keyboard_check(action_key);
	var _index_obj = object_index == obj_rex;
	
	//Se clicou na ação e é o rex
	if(_key && _index_obj)
	{
		//se o estado for diferente de livre
		if(estado != "LIVRE")
		{
			//ignorar tudo
			return;
		}
		
		//setta estado para livre
		estado = "LIVRE"
		
		//verifica se existe uma instancia de caixa ao alcance do jogador
		var _caixa = instance_place(x + h_vel, y, _instance);

		//caso exista
		if(_caixa != noone)
		{
			//caso a caixa entre na colisão com o jogador
			if(place_meeting(x + h_vel, y, _instance))
			{
			
				//reduz a velocidade do jogador
				h_vel /= 2;
			
				//entra no objeto caixa
				with(_caixa){
					
					//setta velocidade = velocidade do jogador
					h_vel = other.h_vel;
					
					//define colisões
					col_defh(obj_caixa)
					col_defh(obj_solido)
					col_defh(obj_player)
					
					//adiciona a velocidade ao X
					x += h_vel;
				}
				
				//muda o estado do jogador para Empurrando
				estado = "EMPURRANDO"
			}
		}
			
		//verifica se existe uma instancia de caixa ao alcance do jogador
		_caixa = instance_place(x - h_vel, y, _instance);
		
		//caso exista
		if(_caixa != noone)
		{
			//caso a caixa saia da colisão com o jogador
			if(place_meeting(x - h_vel, y, _instance))
			{
			
				//setta velocidade do jogador
				h_vel /= 2;
			
				//entra no objeto caixa
				with(_caixa){
					
					//setta velocidade = velocidade do jogador
					h_vel = other.h_vel;
				
					//define colisões
					col_defh(obj_caixa)
					col_defh(obj_solido)
					col_defh(obj_player)
					
					//adiciona a velocidade ao X
					x += h_vel;
				}
				
				//define o estado como Puxando
				estado = "PUXANDO"
			}
		}
	}
}

//PARA O BOLOTA
function col_bolota(_instance = obj_bolota)
	{	
		//checa se entra em contato com o bolota
		if(place_meeting(x , y + v_vel, obj_bolota))
		{
			
			//checa se o estado do bolota é Trampolim
			if(obj_bolota.estado == "TRAMPOLIM")
			{
				//setta velocidade vertical
				v_vel = -20
			}
		}	
	}