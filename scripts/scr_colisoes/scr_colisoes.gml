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

//PARA COLISÕES COM CAIXA
function col_caixah(_instance = obj_caixa)
{
	var _check1 = false;
	var _check2 = false;
	if(keyboard_check(action_key) && object_index == obj_rex)
	{
		if(estado != "LIVRE")
		{
			return;
		}
		
		estado = "LIVRE"
		
		var _caixa = instance_place(x + h_vel, y, _instance);

		if(_caixa != noone)
		{
			if(place_meeting(x + h_vel, y, _instance))
			{
			
				h_vel /= 2;
			
				with(_caixa){
					h_vel = other.h_vel;
				
					col_defh(obj_caixa)
					col_defh(obj_solido)
					col_defh(obj_player)
					
					x += h_vel;
				}
				_check1 = true;
				estado = "EMPURRANDO"
			}
		}
			
		_caixa = instance_place(x - h_vel, y, _instance);
	
		if(_caixa != noone)
		{
			if(place_meeting(x - h_vel, y, _instance))
			{
			
				h_vel /= 2;
			
				with(_caixa){
					h_vel = other.h_vel;
				
					col_defh(obj_caixa)
					col_defh(obj_solido)
					col_defh(obj_player)
					
					x += h_vel;
				}
				
				_check2 = true;
				estado = "PUXANDO"
			}
		}
	}
	
	if(place_meeting(x, y + max(1, v_vel), _instance))
	{
		
	}
}

//PARA O BOLOTA
function col_bolota(_instance = obj_bolota)
	{	
		var _pixel_check = 1;
		
		
		if(place_meeting(x , y + v_vel, obj_bolota))
		{
			if(obj_bolota.estado == "TRAMPOLIM")
			{
				v_vel = -20
			}
		}	
	}