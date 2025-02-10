draw_self(); //Desenha a si mesmo 

//Define a Fonte que vai ser usada
draw_set_font(fnt_menu);

//Faz o texto ficar no centro do Botão
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

//Faz desenhar o texto do Botões
draw_text(x, y, texto_dos_botao);

//Alinhar a origem do texto
draw_set_halign(fa_left);
draw_set_valign(fa_top);

//Reseta a fonte para a padrão
draw_set_font(-1);