extends Node2D

onready var felpudo = get_node("Felpudo")
onready var timereplay = get_node("TimeToReplay")
onready var label = get_node("Node2D/Control/Label")

var points = 0
var state = 1

const PLAYING = 1
const LOSING = 2


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func points():
	points += 1
	label.set_text(str(points/2))
	get_node("SoundScore").play()

func kill():
	felpudo.apply_impulse(Vector2(0, 0), Vector2(-1000, 0))
	get_node("BackgroundAnim").stop()
	state = LOSING
	timereplay.start()
	get_node("SoundHit").play()

func _on_TimeToReplay_timeout():
	get_tree().reload_current_scene()
