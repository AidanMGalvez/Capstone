extends Node2D

func _ready():
	var random = randi()% 3
	if random == 0:
		$TextureRect.texture = load("res://UI/SwordOutline.png")
	elif random == 1:
		$TextureRect.texture = load("res://UI/cloakoutline.png")
		var scale_factor = Vector2(0.4, 0.4)
		$TextureRect.rect_scale = scale_factor
		$TextureRect.rect_position = Vector2(5, 2)
	else:
		$TextureRect.texture = load("res://Player/dagger.png")

