extends Area2D

var entered = false
var change_scene

func _on_SceneChange_body_entered(_body: PhysicsBody2D):
	entered = true

func _on_SceneChange_body_exited(_body):
	entered = false

func _process(_delta):
	if entered == true:
		change_scene = get_tree().change_scene("res://MainWorld/Main.tscn")
		SaveManager.LeaveSky = true

