extends Sprite

var entered = false
var canAcceptInput = true
var cooldownTime = 2.0  
var cooldownTimer = 0.0

func _on_Area2D_body_entered(_body):
	entered = true


func _on_Area2D_body_exited(_body):
	entered = false

func _process(_delta):
	if entered == true:
		if canAcceptInput and Input.is_action_just_pressed("ui_accept"):
			$AnimationPlayer.play("shootslingshot")
			SaveManager.useslingshot = true
			canAcceptInput = false
			cooldownTimer = cooldownTime
			
	if not canAcceptInput:
		cooldownTimer -= get_process_delta_time()
		if cooldownTimer <= 0:
			canAcceptInput = true
			
			
func _physics_process(_delta):
	if Input.is_action_just_pressed("Attack") or Input.is_action_just_pressed("Wall"):
		$Area2D/CollisionShape2D.disabled = true
		yield(get_tree().create_timer(.4), "timeout")
		$Area2D/CollisionShape2D.disabled = false
