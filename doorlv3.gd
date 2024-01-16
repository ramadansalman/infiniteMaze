extends Area2D
@onready var globals = get_node("/root/Globals")
# Called when the node enters the scene tree for the first time.
func _ready():
	$".".set_position(Vector2i(33*22,34*21))
	globals.player_gold += 250

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event.is_action_pressed("ui_accept"):
		if get_overlapping_bodies().size() >= 1:
			print("da")
			get_tree().change_scene_to_file("res://level4.tscn")
