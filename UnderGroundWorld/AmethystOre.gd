extends Node2D

var entered = false
var hit_count = 1

func _on_Area2D_body_entered(_body):
	entered = true

func _on_Area2D_body_exited(_body):
	entered = false

func _physics_process(_delta):
	if entered == true:
		if Input.is_action_just_pressed("Attack") and hit_count <= 4:
			hit_count += 1
			SaveManager.amethyst += 1
			print(hit_count)
		if hit_count >=4:
			$".".visible = false
