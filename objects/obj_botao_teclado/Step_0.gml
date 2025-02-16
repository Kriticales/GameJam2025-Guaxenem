/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
if(active)
{
	var _input1 = keyboard_key;
	var _close_case = keyboard_check_released(vk_anykey);
	
	if(keyboard_check_pressed(vk_escape))
	{
		active = false;
		image_blend = c_white;
	}
	else if(_input1 != 0)
	{
		true_input = _input1
	}
	
	if(_close_case)
	{	
		
		global.array_controls[muda_tecla] = true_input;
		active = false;
		input_text = global.array_controls[muda_tecla]
		image_blend = c_white;
		
	}
}
else
{
	image_blend = c_white;
	for(var _i = 0; _i < array_length(global.array_controls); _i++)
	{
		if(_i != muda_tecla)
		{
		
			if(global.array_controls[muda_tecla] == global.array_controls[_i])
			{
				image_blend = c_red;
			}
		}
	}
}

xscale = lerp(xscale, image_xscale, 0.1);
yscale = lerp(yscale, image_yscale, 0.1);
txt_xscale = lerp(txt_xscale, escala_texto, 0.1);
txt_yscale = lerp(txt_yscale, escala_texto, 0.1);