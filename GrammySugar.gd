extends RigidBody2D

func _on_VisibilityNotifier2D_screen_exited():
	GrammyHandler.currentlyMulchingGrammy = false
	queue_free()
