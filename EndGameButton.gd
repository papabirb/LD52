extends Button


func _on_Button_pressed():
	GrammyHandler.full_reset()
	MusicController.non_level_music()
	get_tree().change_scene(GrammyHandler.menu)
