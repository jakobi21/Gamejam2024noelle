extends AnimatedSprite2D

#constant
const VERT_A = 1

#variables
var holding = true
var pos
var horzV
var vertV

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if holding:
		pass
	else:
		pos += Vector2i (horzV,vertV)
		vertV += VERT_A
		pass
