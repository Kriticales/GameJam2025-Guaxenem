/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

var _x = window_get_width() / 2
var _y = 0//window_get_height()

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_font(fnt_menu)
draw_set_alpha(alpha)

draw_text_ext_transformed(_x, _y + 50, "OH, ESSES SÃO RAROS!", 0, _x, tamanho, tamanho, 0)
draw_text_ext_transformed(_x, _y + 100, "Os cristais azuis te jogam pra cima", 0, _x, tamanho, tamanho, 0)

draw_set_alpha(1)
draw_set_font(-1)
draw_set_valign(-1)
draw_set_halign(-1)
