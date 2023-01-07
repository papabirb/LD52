extends Node2D

onready var grammy = preload("res://Grammy.tscn").instance()

func _ready():
	randomize()
	$Timer.wait_time = rand_range(3,17)
	$Timer.start()

func _on_Timer_timeout():
	spawn_grammy()

func spawn_grammy():
	# TODO play wiggly animation that switches to Open Pupa sprite
	add_child(grammy)
