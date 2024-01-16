extends  Node

@onready var globals = get_node("/root/Globals")
func _ready():
	globals.player_hp = 100
