/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
xinim = global.guaxinim[global.selecionado];
if(xinim.y >= 380)
{
	var _layer1 = layer_get_id("COVER_TOP")
	var _layer2 = layer_get_id("COVER_BOTTOM")
	layer_set_visible(_layer1, true)
	layer_set_visible(_layer2, false)
}
else
{
	var _layer1 = layer_get_id("COVER_TOP")
	var _layer2 = layer_get_id("COVER_BOTTOM")
	layer_set_visible(_layer1, false)
	layer_set_visible(_layer2, true)
}