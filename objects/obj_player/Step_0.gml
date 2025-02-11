#region CONTROLE HORIZONTAL
	//Variável de Esquerda (verdadeiro se Esquerda OU A pressionado)
	var _esquerda = keyboard_check(vk_left) || keyboard_check(ord("A"));
		
	//Variável de Direita (verdadeiro se Direita OU D pressionado)
	var _direita = keyboard_check(vk_right) || keyboard_check(ord("D"));
	
	//Variável de Abaixar (verdadeiro se Baixo ou S pressionado)
	var _baixo = keyboard_check(vk_down) || keyboard_check(ord("S"));

	//Variável de Pulo (Alto)
	var _jump = keyboard_check_pressed(vk_space);
	
	//Variável de Pulo (Baixo)
	var _jump2 = keyboard_check_released(vk_space);
	
	//Variável de Pulo (Baixo)
	var _dash = keyboard_check_pressed(action_key);
		
	//Direção do Movimento. (Direita - Esquerda, onde -1 esqueda, 0 parado, 1 direita)
	var _velocidade = (_direita - _esquerda) * max_velh;
#endregion
		
#region CONTROLE VERTICAL

	//Atualizando o chao (existe chão?)
	chao = place_meeting(x, y + max(1, velv), obj_solido);
	
	//se tiver chão
	if(chao){
		
		//Aceleração do chão é ativa
		acel = acel_chao
		//se está no chão, tem coyote timer
		kyote_timer = kyote_time;
		//atualizando o dash;
		tem_dash = carga_dash;
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
		case STATE.PARADO:
	
			velv = 0; //Zera velocidade vertical
			velh = 0; //Zera velocidade horizontal
			
			abaixar(_baixo);
		
			//checa se o player pulou & está no chão
			if(_jump && chao)
			{
				//define a velocidade vertical do pulo
				velv = -max_velv
			}
			
			gravidade();
		
			//checa se existe algum movimento no player
			if(abs(velh) > 0 || abs(velv) > 0 || _esquerda || _direita)
			{
				//caso exista, muda o estado para movimento
				estado = STATE.MOVENDO;	
			}
			
			dash(_dash);
		break;
	
		case STATE.MOVENDO:
	
			//Aplica aceleração horizontal
			velh = lerp(velh, _velocidade, acel)
	
			gravidade();
			
			abaixar(_baixo)
			
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
			
			dash(_dash);
			
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
			
		break;
		
		case STATE.DASH:
			
			//reduz o dash
			dash_timer -= 1;
			
			velh = lengthdir_x(dash_lenght, dir)
			velv = lengthdir_y(dash_lenght, dir)
			
			//Saindo do dash
			if (dash_timer < 0)
			{
				estado = STATE.MOVENDO;
				dash_timer = dash_duration;
				
				velh = (max_velh * sign(velh) * 0.5);
				velv = (max_velv * sign(velv) * 0.5);
			}
			
		break;
	
	}
#endregion

#region RESET DE VARIÁVEIS

	if(velh != 0)
	{
		facing = sign(velh);
	}

	xscale = lerp(xscale, facing, 0.2); //Reset de imagem X
	yscale = lerp(yscale, 1, 0.2); //Reset de imagem Y
	velv = clamp(velv, -max_velv, max_velv) //Limitando Velocidade

#endregion

#region DEBUG

	switch(estado)
	{
		case STATE.PARADO:
			show_debug_message("PARADO")
		break;
		case STATE.MOVENDO:
			show_debug_message("MOVENDO")
		break;
		case STATE.DASH:
			show_debug_message("DASH")
		break;
	}

#endregion