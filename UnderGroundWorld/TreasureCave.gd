extends Area2D



func ready():
	var TreasureCave = get_parent().get_node("TreasureCaveFrontVisible")
	TreasureCave.visible = true

func _on_Area2D_body_entered(_body):
	var TreasureCave = get_parent().get_node("TreasureCaveFrontVisible")
	TreasureCave.visible = false

func _on_Area2D_body_exited(_body):
	var TreasureCave = get_parent().get_node("TreasureCaveFrontVisible")
	TreasureCave.visible = true
