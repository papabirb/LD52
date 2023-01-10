extends Button

func _process(delta):
	if GrammyHandler.win:
		text = "Continue"
	else:
		text = "Do better next time, or you're fired!"

func _on_Button_pressed():
	if GrammyHandler.win:
		get_tree().change_scene("res://talky talky screen.tscn")
	else:
		GrammyHandler.reset()
		MusicController.level_music()
		GrammyHandler.nextLevel()
