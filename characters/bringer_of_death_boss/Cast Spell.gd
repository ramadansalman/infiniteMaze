extends State

@export var spell_node: PackedScene

var can_transition: bool = false

func enter():
	super.enter()
	animation_player.play("cast")
	await animation_player.animation_finished
	await get_tree().create_timer(1).timeout
	can_transition = true

func spell():
	var spell = spell_node.instantiate()
	spell.position = player.position - Vector2(0,30)
	get_tree().current_scene.call_deferred("add_child", spell)
	
func transition():
	if can_transition:
		get_parent().change_state("Follow")
		can_transition = false
