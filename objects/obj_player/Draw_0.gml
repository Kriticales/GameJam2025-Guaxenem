//Desenha a sprite
draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha)

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

draw_text(x + sprite_width * 2, y, velv)