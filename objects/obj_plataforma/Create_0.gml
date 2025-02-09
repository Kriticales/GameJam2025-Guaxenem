/// @description 
platform_speed = 1;	//Velocidade da plataforma
current_speed = platform_speed;	//Controle da velocidade
hspd = 0;			//Movimento Horizontal
vspd = 0;			//Movimento Vertical

//Switch para saber se a plataforma está indo para o final (false) ou voltando para o começo (true)
voltando = false;	

//Tempo de Espera (Quanto fica parada) (tempo * segundos)
wait_time = game_get_speed(gamespeed_fps) * espera;