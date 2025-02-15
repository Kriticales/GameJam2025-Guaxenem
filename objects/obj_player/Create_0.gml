#region VARIÁVEIS

	//ENUMERANDO ESTADOS
	enum STATE
	{
		PARADO,
		MOVENDO,
		DASH,
		HOLD,
		PUXANDO,
		EMPURRANDO,
		TRAMPOLIM,
		SMASH
	}
	
	pop = true;
	pop_dash = true;
	pop_time = 5;
	pop_timer = pop_time
	
	//--------------ACELERAÇÕES
	
	grav = .3;			//Gravidade
	acel_chao = .1;		//Aceleração no chao
	acel_ar = .06;		//Aceleração no ar
	acel = acel_chao;	//Aceleração verdadeira
	
	//--------------VELOCIDADES
	
	velh = 0;	//Velocidade X (HORIZONTAL)
	velv = 0;	//Velocidade Y (VERTICAL)
	
	//--------------LIMITAÇÕES
	kyote_time = 6;				//Setta o coyote time
	kyote_timer = kyote_time	//Inicia o contador
	
	jump_buffer = 6;
	jump_buffer_timer = 0;
	is_buffered = false;
	
	dash_duration = game_get_speed(gamespeed_fps) / 4;
	dash_timer = dash_duration;
	
	//--------------CONTROLE
	
	dir = 0; //direção do dash
	carga_dash = 1; //cargas do dash
	tem_dash = carga_dash; //contador do dash
	
	action_key = vk_shift;	//tecla de ação
	
	chao = place_meeting(x, y+1, obj_solido);	//Checando o Chão
	estado = STATE.PARADO						//Iniciando o estado do player
	
	xscale = 1;	//Escala X da imagem
	yscale = 1;	//Escala Y da imagem
	
	facing = 1; //direção que está olhando
	hold = noone; //está segurando caixa
	hold_side = facing; //De qual lado estava o objeto
	
	trampolim = false; //ignorar o cap de vspeed
	
	jump_start = false; //controle de frame pro pulo
	
	estado_string = ""; //debug da state machine
	
	last_safe_x = x;
	last_safe_y = y;
	
#endregion

#region MÉTODOS

	gravidade = function()
	{
		//caso o player não esteja no chão
		if(!chao)
		{
			//aplica gravidade
			velv += grav;
		
		}
	}

	dash = function(_dash)
	{
		if (_dash && tem_dash > 0 && object_index == obj_fumaca)
			{
				tem_dash -= 1;
				dir =  point_direction(0, 0, facing, 0);
				estado = STATE.DASH;
			}
	}

	empurra_puxa = function(_velocidade, _action_key_release, _jump)
	{
		var _collision = collision_line(x, y - (sprite_height/2), x + (sprite_width * hold_side), y - (sprite_height/2), obj_caixa, false, true);
			
			gravidade();
			velh = _velocidade;
			velh = clamp(velh, -(max_velh/3), (max_velh/3))
			
			if(hold != noone)
			{
				hold.velh = velh;
				hold.held = true;
			}
			
			if(_collision == noone && hold == noone)
			{
				estado = STATE.PARADO;
			}
			
			if(hold == noone)
			{
				estado = STATE.PARADO;
			}
			
			if((_collision != hold && hold != noone))
			{
				hold.velh = 0;
				hold.held = false;
				hold = noone;
				estado = STATE.PARADO;
			}
			
			if((!chao && hold != noone))
			{
				hold.velh = 0;
				hold.held = false;
				hold = noone;
				estado = STATE.PARADO;
			}
			
			if(_jump && (chao || kyote_timer) && hold != noone)
			{
				//define a velocidade vertical do pulo
				velv = -max_velv
				hold.velh = 0;
				hold.held = false;
				kyote_timer = 0;
				hold = noone;
				estado = STATE.MOVENDO;
			}
			
			if(_action_key_release && hold != noone)
			{
				hold.velh = 0;
				hold.held = false;
				hold = noone;
				estado = STATE.PARADO;
			}
	}
#endregion