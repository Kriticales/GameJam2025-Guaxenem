/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _x = window_get_width() / 2
var _y = 0//window_get_height()

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(fnt_menu)
draw_set_alpha(alpha)

draw_text_transformed(_x, _y + 50, "Você pode mover-se utilizando " +
sprite1 + " e " + sprite2
, tamanho, tamanho, 0)

draw_set_alpha(1)
draw_set_font(-1)
draw_set_valign(-1)
draw_set_halign(-1)
