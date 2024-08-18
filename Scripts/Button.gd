extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	pressed.connect(startgame)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func startgame():
	get_tree().call_deferred("change_scene_to_file", "res://Nodes/climb.tscn")
	pass
