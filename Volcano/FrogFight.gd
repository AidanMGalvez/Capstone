extends Node2D

var started = false
var is_jumping_up = true
var jumpcount = 0
var direction = -85
var spawned = false
var froghealth = 150
var exit = false
var change_scene
var chestup = false
var chestdown = false

func _on_Area2D_body_entered(_body):
	$Player/Camera2D.zoom = Vector2(3, 3)
	started = true

func _physics_process(delta):
	if SaveManager.frogdefeat == true:
		$Frogboss/Hitbox/CollisionShape2D.disabled = true
		$Frogboss.visible = false
		$Frogboss/Hurtbox/CollisionShape2D.disabled = true
		$StaticBody2D/CollisionShape2D.disabled = false
		
	if exit == true and SaveManager.frogdefeat == true:
		if Input.is_action_just_pressed("ui_accept"):
			SaveManager.leavefrogboss = true
			change_scene = get_tree().change_scene("res://Volcano/FrogBoss.tscn")
			
		if Input.is_action_just_pressed("Attack") or Input.is_action_just_pressed("Wall"):
			$exit/CollisionShape2D.disabled = true
			yield(get_tree().create_timer(.4), "timeout")
			$exit/CollisionShape2D.disabled = false
			
	if chestup == true and SaveManager.frogdefeat == true:
		if Input.is_action_just_pressed("ui_accept"):
			$Player.position = Vector2(475,500)
			
	if chestdown == true and SaveManager.frogdefeat == true:
		if Input.is_action_just_pressed("ui_accept"):
			$Player.position = Vector2(755,715)
		
	if Input.is_action_just_pressed("Attack") and spawned == false and SaveManager.frogdefeat == false:
			var point_instance = preload("res://Volcano/Point.tscn").instance()
			point_instance.position = $Player.global_position
			point_instance.position.y = 687
			spawned = true
			add_child(point_instance)
			if SaveManager.frogdefeat == false:
				yield(get_tree().create_timer(9), "timeout")
				remove_child(point_instance)
				spawned = false
			
	if froghealth <= 0:
		froghealth = 0
		if SaveManager.frogdefeat == true:
					pass
		$Frogboss/Hitbox/CollisionShape2D.disabled = true
		$Frogboss.visible = false
		$Frogboss/Hurtbox/CollisionShape2D.disabled = true
		$StaticBody2D/CollisionShape2D.disabled = false
		SaveManager.frogdefeat = true
		
	if started == true and SaveManager.frogdefeat == false:
		yield(get_tree().create_timer(1), "timeout")

		if is_jumping_up and jumpcount == 0:
			$Frogboss.frame = 1
			$Frogboss.position.y -= 90 * delta
			$Frogboss.position.x += direction * delta
			
			if $Frogboss.position.x <= 150:
				direction = 85
				$Frogboss.flip_h = true
				
			if $Frogboss.position.x >= 900:
				direction = -85
				$Frogboss.flip_h = false
				
			if SaveManager.frogdefeat == false:	
				yield(get_tree().create_timer(4), "timeout")
			
			if is_instance_valid(self):
				jumpcount += 1
		else:
			$Frogboss.position.y += 170 * delta
			if $Frogboss.position.y >= 620:
				$Frogboss.position.y = 621
				$Frogboss.frame = 0
				if SaveManager.frogdefeat == false:
					yield(get_tree().create_timer(6), "timeout")
					jumpcount = 0

		if $Frogboss.position.y < 300:
			is_jumping_up = false
			
			
		elif $Frogboss.position.y > 620 and jumpcount == 0:
			$Frogboss.frame = 0
			is_jumping_up = true
		
		


func _on_Hurtbox_area_entered(_area):
	froghealth -= 15
	print(froghealth)


func _on_exit_body_entered(_body):
	exit = true
func _on_exit_body_exited(_body):
	exit = false


func _on_chestup_body_entered(_body):
	chestup = true
func _on_chestup_body_exited(_body):
	chestup = false


func _on_chestdown_body_entered(_body):
	chestdown = true

func _on_chestdown_body_exited(_body):
	chestdown = false
