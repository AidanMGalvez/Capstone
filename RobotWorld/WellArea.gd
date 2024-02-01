extends Area2D

var entered = false
var change_scene

func _on_WellArea_body_entered(_body):
	entered = true
	
func _on_WellArea_body_exited(_body):
	entered = false
	
func _process(_delta):
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			change_scene = get_tree().change_scene("res://MainWorld/Main.tscn")
			SaveManager.leavewell = true
	
func _physics_process(_delta):
	if Input.is_action_just_pressed("Attack") or Input.is_action_just_pressed("Wall"):
		$CollisionShape2D.disabled = true
		yield(get_tree().create_timer(.4), "timeout")
		$CollisionShape2D.disabled = false
