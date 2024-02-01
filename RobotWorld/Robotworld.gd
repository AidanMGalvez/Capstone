extends Node2D

var entered = false
var throw = preload("res://RobotWorld/Drill.tscn")
var drill_instance
var hp = 300

func _on_DeliverKeys_body_entered(_body):
	entered = true
func _on_DeliverKeys_body_exited(_body):
	entered = false

func _ready():
	if SaveManager.rejoinfinal == true:
			$OldBackground.visible = false
			$NewBackground.visible = true
			$Oldrobot.queue_free()

func _physics_process(_delta):
	if SaveManager.robotdefeat == true:
		$Rebuiltrobot.rotation_degrees = 90
		$Rebuiltrobot.global_position = Vector2(900,220)
	if entered == true:
		if Input.is_action_just_pressed("ui_accept") and SaveManager.spiderkey == 1 and SaveManager.cloudkey == 1 and SaveManager.earthkey == 1 and SaveManager.finalboss == false and SaveManager.rejoinfinal == false:
			$BlackBackground.visible = true
			$OldBackground.visible = false
			$NewBackground.visible = true
			$Rebuiltrobot/StaticBody2D/CollisionPolygon2D.disabled = false
			$Oldrobot.queue_free()
			$Rebuiltrobot.visible = true
			$Player.position = Vector2(800,170)
			SaveManager.spiderkey -= 1
			SaveManager.cloudkey -= 1
			SaveManager.earthkey -= 1
			SaveManager.finalboss = true
			yield(get_tree().create_timer(2), "timeout")
			$BlackBackground.visible = false
			SaveManager.rejoinfinal = true
			yield(get_tree().create_timer(2), "timeout")
			if SaveManager.robotdefeat == false:
				summon_drill()
				yield(get_tree().create_timer(4), "timeout")
				summon_attack()

func summon_drill():
	$Rebuiltrobot/AnimationPlayer.play("Shoot")
	yield(get_tree().create_timer(1), "timeout")
	drill_instance = throw.instance()
	drill_instance.position = Vector2(815, 55)
	add_child(drill_instance)
	yield(get_tree().create_timer(7), "timeout")
	if SaveManager.robotdefeat == true:
		return
	summon_drill()
			
func summon_attack():
	$Rebuiltrobot/AnimationPlayer.play("swing")
	yield(get_tree().create_timer(4), "timeout")
	$Rebuiltrobot/Wave.visible = true
	$Rebuiltrobot/Hitbox/CollisionShape2D.disabled = false
	yield(get_tree().create_timer(.2), "timeout")
	$Rebuiltrobot/Wave.visible = false
	$Rebuiltrobot/Hitbox/CollisionShape2D.disabled = true
	yield(get_tree().create_timer(2.9), "timeout")
	if SaveManager.robotdefeat == true:
		return
	summon_attack()
	
func _on_Drillcatch_body_entered(_body):
	drill_instance.queue_free()

func _on_Hurtbox_area_entered(_area):
	print(hp)
	hp -= $Player/Hitbox.damage
	if hp <= 0:
		hp = 0
		SaveManager.robotdefeat = true
