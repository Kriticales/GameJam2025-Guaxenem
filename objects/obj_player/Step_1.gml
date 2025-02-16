//Checa se existe um chão
var _plat = instance_place(x, y + max(1, velv), obj_plataforma);

var _desce = keyboard_check(vk_down) || keyboard_check(ord("S"))

var _chao =
place_meeting(x, y + max(1, velv), obj_solido)
||(_plat && bbox_bottom <= _plat.bbox_top+2 && velv >0)
||place_meeting(x, y + max(1, velv), obj_caixa)
||place_meeting(x, y + max(1, velv), obj_player)
||place_meeting(x, y + max(1, velv), obj_box_pass)

//Compara o chão atual com o passado
if(_chao && !chao && !_desce)
{
	//se estiver no chão agora, e não antes, aplica animação de pouso
	play_landing();
	xscale *= 1.5;
	yscale *= 0.5;
	
	jump_start = false;
	
	for(var i = 0; i < irandom_range(8, 16); i++)
	{
		var xx = random_range(x - sprite_width/2, x + sprite_width/2)
		
		instance_create_depth(xx, y, -100, obj_poeira)
	}
	
}