extends RigidBody2D


func despawn_grammy():
	GrammyHandler.canSpawn = true
	queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	# Play SFX
	despawn_grammy()
