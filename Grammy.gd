extends RigidBody2D

export(Array, AudioStream) var boneCrunch
export(Array, AudioStream) var grannyBounce
export(Array, AudioStream) var grannyDie

func _ready():
	randomize()

func despawn_grammy():
	$Sprite.visible = false
	$CollisionShape2D.queue_free()
	yield($VoiceLines, "finished")
	GrammyHandler.canSpawn = true
	queue_free()

func despawn_grammy_with_scoring():
	if GrammyHandler.next_level == 4:
		GrammyHandler.total_score +=1 # Double pay for bonus levels
	GrammyHandler.score += 1
	# fixed in 4.0 apparently but for now, necessary to do this bc screen exited fires on queue_Free, upside down smiley face
	$VisibilityNotifier2D.disconnect("screen_exited", self, "_on_VisibilityNotifier2D_screen_exited")
	$VoiceLines.stream = grannyDie[2]
	$VoiceLines.pitch_scale = rand_range(0.75, 1.25)
	$VoiceLines.play()
	despawn_grammy()

func _on_VisibilityNotifier2D_screen_exited():
	$VoiceLines.stream = grannyDie[randi() % grannyDie.size()]
	$VoiceLines.pitch_scale = rand_range(0.85, 1.15)
	$VoiceLines.play()
	GrammyHandler.strikes += 1
	despawn_grammy()

func _on_Grammy_body_entered(body):
	$BoneCrunch.stream = boneCrunch[randi() % boneCrunch.size()]
	$BoneCrunch.pitch_scale = rand_range(0.85, 1.15)
	$BoneCrunch.play()
	if body.name == "PlayerPaddle":
		$VoiceLines.stream = grannyBounce[randi() % grannyBounce.size()]
		$VoiceLines.pitch_scale = rand_range(0.85, 1.15)
		$VoiceLines.play()
