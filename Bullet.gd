extends Area2D

var speed = 500

func _physics_process(delta):
	position += transform.x * speed * delta
	
func _on_area_entered(area):
	# TODO: Revisit this for collision logic.
	if area.is_in_group("mobs"):
		area.queue_free()
	queue_free()
