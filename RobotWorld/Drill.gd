extends KinematicBody2D

var gravity = 0
var movement_speed = 230
var velocity = Vector2.ZERO
var movement_enabled = true

func _ready():
	gravity = randi() % 4 + 1

func _physics_process(_delta):
	if movement_enabled:
		process_player_movement()

func process_player_movement():
	velocity.y += gravity
	velocity.x = -movement_speed
	velocity = move_and_slide(velocity)

