#region VARIÁVEIS
	max_vel = 8;	//velocidade máxima
	h_acel = 2;		//aceleração
	h_dcel = 1;		//desaceleração
	grav = 1		//gravidade;
	pulo = -12;		//forca do pulo
	
	v_vel = 0; //movimento vertical
	h_vel = 0; //movimento horizontal
	
	action_area = (sprite_width/2) + 2;
	action_key = vk_shift;
	
	estado = "LIVRE"
	puxando = noone;
#endregion