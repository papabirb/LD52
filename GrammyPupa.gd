extends Node2D

onready var grammy = preload("res://Grammy.tscn").instance()
export(Array, AudioStream) var hatchSounds

func _ready():
	randomize()
	$AnimationPlayer.play("Idle")
	$AnimationPlayer.seek(rand_range(0,0.7))
	if GrammyHandler.next_level == 4:
		$Timer.wait_time = rand_range(5,10)
	else:
		$Timer.wait_time = rand_range(1,5)
	$Timer.start()

func _on_Timer_timeout():
	spawn_grammy()

func spawn_grammy():
	if GrammyHandler.canSpawn:
		GrammyHandler.canSpawn = false
		$AnimationPlayer.play("Hatch")
		yield($AnimationPlayer,"animation_finished")
		$AudioStreamPlayer.stream = hatchSounds[randi() % hatchSounds.size()]
		$AudioStreamPlayer.pitch_scale = rand_range(0.85, 1.15)
		$AudioStreamPlayer.play()
		add_child(grammy)
	else:
		if GrammyHandler.next_level == 4:
			GrammyHandler.canSpawn = true #Crazy mode for bonus level
			$Timer.wait_time = rand_range(5,10)
		$Timer.start()
