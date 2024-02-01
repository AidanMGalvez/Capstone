extends Sprite

var entered = false

func _on_Area2D_body_entered(_body):
	entered = true

func _on_Area2D_body_exited(_body):
	entered = false

func _physics_process(_delta):
	if Input.is_action_just_pressed("Attack") and entered == true:
		$".".frame += 1
		SaveManager.volcanicrock += 1
		if frame == 3:
			queue_free()
