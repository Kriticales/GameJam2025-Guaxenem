if(rex && bolota && fumaca)
{
	if(global.selecionado < array_length(global.guaxinim) -1)
	{
		global.selecionado += 1
	}else
	{
		global.selecionado = 0;
	}
}
else if(rex && bolota)
{
	//0 & 1
	if(global.selecionado == 0)
	{
		global.selecionado = 1
	}else
	{
		global.selecionado = 0;
	}
	
}
else if(rex && fumaca)
{
	//0 & 2
	if(global.selecionado == 0)
	{
		global.selecionado = 2
	}else
	{
		global.selecionado = 0;
	}
}
else if(bolota && fumaca)
{
	//1 & 2
	if(global.selecionado == 1)
	{
		global.selecionado = 2
	}else
	{
		global.selecionado = 1;
	}
}