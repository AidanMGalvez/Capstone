extends Node2D

var entered = false

func _on_Area2D_body_entered(_body):
	if position.y < 40:
		entered = true
		SaveManager.movement = 0

func _on_Area2D_body_exited(_body):
	if position.y > -130:
		entered = false

func _process(delta):
	if entered == true:
		position.y += 30 * delta
		if position.y >= 40:
			position.y = 40
			
	elif entered == false:
		position.y -= 30 * delta
		if position.y <= -130:
			position.y = -130
		
	
