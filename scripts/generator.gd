extends Position2D

onready var pipe = preload("res://scenes/pipe.tscn")

func _ready():
	randomize()


func _on_Timer_timeout():
	var newPipe = pipe.instance()
	newPipe.position = position + Vector2(0, rand_range(-200, 700))
	get_owner().add_child(newPipe)
