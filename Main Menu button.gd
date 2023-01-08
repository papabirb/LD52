extends Button

export(String, FILE) var nextScenePath

func _on_Start_Game_pressed():
	GrammyHandler.reset(6, .6, nextScenePath)
	get_tree().change_scene(nextScenePath)
