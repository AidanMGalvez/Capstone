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

func _physics_process(_delta):
	if Input.is_action_just_pressed("Attack") or Input.is_action_just_pressed("Wall"):
		$SpiderCollision2D.disabled = true
		yield(get_tree().create_timer(.4), "timeout")
		$SpiderCollision2D.disabled = false
	
