extends "res://Hitbox.gd"

export(int) var SPEED: int = 160
var initial_position: Vector2 = Vector2.ZERO
var initial_direction: int = 1
var movement_enabled: bool = true

func _physics_process(delta):
	if movement_enabled:
		if initial_direction == 1:
			scale.x = abs(scale.x) * 1
			global_position += SPEED * Vector2.RIGHT * delta
		else:
			scale.x = abs(scale.x) * -1
			global_position += SPEED * Vector2.LEFT * delta

func destroy():
	queue_free()
	
func _on_Node2D_area_entered(_area):
	destroy()

func _on_Node2D_body_entered(_body):
	destroy()

func _on_VisibilityNotifier2D_screen_exited():
	destroy()

func _input(_event):
	if Input.is_action_just_pressed("Inventory"):
		movement_enabled = false
		if SaveManager.movement == 1:
			movement_enabled = true
