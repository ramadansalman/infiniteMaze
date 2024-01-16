extends State

func enter():
	super.enter()
	owner.set_physics_process(true)
	walk()

func walk():
	animation_player.play("walk")
	await animation_player.animation_finished
	walk()

func exit():
	super.exit()
	owner.set_physics_process(false)

func transition():	
	if owner.direction.length() < 60:
		get_parent().change_state("Attack")
	if owner.direction.length() > 150:
		get_parent().change_state("CastSpell")
