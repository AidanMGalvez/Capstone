extends Area2D

var entered = false
var change_scene

func _on_SpiderArea_body_entered(_body):
	entered = true

func _on_SpiderArea_body_exited(_body):
	entered = false

func _process(_delta):
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			change_scene = get_tree().change_scene("res://UnderGroundWorld/SpiderBossP2.tscn")
