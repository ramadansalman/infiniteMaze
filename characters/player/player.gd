extends CharacterBody2D

var SPEED = 75

@onready var animation_player = $AnimationPlayer
@onready var animation_tree: AnimationTree = $AnimationTree
@onready var actionable_finder: Area2D = $Direction/ActionableFinder
@onready var damageable_finder = $Direction/DamageableFinder
@onready var progress_bar = $Camera2D/UI/ProgressBar
@onready var globals = get_node("/root/Globals")
@onready var stats = $Camera2D/UI/Label
var input_vector: Vector2 = Vector2.ZERO


func _ready() -> void:
	$Timer.start()
	animation_tree.active = true
	var SPEED = globals.player_speed
var can_attack = true

var move = ""
func _unhandled_input(_event: InputEvent) -> void:
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0].action()
		return
		
	if Input.is_action_just_pressed("ui_focus_next") and can_attack:
		animation_player.play("attack_" + move)
		var damageables = damageable_finder.get_overlapping_areas()
		if damageables.size() > 0:
			damageables[0].hit()
		return
		
	var x_axis: float = Input.get_axis("ui_left", "ui_right")
	var y_axis: float = Input.get_axis("ui_up", "ui_down")
	if x_axis:
		input_vector = x_axis * Vector2.RIGHT
		if input_vector > Vector2(0,0):
			move = "right"
		else:
			move = "left"
	elif y_axis:
		input_vector = y_axis * Vector2.DOWN
		if input_vector > Vector2(0,0):
			move = "down"
		else:
			move = "up"
	else:
		input_vector = Vector2.ZERO


func _physics_process(_delta: float) -> void:
	if input_vector.length() > 0:
		velocity = input_vector * SPEED
	else:
		velocity = velocity.move_toward(Vector2.ZERO, SPEED)
	
	move_and_slide()
	
	if velocity.length() > 0:
		animation_tree.set("parameters/idle/blend_position", velocity)
		animation_tree.set("parameters/walk/blend_position", velocity)
		animation_tree.get("parameters/playback").travel("walk")
	else:
		animation_tree.get("parameters/playback").travel("idle")

func take_damage():
	globals.player_hp -= (globals.enemy_damage - globals.player_armor)
	progress_bar.value = globals.player_hp
	if globals.player_hp <= 0:
		globals.player_hp = 0
		death()
func _on_timer_timeout():
	globals.player_hp += globals.player_regeneration
	progress_bar.value = globals.player_hp
func death():
	animation_player.play("death")
	get_tree().change_scene_to_file("res://scenes/world.tscn")

