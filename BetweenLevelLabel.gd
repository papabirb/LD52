extends Label


func _ready():
	var pupa_yield = String(int(GrammyHandler.current_percentage * 100)) + "%"
	if GrammyHandler.win:
		text = "Great work on the " + pupa_yield + " yield!"
	else:
		text = "Yikes, only a " + pupa_yield + " yield..."
