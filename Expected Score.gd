extends Label

func _process(delta):
	text = "Required yield: " + String(GrammyHandler.target_percentage * 100) + "%"
