extends Node2D

var entered = false

func _on_Area2D_body_entered(_body):
	entered = true

func _on_Area2D_body_exited(_body):
	entered = false

func _physics_process(_delta):
	if entered == true and Input.is_action_just_pressed("Attack"):
		$AnimationPlayer.play("Barrel toss")
