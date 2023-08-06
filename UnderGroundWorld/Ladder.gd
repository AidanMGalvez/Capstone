extends Area2D

var entered = false
var change_scene

func _on_Area2D_body_entered(_body: PhysicsBody2D):
	entered = true

func _on_Area2D_body_exited(_body):
	entered = false

func _process(_delta):
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			change_scene = get_tree().change_scene("res://Main.tscn")
