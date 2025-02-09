/// @description 
if(global.debug)
{
	visible = true;
}
//SE for inicio do caminho.
if (inicio)
{
	plataforma_ID.startX = x; //setta começo X da plataforma
	plataforma_ID.startY = y; //setta começo Y da plataforma
}else
{
	plataforma_ID.endX = x; //setta destino X da plataforma
	plataforma_ID.endY = y; //setta destino Y da plataforma
}
