extends Node2D

var seedToUse : int

# Called when the node enters the scene tree for the first time.
func _ready():
	seedToUse = 42
	if seedToUse:
		seed(seedToUse)
	get_tree().change_scene_to_file("res://main_menu.tscn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
