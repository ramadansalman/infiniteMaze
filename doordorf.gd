extends Area2D

@onready var globals = get_node("/root/Globals")
# Called when the node enters the scene tree for the first time.
func _ready():
	$".".set_position(Vector2i(220,210))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		if get_overlapping_bodies().size() >= 0:
			globals.level = 1
#			globals.save_to_file()
			get_tree().change_scene_to_file("res://level1.tscn")
