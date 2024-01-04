extends Node2D

func _on_Area2D_body_entered(_body):
	$Player/Camera2D.zoom = Vector2(3, 3)
