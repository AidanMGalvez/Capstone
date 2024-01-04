extends Area2D

var entered = false

func _on_Shop2d_body_entered(_body):
	entered = true
	SaveManager.blockjump = true
	
func _on_Shop2d_body_exited(_body):
	entered = false
	SaveManager.blockjump = false

func _process(_delta):
	if entered == true:
		$Node2D.visible = true
	if entered == false:
		$Node2D.visible = false
