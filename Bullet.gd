extends Area2D

var speed = 500

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_Bullet_body_entered(body):
	# TODO: Revisit this for collision logic.
	if body.is_in_group("mobs"):
		body.queue_free()
	queue_free()
