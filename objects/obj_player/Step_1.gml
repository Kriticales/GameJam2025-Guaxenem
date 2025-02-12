//Checa se existe um chão
var _chao =
place_meeting(x, y + max(1, velv), obj_solido)
||place_meeting(x, y + max(1, velv), obj_caixa)
||place_meeting(x, y + max(1, velv), obj_player)

//Compara o chão atual com o passado
if(_chao && !chao)
{
	//se estiver no chão agora, e não antes, aplica animação de pouso
	xscale *= 1.5;
	yscale *= 0.5;
	
	jump_start = false;
	
	for(var i = 0; i < irandom_range(8, 16); i++)
	{
		var xx = random_range(x - sprite_width/2, x + sprite_width/2)
		
		instance_create_depth(xx, y, -100, obj_poeira)
	}
	
}