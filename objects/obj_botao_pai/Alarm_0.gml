/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor

switch(fazer)
{
	case "SAIR":
		game_end();
	break;
	case "JOGAR":
		room_goto(room_escolhida)
	break;
	case "INICIAR":
	
	for(var _i = 0; _i < array_length(global.niveis); _i++)
	{
		if(global.niveis[_i])
		{
			direto = _i
		}
	}
	if(direto != array_length(global.niveis))
	{
		direto = direto + 1
	}
		room_goto(direto)
	break;

}