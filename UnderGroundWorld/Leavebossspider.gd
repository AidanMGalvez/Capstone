extends Sprite

var entered = false
var change_scene

func _on_Area2D_body_entered(_body):
	entered = true

func _on_Area2D_body_exited(_body):
	entered = false
	
func _process(_delta):
	if entered == true:
		change_scene = get_tree().change_scene("res://UnderGroundWorld/Underground.tscn")
		SaveManager.leavespiderboss = true
	
func _physics_process(_delta):
	if Input.is_action_just_pressed("Attack") or Input.is_action_just_pressed("Wall"):
		$Area2D/CollisionShape2D.disabled = true
		yield(get_tree().create_timer(.4), "timeout")
		$Area2D/CollisionShape2D.disabled = false
