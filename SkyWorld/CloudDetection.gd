extends Area2D

var entered = false
var Lwall
var Rwall
var anim

func _on_CloudDetection_body_entered(_body):
	entered = true

func _on_CloudDetection_body_exited(_body):
	entered = false

func _process(_delta):
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			Lwall = get_parent().get_node("StaticBody2D/LeftWall")
			Rwall = get_parent().get_node("StaticBody2D/RightWall")
			Lwall.disabled = false
			Rwall.disabled = false
			anim = get_parent().get_node("AnimationPlayer")
			anim.play("MovingDown")


