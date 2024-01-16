extends CharacterBody2D

@onready var player = get_parent().find_child("player")
@onready var animated_sprite = $AnimatedSprite2D
@onready var progress_bar = $UI/ProgressBar
@onready var damageable_finder = $DamageableFinder
@onready var globals = get_node("/root/Globals")

var direction : Vector2
var damage = 75
var armor = 5
var health = 100:
	set(value):
		health = value
		progress_bar.value = value
		if value <= 0:
			get_tree().change_scene_to_file("res://level3.tscn")
			progress_bar.visible = false
			find_child("FiniteStateMachine").change_state("Death")

var counter = 1

func _ready():
	set_physics_process(false)

func _process(delta):
	direction = player.position - position
	
	if direction.x < 0:
		animated_sprite.flip_h = false
		if counter > 0:
			turn_back()
	else:
		animated_sprite.flip_h = true
		if counter < 1:
			turn()

func _physics_process(delta):
	velocity = direction.normalized() * 40
	move_and_collide(velocity * delta)

func turn():
	if animated_sprite.flip_h == true:
		animated_sprite.position.x += 75
		counter += 1
func turn_back():
	if animated_sprite.flip_h == false:
		animated_sprite.position.x -= 75
		counter -= 1

func take_damage():
	find_child("FiniteStateMachine").change_state("Hurt")
	health -= (globals.player_dmg - armor)

func hit():
	var damageables = damageable_finder.get_overlapping_areas()
	if damageables.size() > 0:
		damageables[0].hit()
		globals.enemy_damage = damage 
	return
