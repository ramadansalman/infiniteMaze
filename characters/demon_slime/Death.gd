extends State
@onready var globals = get_node("/root/Globals")
func enter():
	super.enter()
	globals.player_gold += 500 
#		animation_player.play("death")

func boss_slained():
	animation_player.play("boss_slained")
