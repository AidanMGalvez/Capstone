extends TextureProgress

func _physics_process(_delta):
	if SaveManager.spiderhealth == 0:
		value = 0
	else:
		value = SaveManager.spiderhealth
	
