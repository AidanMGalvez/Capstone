extends Node2D

var opened = false
var entered = false

func _on_Area2D_body_entered(_body):
	entered = true

func _on_Area2D_body_exited(_body):
	entered = false

func _process(_delta):
	if entered == true and opened == true:
		if Input.is_action_just_pressed("ui_accept"):
			$SpiderChestEmpty.visible = true
			$SpiderChestOpen.visible = false
			SaveManager.add_spiderkey()
			SaveManager.coins += 45
			

func _on_Hurtbox_area_entered(_hitbox):
	$SpiderChestClosed.visible = false
	$SpiderChestOpen.visible = true
	opened = true
