mul//Roda o movimento apenas se o personagem está selecionado.
if(global.guaxinim[global.selecionado] == object_index)
{
	mover(hspd); //Chamando a função de movimento e passando a velocidade;
	pular(vspd); //Chamando a função de pulo e passando a velocidade;
}else hspeed = 0;
gravidade(grav); //Chamando a função de gravidade;
collision(); //Chamando a função de colisão;