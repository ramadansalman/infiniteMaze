extends Area2D

func hit():
	get_parent().take_damage()
