
draw_set_color(c_dkgray)
draw_rectangle(277, y - 1, 310, y + 1, false)
draw_set_color(c_aqua)
draw_rectangle(277, y - 1, x, y + 1, false)
draw_set_color(-1)

draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha)