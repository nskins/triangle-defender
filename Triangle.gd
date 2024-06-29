extends Area2D

@export var Bullet : PackedScene = load("res://bullet.tscn")

func _process(delta):
	look_at(get_global_mouse_position())

func _on_shoot_timer_timeout():
	shoot()
	
func shoot():
	var b = Bullet.instantiate()
	owner.add_child(b)
	b.transform = $Muzzle.global_transform
