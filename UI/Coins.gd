extends Label

onready var coin = $"../Coin"

func _ready():
	set_process_input(true)
	if get_tree().current_scene.name == "CloudArea":
		modulate = Color(0,0,0)
		
func _process(_delta):
	self.text = (str(SaveManager.coins))
	if SaveManager.coins >= 10:
		rect_position = Vector2(300,1)
		coin.position = Vector2(293,8)
		if SaveManager.coins >= 100:
			rect_position = Vector2(291,1)
			coin.position = Vector2(284,8)
