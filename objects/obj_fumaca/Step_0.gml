//Roda o movimento apenas se o personagem está selecionado.
if(global.guaxinim[global.selecionado] == object_index)
{
	switch(estado)
	{
		case "LIVRE":
			mover(hspd); //Chamando a função de movimento e passando a velocidade;
			pular(vspd); //Chamando a função de pulo e passando a velocidade;
			dash_cooldown -=1; //contando o timer
			
			//se o timer está zerado && Clicou shift
			if(dash_cooldown <= 0 && keyboard_check_pressed(vk_shift))
			{
				estado = "DASH"; //muda o estado
				dash_cooldown = dash_cooldown_count; //reseta o cooldown
			}
			break;
			
		case "DASH":
			hspeed = dash_spd * image_xscale; //setta a velocidade do dash
			vspeed = 0; //zera a gravidade
			dash_timer -= 1; //reduz o timer
			
			//se o timer zerou
			if(dash_timer <= 0)
			{
				dash_timer = dash_counter; //reseta o timer
				estado = "LIVRE"; //muda de estado
			}
			break;
	}
	
}else hspeed = 0;
gravidade(grav); //Chamando a função de gravidade;
collision(); //Chamando a função de colisão;