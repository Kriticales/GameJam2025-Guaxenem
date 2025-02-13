/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
xinim = global.guaxinim[global.selecionado];
if(xinim.y >= 380)
{
	var _layer1 = layer_get_id("COVER_TOP")
	var _layer2 = layer_get_id("COVER_BOTTOM")
	layer_background_alpha(_layer1, 100)
	layer_background_alpha(_layer2, 0)
}
else
{
	var _layer1 = layer_get_id("COVER_TOP")
	var _layer2 = layer_get_id("COVER_BOTTOM")
	layer_background_alpha(_layer1, 0)
	layer_background_alpha(_layer2, 100)
}