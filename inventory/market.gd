extends NinePatchRect
var is_open = false
@onready var globals = get_node("/root/Globals")
func _ready():
	close()
func _process(delta):
	if Input.is_action_just_pressed("market"):
		if is_open:
			close()
		else:
			open()
	if is_open == true:
		if Input.is_action_just_pressed("1") and globals.player_gold >=100:
			globals.player_dmg +=5
			globals.player_gold-=100
			
		if Input.is_action_just_pressed("2") and globals.player_gold >=100:
			globals.player_hp +=50
			globals.player_gold-=100
			
		if Input.is_action_just_pressed("3") and globals.player_gold >=150:
			globals.player_speed +=25
			globals.player_gold-=100
			
		if Input.is_action_just_pressed("4") and globals.player_gold >=150:
			globals.player_armor +=5
			globals.player_gold-=100
			
		if Input.is_action_just_pressed("5") and globals.player_gold >=100:
			globals.player_regeneration +=1
			globals.player_gold-=100
			
func open():
	self.visible = true
	is_open = true
func close():
	visible = false
	is_open = false
