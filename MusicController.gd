extends AudioStreamPlayer


var nextStream = preload("res://Inbetween Screen Music.ogg")

# Called when the node enters the scene tree for the first time.
func _ready():
	play_with_yield()


func non_level_music():
	stream = preload("res://Inbetween Screen Music.ogg")

func level_music():
	stream = preload("res://Industrial Clown v3.ogg")

func play_with_yield():
	yield(VisualServer, "frame_post_draw")
	play()

func _on_MusicController_finished():
#	stream = nextStream
	play_with_yield()
