extends Node2D

var enteredwell = false
var change_scene

func _on_WellEntrace_body_entered(_body):
	enteredwell = true
	$Well/Label.visible = true
func _on_WellEntrace_body_exited(_body):
	enteredwell = false
	$Well/Label.visible = false

func _physics_process(_delta):
	if enteredwell == true:
		if Input.is_action_just_pressed("ui_accept"):
			change_scene = get_tree().change_scene("res://RobotWorld/Robotworld.tscn")
