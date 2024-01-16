extends Area2D

@onready var damageable_finder = $DamageableFinder

func hit():
	var damageables = damageable_finder.get_overlapping_areas()
	if damageables.size() > 0:
		damageables[0].hit()
	return
