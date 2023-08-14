extends "res://Hitbox.gd"

export(int) var SPEED: int = 100
var initial_position: Vector2 = Vector2.ZERO
var initial_direction: int = 1

func _physics_process(delta):
	if initial_direction == 1:
		scale.x = abs(scale.x) * 1
		global_position += SPEED * Vector2.RIGHT * delta
	else:
		scale.x = abs(scale.x) * -1
		global_position += SPEED * Vector2.LEFT * delta

func destroy():
	print(global_position)
	queue_free()
	
	
func _on_Node2D_area_entered(_area):
	destroy()

func _on_Node2D_body_entered(_body):
	destroy()
	print("hitbody")

func _on_VisibilityNotifier2D_screen_exited():
	destroy()
	print("off camera")
