extends Area2D

var entered = false
var hit_count = 1

func _on_Area2D_body_entered(_body):
	entered = true

func _on_Area2D_body_exited(_body):
	entered = false

func _physics_process(_delta):
	if entered == true:
		if Input.is_action_just_pressed("Attack") and hit_count <= 7:
			hit_count += 1
			SaveManager.wood += 1
		if hit_count >=7:
			$"..".visible = false
