extends Area2D

var entered = false
var change_scene

func _on_GeyserLaunch_body_entered(_body: PhysicsBody2D):
	entered = true

func _on_GeyserLaunch_body_exited(_body):
	entered = false

func _process(_delta):
	var animation = get_parent().get_node("GeyserAnimation")
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			animation.play("Geyser")



