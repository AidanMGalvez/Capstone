extends Area2D

func _on_Area2D_body_entered(_body):
	var cave = get_parent().get_node("CaveOverlay")
	cave.visible = false

func _on_Area2D_body_exited(_body):
	var cave = get_parent().get_node("CaveOverlay")
	cave.visible = true
