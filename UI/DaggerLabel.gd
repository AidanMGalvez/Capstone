extends Label

func _ready():
	set_process_input(true)
	if get_tree().current_scene.name == "CloudArea":
		modulate = Color(0,0,0)

func _process(_delta):
	self.text = (str(SaveManager.daggercount))
	if SaveManager.daggercount == 0:
		modulate = Color(1,0,0)
	if SaveManager.daggercount > 0 and get_tree().current_scene.name != "CloudArea":
		modulate = Color(1,1,1)
