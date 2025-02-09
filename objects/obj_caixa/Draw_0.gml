/// @description Inserir descrição aqui
draw_self();

if(global.debug)
{
	draw_set_color(c_lime);
	draw_rectangle(
	x - interagir,	
	y - interagir,	
	x + interagir,	
	y + interagir,	
	true)
	draw_set_color(c_white);
}