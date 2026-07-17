extends Node2D

@export var Mob : PackedScene = load("res://scenes/mob/mob.tscn")

func _ready():
	var triangle = get_node("Triangle")
	triangle.game_over.connect(_on_game_over)

func _on_mob_timer_timeout():
	# TODO: we should get these values programmatically.
	var x: int = 577 * 2
	var y: int = 324 * 2
	
	var side = randi() % 4
	
	# TODO: there's probably a cleaner way to write this.
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
	
	mob.squashed.connect($Background/Score._on_mob_squashed.bind())

func startGame() -> void:
	$MobTimer.start()
	$Triangle/ShootTimer.start()
	$Triangle.visible = true
	$DifficultyContainer.visible = false
	$Background/Score.visible = true
	$BGM.play()

func _on_easy_button_pressed() -> void:
	$Triangle/ShootTimer.wait_time = 0.25
	$MobTimer.wait_time = 1.00
	startGame()

func _on_medium_button_pressed() -> void:
	$Triangle/ShootTimer.wait_time = 0.50
	$MobTimer.wait_time = 1.00
	startGame()

func _on_hard_button_pressed() -> void:
	$Triangle/ShootTimer.wait_time = 0.50
	$MobTimer.wait_time = 0.75
	startGame()

func _on_exit_button_pressed() -> void:
	get_tree().quit()

func _on_try_again_button_pressed() -> void:
	$DifficultyContainer.visible = true
	$Background/Score.update_score(0)
	$Background/Score.visible = false
	$GameOverContainer.visible = false

func _on_game_over():
	$MobTimer.stop()
	$Triangle/ShootTimer.stop()
	$Triangle.visible = false
	$GameOverContainer.visible = true
	$BGM.stop()
	get_tree().call_group("mobs", "queue_free")
