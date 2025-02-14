if(active)
{
	visible = active;
	image_speed = -1
	if(image_index <= 1)
	{
		image_index = 0;
		image_speed = 0
	}
}
else
{
	image_speed = 1
	
	if(image_index >= image_number-1)
	{
		visible = active;
	}
}