//Roda o movimento apenas se o personagem está selecionado.
if(global.guaxinim[global.selecionado] == object_index)
{
	switch(estado)
	{
		case "LIVRE":
			mover(hspd); //Chamando a função de movimento e passando a velocidade;
			pular(vspd); //Chamando a função de pulo e passando a velocidade;
			if(keyboard_check_pressed(vk_shift))
			{
				estado = "TRAMPOLIM"
				hspeed = 0;
			}
			break;
			
		case "TRAMPOLIM":
			if(keyboard_check_pressed(vk_shift))
			{
				estado = "LIVRE"
			}
			break;
	}
}else hspeed = 0;
gravidade(grav); //Chamando a função de gravidade;
collision(); //Chamando a função de colisão;