extends Node2D

@export var Mob : PackedScene = load("res://mob.tscn")

func _on_mob_timer_timeout():
	# TODO: we should get these values programmatically.
	var x: int = 577 * 2
	var y: int = 324 * 2
	
	var side = randi() % 4
	
	match side:
		0:
			x = randi() % x
			y = 0
		1:
			y = randi() % y
		2:
			x = randi() % x
		3:
			x = 0
			y = randi() % y
	
	var mob = Mob.instantiate()
	add_child(mob)
	mob.position.x = x
	mob.position.y = y
