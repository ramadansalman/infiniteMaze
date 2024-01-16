extends State
@onready var globals = get_node("/root/Globals")
func enter():
	super.enter()
	animation_player.play("death")
	globals.player_gold += 500

func boss_slained():
	animation_player.play("boss_slained")
