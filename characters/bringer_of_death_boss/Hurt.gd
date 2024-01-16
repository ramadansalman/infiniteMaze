extends State

var can_transition: bool = false

func enter():
	super.enter()
	animation_player.play("hurt")
	await animation_player.animation_finished
	await get_tree().create_timer(1).timeout
	can_transition = true

func transition():
	if can_transition:
		get_parent().change_state("Attack")
		can_transition = false
