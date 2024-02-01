extends Node2D

var opened = false
var entered = false

func _on_Area2D_body_entered(_body):
	entered = true

func _on_Area2D_body_exited(_body):
	entered = false

func _process(_delta):
	if entered == true and opened == false:
		$Label.visible = true
	if entered == false and opened == false:
		$Label.visible = false
	if opened == true:
		$Label.visible = false
		
	if entered == true and opened == true and SaveManager.collectearth == false:
		if Input.is_action_just_pressed("ui_accept"):
			$Openlavachest.visible = true
			$Openfulllavachest.visible = false
			SaveManager.add_earthkey()
			SaveManager.coins += 45
			SaveManager.collectearth = true

func _on_Hurtbox_area_entered(_hitbox):
	$Closedlavachest.visible = false
	opened = true
	if SaveManager.collectearth == false:
		$Openfulllavachest.visible = true
	else:
		$Openlavachest.visible = true
