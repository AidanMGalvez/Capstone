extends Node2D

var enteredarea1 = false
var returnedarea1 = false
var enteredarea2 = false
var returnedarea2 = false
var enteredarea3 = false
var returnedarea3 = false
var enteredarea4 = false
var door = false
var change_scene

# enter area 1
func _on_Firstarea_body_entered(_body):
	enteredarea1 = true
func _on_Firstarea_body_exited(_body):
	enteredarea1 = false
	
# enter area 2
func _on_Secondarea_body_entered(_body):
	enteredarea2 = true
func _on_Secondarea_body_exited(_body):
	enteredarea2 = false
	
# return to area 1
func _on_ReturnTofirst_body_entered(_body):
	returnedarea1 = true
func _on_ReturnTofirst_body_exited(_body):
	returnedarea1 = false

# enter area 3
func _on_Thirdarea_body_entered(_body):
	enteredarea3 = true
func _on_Thirdarea_body_exited(_body):
	enteredarea3 = false
	
 # return to area 2
func _on_ReturnToSecond_body_entered(_body):
	returnedarea2 = true
func _on_ReturnToSecond_body_exited(_body):
	returnedarea2 = false

# return to area 3
func _on_ReturnToThird_body_entered(_body):
	returnedarea3 = true
func _on_ReturnToThird_body_exited(_body):
	returnedarea3 = false

# go to boss
func _on_GoToBoss_body_entered(_body):
	enteredarea4 = true
func _on_GoToBoss_body_exited(_body):
	enteredarea4 = false
	
# leave area
func _on_Door_body_entered(_body):
	door = true
func _on_Door_body_exited(_body):
	door = false

	
func _process(_delta):
	if enteredarea1 == true:
		$Player.position = Vector2(25,280)
	if enteredarea2 == true:
		$Player.position = Vector2(25,480)
	if enteredarea3 == true:
		$Player.position = Vector2(25,680)
	if returnedarea1 == true:
		$Player.position = Vector2(470,140)
	if returnedarea2 == true:
		$Player.position = Vector2(470,300)
	if returnedarea3 == true:
		$Player.position = Vector2(470,495)
	if enteredarea4 == true:
		if Input.is_action_just_pressed("ui_accept"):
			change_scene = get_tree().change_scene("res://Volcano/FrogFight.tscn")
	if door == true:
		if Input.is_action_just_pressed("ui_accept"):
			change_scene = get_tree().change_scene("res://Volcano/VolcanoWorld.tscn")
			SaveManager.leavefrog = true
		
		
func _physics_process(_delta):
	if Input.is_action_just_pressed("Attack") or Input.is_action_just_pressed("Wall"):
		$FirstRoom/Firstarea/CollisionShape2D.disabled = true
		yield(get_tree().create_timer(.4), "timeout")
		$FirstRoom/Firstarea/CollisionShape2D.disabled = false




