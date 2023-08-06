extends Area2D

func _on_UnderRock_body_entered(_body):
	SaveManager.add_rock()

