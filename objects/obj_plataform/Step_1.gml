
//Seleciona o algo
var _targetX = endX, _targetY = endY;

if (going_to_start)
	{
		_targetX = startX;
		_targetY = startY;
	}
	
	//Coloca o movimento
moveX = sign(_targetX - x) * current_speed; //Movimento da Plataforma, mais a velocidade
moveY = sign(_targetY - y) * current_speed; //Movimento da Plataforma, mais a velocidade