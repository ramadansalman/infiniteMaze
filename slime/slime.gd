extends CharacterBody2D

@onready var player = get_parent().find_child("player")
@onready var animated_sprite = $AnimatedSprite2D
@onready var damageable_finder = $Direction/DamageableFinder
@onready var globals = get_node("/root/Globals")

var direction : Vector2

var health = 50:
	set(value):
		health = value
		if value <= 0:
			find_child("FiniteStateMachine").change_state("Death")

func _ready():
	set_physics_process(false)

func _process(delta):
	direction = player.position - position
	
	if direction.x < 0:
		animated_sprite.flip_h = false
	else:
		animated_sprite.flip_h = true

func _physics_process(delta):
	velocity = direction.normalized() * 40
	move_and_collide(velocity * delta)

func take_damage():
	health -= globals.player_dmg

func hit():
	var damageables = damageable_finder.get_overlapping_areas()
	if damageables.size() > 0:
		damageables[0].hit()
	return
