extends Button


func _on_Button_pressed():
	GrammyHandler.reset()
	MusicController.level_music()
	GrammyHandler.nextLevel()
