/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var _collision = place_meeting(x, y - 5, obj_caixa) || place_meeting(x, y - 5, obj_bolota);

if(_collision)
{
	image_speed = 1;
	if(image_index >= image_number-1)
	{
		image_speed = 0
		image_index = image_number-1
		if(!terminado)
		{
			with(obj_solido_switch)
			{
				if(controle == other.bloco_linkado)
				{
					active = !active;
				}
			}
			terminado = true;
		}
	}
	else
	{
		terminado = false;
	}
}
else
{
	image_speed = -1
	if(image_index <= 1)
	{
		image_speed = 0;
		image_index = 0;
		if(!terminado)
		{
			with(obj_solido_switch)
			{
				if(controle == other.bloco_linkado)
				{
					active = !active;
				}
			}
			terminado = true;
		}
	}
	else
	{
		terminado = false;
	}
}