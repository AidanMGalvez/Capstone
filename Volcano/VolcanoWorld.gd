extends Node2D

var entered = false
var change_scene

func _ready():
	if SaveManager.leavefrog == false:
		SaveManager.falling = true
		yield(get_tree().create_timer(3), "timeout")
		SaveManager.falling = false
		yield(get_tree().create_timer(4), "timeout")
		SaveManager.movement = 0

func _physics_process(_delta):
	if SaveManager.falling == true:
		SaveManager.movement = 1
		
	if Input.is_action_just_pressed("Attack") or Input.is_action_just_pressed("Wall"):
		$Lavadoor/Area2D/CollisionShape2D.disabled = true
		yield(get_tree().create_timer(.4), "timeout")
		$Lavadoor/Area2D/CollisionShape2D.disabled = false


func _on_Area2D_body_entered(_body):
	entered = true

func _on_Area2D_body_exited(_body):
	entered = false

func _process(_delta):
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			change_scene = get_tree().change_scene("res://Volcano/FrogBoss.tscn")
