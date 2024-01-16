extends Label
@onready var globals = get_node("/root/Globals")

func _ready():
	self.text = Str(globals.player_gold)
