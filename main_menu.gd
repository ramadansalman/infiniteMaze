extends Control

@onready var globals = get_node("/root/Globals")

func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://scenes/world.tscn") #yeni oyun dosyası

func _on_continue_button_pressed():
	if globals.level == 1:
		get_tree().change_scene_to_file("res://level1.tscn")


func _on_options_button_pressed():
	get_tree().change_scene_to_file("res://options_menu.tscn")
	

func _on_quit_button_pressed():
	get_tree().quit()






