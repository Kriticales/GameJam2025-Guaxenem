#region MOVIMENTAÇÃO VERTICAL

	//--------------COLISÕES
	if(place_meeting(x, y + velv, obj_solido))
	{
		while(!place_meeting(x, y + sign(velv), obj_solido))
		{
			y += sign(velv);
		}
		velv = 0;
	}

	//--------------APLICANDO VELOCIDADE
	y += velv;
#endregion

#region MOVIMENTAÇÃO HORIZONTAL

	//--------------COLISÕES
	if(place_meeting(x + velh, y, obj_solido))
	{
		while(!place_meeting(x + sign(velh), y, obj_solido))
		{
			x += sign(velh);
		}
		velh = 0;
	}

	//--------------APLICANDO VELOCIDADE
	x += velh
#endregion