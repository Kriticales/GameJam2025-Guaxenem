if(!tem_cor)
{
	with(obj_locks)
	{
		if(controle == other.bloco_linkado)
		{
			other.image_blend = color;
		}
	}
}
else
{
	image_blend = color;
}

image_speed = 0;
image_index = 0;

terminado = true;