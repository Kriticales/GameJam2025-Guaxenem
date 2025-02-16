image_got = false;

if(global.guaxinim[global.selecionado] == object_index)
{
	if(pop)
	{
		shader_set(white_shader)
		pop = false;
	}
}
else
{
	pop = true;
}
draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha)

shader_reset()

if(global.debug)
{
	draw_set_color(c_lime)
	draw_line(x, y-(sprite_height/2), x+(20 * facing), y-(sprite_height/2))
	draw_set_color(-1)
	draw_set_halign(fa_center)
	draw_text(x, y - sprite_height * 2, estado_string)
	draw_text(x, y - sprite_height * 3, image_index)
	draw_set_halign(-1)
}

if(object_index = obj_fumaca && pop_dash)
	{
		pop_timer -= 1;
		gpu_set_blendmode(bm_add)
		draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, c_lime, image_alpha)
		gpu_set_blendmode(-1)
		if(pop_timer <= 0)
		{
			pop_timer = pop_time
			pop_dash = false;
		}
	}