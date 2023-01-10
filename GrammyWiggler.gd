extends Node2D


var sugar = preload("res://GrammySugar.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_body_entered(body):
	if body.name == "Grammy":
		#Animation?
		#SFX?
		body.despawn_grammy_with_scoring()
		$AudioStreamPlayer.pitch_scale = rand_range(0.85, 1.15)
		$AudioStreamPlayer.play()
		GrammyHandler.currentlyMulchingGrammy = true
		yield($AudioStreamPlayer, "finished")
		var newSugar = sugar.instance()
		newSugar.position = $Position2D.position
		add_child(newSugar)
