extends KinematicBody2D

const GRAVITY = .2

var velocity = Vector2.ZERO
var movement_enabled = true

func _physics_process(_delta):
	if movement_enabled:
		process_player_movement()
		
func process_player_movement():
	velocity.y += GRAVITY
	velocity = move_and_slide(velocity)

func _on_FloorDetector_area_entered(_area):
	$AnimationPlayer.play("RockExplosion")
	yield(get_tree().create_timer(.2), "timeout")
	queue_free()
	
