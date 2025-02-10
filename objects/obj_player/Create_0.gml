#region VARIÁVEIS
	max_vel = 8;	//velocidade máxima
	h_acel = 2;		//aceleração
	h_dcel = 1;		//desaceleração
	grav = 1		//gravidade;
	pulo = -12;		//forca do pulo
	v_escadas = 3;	//velocidade em escadas
	
	v_vel = 0; //movimento vertical
	h_vel = 0; //movimento horizontal
	
	action_area = (sprite_width/2) + 2;	//setta a area de interação
	action_key = vk_shift;				//setta a tecla de interação
	
	estado = "LIVRE"	//Inicia os estados
	dashing = false;	//Checa se o personagem tem dash
	dash_cooldown = game_get_speed(gamespeed_fps) * 1;	//cooldown do dash
	dash_c_timer = dash_cooldown;						//timer do cooldown
#endregion