extends RigidBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var mousePos = get_global_mouse_position()
	position.x = mousePos.x


func _on_PlayerPaddle_body_entered(body):
	if body.name == "Grammy":
		$AudioStreamPlayer.pitch_scale = rand_range(0.25,1.75)
		$AudioStreamPlayer.play()
