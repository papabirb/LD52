extends Node2D

onready var grammy = preload("res://Grammy.tscn").instance()

func _ready():
	randomize()
	$AnimationPlayer.play("Idle")
	$AnimationPlayer.seek(rand_range(0,0.7))
	$Timer.wait_time = rand_range(1,5)
	$Timer.start()

func _on_Timer_timeout():
	spawn_grammy()

func spawn_grammy():
	if GrammyHandler.canSpawn:
		GrammyHandler.canSpawn = false
		# TODO play wiggly animation that switches to Open Pupa sprite
		$AnimationPlayer.play("Hatch")
		yield($AnimationPlayer,"animation_finished")
		add_child(grammy)
	else:
		$Timer.start()
