extends Node2D

#const
const SCREEN_SCALE = 30
const SCREEN_SIZE = Vector2i(1920,1080)
const SCROLL_SPEED = 1

#scenes
var playerScene = preload("res://nodes/player.tscn")

#variables
@export var Background : Node2D
var isPlaying = false
var player
var bars = []
var barsOldPos = []
var globalDelta

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	globalDelta = delta
	pass

func setup():
	pass

func _scrollCamera(playerLoc):
	var newLoc = playerLoc.y
	var adjust = 0
	var time = 0
	var t = 0
	var duration = 0
	if newLoc <  SCREEN_SIZE.y/2:
		adjust = SCREEN_SIZE.y/2 - newLoc
		duration = adjust/SCROLL_SPEED
		#var playerOldPos = player.pos
		for i in range (bars.size()):
			barsOldPos[i].append(bars[i].pos)
		Background.scroll (adjust, duration)
		while time < duration:
			t = time/duration
			#player.pos = lerp(playerOldPos,Vector2i(playerOldPos.x,playerOldPos.y+adjust), t)
			for i in range (bars.size()):
				bars[i].pos = lerp(barsOldPos[i],Vector2i(barsOldPos[i].x,barsOldPos[i].y+adjust), t)
			time += globalDelta
			await get_tree().process_frame
		#player.pos = Vector2i(playerOldPos.x,playerOldPos.y+adjust)
		for i in range (bars.size()):
			bars[i].pos = Vector2i(barsOldPos[i].x,barsOldPos[i].y+adjust)
		for i in range (barsOldPos.size()):
			barsOldPos[i].queue_free()
		barsOldPos = []
