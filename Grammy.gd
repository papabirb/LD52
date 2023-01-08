extends RigidBody2D


func despawn_grammy():
	GrammyHandler.canSpawn = true
	queue_free()

func despawn_grammy_with_scoring():
	GrammyHandler.score += 1
	# fixed in 4.0 apparently but for now, necessary to do this bc screen exited fires on queue_Free, upside down smiley face
	$VisibilityNotifier2D.disconnect("screen_exited", self, "_on_VisibilityNotifier2D_screen_exited")
	despawn_grammy()

func _on_VisibilityNotifier2D_screen_exited():
	# Play SFX
	GrammyHandler.strikes += 1
	despawn_grammy()

func _on_Grammy_body_entered(body):
	if body.name == "PlayerPaddle":
		pass
		#play random granny quotes
