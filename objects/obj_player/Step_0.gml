//cehca se o guaxinim selecionado é esse
if(global.guaxinim[global.selecionado] == object_index)
{
	//se for, passa os controles
	mover(control, pulofunc)
	
	//define a profundidade
	depth = -10;
}
else
{
	//se não for, passa a física
	mover()
	
	//zera a velocidade
	h_vel = 0;
	
	//define a profundidade
	depth = -9;
}