play_win()
global.niveis[unlock_index] = true;
save()
if(!is_last)
{
	room_goto_next();
}
else
{
	room_goto(rm_thanks)
}