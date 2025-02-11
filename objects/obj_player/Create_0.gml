#region VARIÁVEIS

	//ENUMERANDO ESTADOS
	enum STATE
	{
		PARADO,
		MOVENDO,
		DASH,
	}

	//--------------ACELERAÇÕES
	
	grav = .3;			//Gravidade
	acel_chao = .1;		//Aceleração no chao
	acel_ar = .07;		//Aceleração no ar
	acel = acel_chao;	//Aceleração verdadeira
	
	//--------------VELOCIDADES
	
	velh = 0;	//Velocidade X (HORIZONTAL)
	velv = 0;	//Velocidade Y (VERTICAL)
	
	//--------------LIMITAÇÕES
	max_velh = 6;	//Velocidade máxima X (HORIZONTAL)
	max_velv = 8;	//Velocidade máxima Y (VERTICAL)
	dash_lenght = 10; //Velocidade máxima Dash
	
	kyote_time = 6;				//Setta o coyote time
	kyote_timer = kyote_time	//Inicia o contador
	
	jump_buffer = 6;
	jump_buffer_timer = 0;
	is_buffered = false;
	
	dash_duration = game_get_speed(gamespeed_fps) / 4;
	dash_timer = dash_duration;
	
	//--------------CONTROLE
	
	dir = 0; //direção do dash
	carga_dash = 1;
	tem_dash = carga_dash;
	
	action_key = vk_shift;	//tecla de ação
	
	chao = place_meeting(x, y+1, obj_solido);	//Checando o Chão
	estado = STATE.PARADO						//Iniciando o estado do player
	
	xscale = 1;	//Escala X da imagem
	yscale = 1;	//Escala Y da imagem
	
	facing = 1;
	
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
	
	abaixar = function(_baixo)
	{
		if(chao && _baixo && object_index == obj_fumaca)
		{
			xscale = facing * 1.3;
			yscale = 0.7;
			image_yscale = 0.7;
		}
	}

#endregion