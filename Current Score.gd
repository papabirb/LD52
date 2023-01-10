extends Label


func _process(delta):
	text = "Current yield: " + String(int(GrammyHandler.current_percentage * 100)) + "%"
