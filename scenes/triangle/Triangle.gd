extends Area2D

signal game_over

@export var Bullet : PackedScene = load("res://scenes/bullet/bullet.tscn")

func _process(delta):
	look_at(get_global_mouse_position())

func _on_shoot_timer_timeout():
	shoot()
	
func shoot():
	var b = Bullet.instantiate()
	owner.add_child(b)
	b.transform = $Muzzle.global_transform

func _on_area_entered(area):
	if area.is_in_group("mobs"):
		emit_signal("game_over")
