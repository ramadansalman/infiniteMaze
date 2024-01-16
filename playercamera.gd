extends Camera2D

var speed = 200.0
var sensitivity = 0.5

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Vector2(0, 0)
	
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1

	# Hareket vektörünü normalleştir ve hızla çarp
	direction = direction.normalized() * speed * delta

	# Kamerayı hareket ettir
	offset += direction * sensitivity
