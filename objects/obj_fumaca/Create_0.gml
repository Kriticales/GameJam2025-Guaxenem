#region VARIÁVEIS
	grav = 0.25;
	hspd = 4.5;						//Velocidade Horizontal
	vspd = -6;						//Velocidade Vertical
	estado = "LIVRE";				//Settando primeiro estado da state machine
	dash_spd = hspd * 3;			//Velocidade do dash
	dash_cooldown_count = 30;		//Cooldown do Dash
	dash_cooldown = dash_cooldown_count;//Cooldown do Dash
	dash_counter = 10;				//Tempo de dash
	dash_timer = dash_counter;		//contador
#endregion

#region MÉTODOS
#endregion