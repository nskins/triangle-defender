extends Area2D

signal squashed

var speed = 100

# TODO: it would be better to get these numbers from the
#       current position of the Triangle instead of hardcoding.
var destination = Vector2(577, 324)

func _ready():
	add_to_group("mobs")

func _physics_process(delta):
	look_at(destination)
	
	var normalized_destination = destination.normalized()
	
	position += transform.x * speed * delta

func squash():
	squashed.emit()
	queue_free()
