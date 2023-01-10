extends Button

func _ready():
	MusicController.non_level_music()

func _on_Start_Game_pressed():
	GrammyHandler.reset()
	get_tree().change_scene("res://talky talky screen.tscn")
