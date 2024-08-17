extends Node2D

#variables
@export var cloudTop : Sprite2D
@export var cloudBot : Sprite2D
@export var groundBuild : Sprite2D
@export var groundHorizon : Sprite2D
var backElements = []
var oldBackPos = []

# Called when the node enters the scene tree for the first time.
func _ready():
	backElements.append(cloudTop)
	backElements.append(cloudBot)
	backElements.append(groundBuild)
	backElements.append(groundHorizon)
	for i in range (backElements.size()):
		oldBackPos.append(backElements[i].pos)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func scroll (amount, duration):
	for i in range (oldBackPos.size()):
		oldBackPos[i] = backElements[i].pos
	var time = 0
	var t = 0
	var adjust = 0
	while time < duration:
		t = time/duration
		for i in range (backElements.size()):
			adjust = amount/(5*(1+(i%2)))
			backElements[i].pos = lerp(oldBackPos[i], Vector2i(oldBackPos[i].x,oldBackPos[i].y+adjust), t)
		time += Maingame.globalDelta
		await get_tree().process_frame
	pass
