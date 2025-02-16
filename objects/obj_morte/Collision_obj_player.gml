play_damage();

with(other)
{
	var _issue = true;
	var _max_range = 0;
	var _Trange = 20;
	var _lastY = last_safe_y;
	var _lastX = last_safe_x;
	while(_issue)
	{
		var _col1 = place_meeting(last_safe_x, _lastY - 2, [obj_player, obj_caixa, obj_solido])
	
			if(!_col1)
			{
				_issue = false;
			}
			else if(_max_range >= _Trange)
			{
				_issue = false;
				_lastY = last_safe_y;
			}
			else
			{
				_lastY -= 5
				_max_range ++
			}
	}

	while(_issue)
	{
		var _col1 = place_meeting(_lastX, last_safe_y - 2, [obj_player, obj_caixa, obj_solido])
	
			if(!_col1)
			{
				_issue = false;
			}
			else if(_max_range >= _Trange)
			{
				_issue = false;
				_lastX = last_safe_x;
			}
			else
			{
				_lastX -= 5
				_max_range ++
			}
	}

	while(_issue)
	{
		var _col1 = place_meeting(_lastX, last_safe_y - 2, [obj_player, obj_caixa, obj_solido])
	
			if(!_col1)
			{
				_issue = false;
			}
			else if(_max_range >= _Trange)
			{
				_issue = false;
				_lastX = last_safe_x;
			}
			else
			{
				_lastX += 5
				_max_range ++
			}
	}

	estado = STATE.PARADO;
	velv = 0;
	velh = 0;
	x = _lastX
	y = _lastY
}