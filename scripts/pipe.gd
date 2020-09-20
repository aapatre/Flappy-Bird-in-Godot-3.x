extends Node2D

export var vel = -400

var scene

func _ready():
	scene = get_tree().get_current_scene()
	set_process(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if scene.state == scene.PLAYING :
		position = position + Vector2(vel * delta, 0)
	
	if position.x < -100:
		queue_free()
	


func _on_Area2D_body_entered(body):
	if body.get_name() == "Felpudo":
		scene.kill()



func _on_PointsArea_body_exited(body):
	scene.points()
	get_node("PointsArea").queue_free()
