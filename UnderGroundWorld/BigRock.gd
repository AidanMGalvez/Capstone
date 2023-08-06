extends KinematicBody2D

const GRAVITY = .2

var velocity = Vector2.ZERO
var movement_enabled = true

func _physics_process(_delta):
	if movement_enabled:
		process_player_movement()
		
func process_player_movement():
	velocity.y += GRAVITY
	move_and_slide(velocity)

func _on_FloorDetector_area_entered(_area):
	queue_free()

func _input(event):
	if event.is_action_pressed("Inventory"):
		movement_enabled = !movement_enabled
