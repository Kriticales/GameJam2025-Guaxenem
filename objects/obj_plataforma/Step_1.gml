var _destinoX = endX; //setta a variável de destino X para o final
var _destinoY = endY; //setta a variável de destino Y para o final

if (voltando) {
	_destinoX = startX; //setta a variável de destino X para o inicio
	_destinoY = startY; //setta a variável de destino Y para o inicio
}

//Movimentação
//Converte a direção e velocidade e adiciona ao movimento
hspd = sign(_destinoX - x) * current_speed; 
vspd = sign(_destinoY - y) * current_speed;