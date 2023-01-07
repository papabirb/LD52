extends Button

export(String, FILE) var nextScenePath

func _on_Start_Game_pressed():
	get_tree().change_scene(nextScenePath)
