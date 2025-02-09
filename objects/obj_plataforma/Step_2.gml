/// @description 
//Aumenta o X e Y baseado na velocidade
x += hspd;
y += vspd;

//Checando se está no inicio
//SE voltando e a distancia entre plataforma e inicio for menor que a velocidade...
if (voltando && point_distance(x, y, startX, startY) < current_speed)
{
	voltando = false;		//setta voltando como falso
	current_speed = 0;		//para plataforma
	alarm[0] = wait_time;	//faz a plataforma esperar
}
//Checando se está no final
//SE não voltando e a distancia entre plataforma e final for menor que a velocidade...
else if (!voltando && point_distance(x, y, endX, endY) < current_speed)
{
	voltando = true;		//setta voltando como verdade
	current_speed = 0;		//para plataforma
	alarm[0] = wait_time;	//faz a plataforma esperar
}