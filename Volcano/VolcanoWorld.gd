extends Node2D

var entered = false
var change_scene
var stairs = false
var leavemine = false
var leavevol = false
var topexit = false


func _ready():
	if SaveManager.leavefrog == false:
		SaveManager.falling = true
		yield(get_tree().create_timer(3), "timeout")
		SaveManager.falling = false
		yield(get_tree().create_timer(4), "timeout")
		$LeaveVolcano/CollisionShape2D.disabled = false
		SaveManager.movement = 0
	if SaveManager.leavefrog == true:
		$LeaveVolcano/CollisionShape2D.disabled = false
	
	$Background/Lavaminecover.visible = false
	$Background/Lavamine/minefloors/CollisionPolygon2D.disabled = true
	$LavaLaunch/Lavarocket/LandingSpot/CollisionShape2D.position = Vector2(161,1134)
	
func _on_StairArea_body_entered(_body):
	stairs = true
func _on_StairArea_body_exited(_body):
	stairs = false
	
func _on_ExitMine_body_entered(_body):
	leavemine = true
func _on_ExitMine_body_exited(_body):
	leavemine = false

func _on_LeaveVolcano_body_exited(_body):
	leavevol = false
func _on_LeaveVolcano_body_entered(_body):
	leavevol = true


func _on_TopExit_body_entered(_body):
	topexit = true
func _on_TopExit_body_exited(_body):
	topexit = false

func _physics_process(_delta):
	if SaveManager.falling == true:
		SaveManager.movement = 1

	if leavevol == true:
		if Input.is_action_just_pressed("ui_accept"):
			$LavaLaunch.play("LavaLaunch")

	if stairs == true:
		if Input.is_action_just_pressed("ui_accept"):
			$Player.position = Vector2(-375,1090)
			$Background/Lavaminecover.visible = true
			$Background/Lavamine/minefloors/CollisionPolygon2D.disabled = false
			$Player.scale = Vector2(0.8,0.8)
			
	if leavemine == true:
		if Input.is_action_just_pressed("ui_accept"):
			$Player.position = Vector2(-375,1090)
			$Background/Lavaminecover.visible = false
			$Background/Lavamine/minefloors/CollisionPolygon2D.disabled = true
			$Player.scale = Vector2(1,1)
			
	if topexit == true:
		change_scene = get_tree().change_scene("res://MainWorld/Main.tscn")
		
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


func _on_lava_body_entered(body):
	var launch_speed = 50
	var direction = Vector2(0, -1) 
	var impulse = direction * launch_speed
	if body is Node2D:
		body.position += impulse
