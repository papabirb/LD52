extends Button

func _on_Start_Game_pressed():
	GrammyHandler.reset()
	get_tree().change_scene(GrammyHandler.level[GrammyHandler.next_level])
