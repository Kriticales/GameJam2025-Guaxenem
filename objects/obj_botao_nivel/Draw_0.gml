draw_sprite_ext(sprite_index, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha)


//Define a Fonte que vai ser usada
draw_set_font(fnt_menu);

//Faz o texto ficar no centro do Botão
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_color(cor_do_texto);
//Faz desenhar o texto do Botões
draw_text_transformed(x, y, texto_dos_botao, txt_xscale, txt_yscale, image_angle);

draw_set_color(-1);

//Alinhar a origem do texto
draw_set_halign(-1);
draw_set_valign(-1);

//Reseta a fonte para a padrão
draw_set_font(-1);