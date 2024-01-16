extends CharacterBody2D

@onready var globals = get_node("/root/Globals")
@onready var player = get_parent().find_child("player")
@onready var animated_sprite = $AnimatedSprite2D
@onready var progress_bar = $UI/ProgressBar
@onready var damageable_finder = $DamageableFinder

var direction : Vector2
var damage = 50
var armor = 7
var health = 100:
	set(value):
		health = value
		progress_bar.value = value
		if value <= 0:
			get_tree().change_scene_to_file("res://level2.tscn")
			progress_bar.visible = false
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
	find_child("FiniteStateMachine").change_state("Hurt")
	health -= (globals.player_dmg - armor)

func hit():
	var damageables = damageable_finder.get_overlapping_areas()
	if damageables.size() > 0:
		damageables[0].hit()
		globals.enemy_damage = damage
	return
