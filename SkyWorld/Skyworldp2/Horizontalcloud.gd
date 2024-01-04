extends Node2D

export(int) var max_distance: int = 360
export(int) var min_distance: int = 0
export(int) var speed: int = 40
var direction = 1
 
func _physics_process(delta):
	position.x += direction * delta * speed
	if position.x >= max_distance:
		direction = -1
	if position.x <= min_distance:
		direction = 1

