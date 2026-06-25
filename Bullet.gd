extends Area2D

var speed = 500

func _physics_process(delta):
	position += transform.x * speed * delta
	
func _on_area_entered(area):
	if area.is_in_group("mobs"):
		area.squash()
	queue_free()

# Free up memory when the bullet hits the edge of the screen.
# The amount of time to exit the viewport is estimated with a timer.
func _on_timer_timeout() -> void:
	queue_free()
