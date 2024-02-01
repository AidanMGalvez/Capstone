extends Node2D

var open = false

func _ready():
	if not SaveManager.initialized:
		SaveManager.movement = 1
		open = true
		$CanvasLayer.visible = true
		animations()
		SaveManager.initialized = true
		
func _process(_delta):
	if Input.is_action_just_pressed("OpenControls"):   
		if open:
			SaveManager.movement = 0
			open = false
			
		else:
			SaveManager.movement = 1
			open = true
		$CanvasLayer.visible = !$CanvasLayer.visible
		animations()

func animations():
	$"CanvasLayer/PlayerSheet/WRAnimation".play("WR")
	$"CanvasLayer/PlayerSheet/WLAnimation".play("WL")
	$"CanvasLayer/PlayerSheet/SwingAnimation".play("Swing")
	$"CanvasLayer/PlayerSheet/DaggerAnimation".play("Dagger")
	$"CanvasLayer/PlayerSheet/ShieldAnimation".play("Shield")
	$"CanvasLayer/PlayerSheet/JumpAnimation".play("Jump")
	$"CanvasLayer/PlayerSheet/ChestAnimation".play("Chest")
