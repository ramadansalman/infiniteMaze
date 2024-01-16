extends State

func enter():
	super.enter()
	attack()

func attack():
	animation_player.play("attack")
	await animation_player.animation_finished
	attack()

func transition():
	if owner.direction.length() > 60:
		get_parent().change_state("Follow")
