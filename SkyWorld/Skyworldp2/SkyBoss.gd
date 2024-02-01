extends Node2D

var entered = false
var fightstarted = false
var bossalive = true
var throw = preload("res://SkyWorld/Skyworldp2/Guitar.tscn")
var guitar_instance
var summon_timer = 0
var summon_interval = 5
var bosshealth = SaveManager.skyboss
var alreadybeat = SaveManager.skydefeat

func _on_PlayerEnterBoss_body_entered(_body):
	entered = true
	fightstarted = true
	
	
func _on_PlayerEnterBoss_body_exited(_body):
	entered = false

func _physics_process(delta):
	if bosshealth <= 0:
		bossalive = false
		SaveManager.skyboss = 0
		$Tornado/MoveAnimation.stop()
		$Tornado/StaticBody2D/CollisionPolygon2D.disabled = true
		$Tornado/StaticBody2D/CollisionShape2D.disabled = true
		$Tornado/SpinAnimation.stop()
		$Tornado/Hitbox/CollisionShape2D.disabled = true
		$PlayerEnterBoss/CollisionShape2D.disabled = true
		$"../Barrels/Area2D/CollisionShape2D".disabled = true
		if alreadybeat == false:
			alreadybeat = true
			yield(get_tree().create_timer(2), "timeout")
			$Tornado.frame = 1
			yield(get_tree().create_timer(.5), "timeout")
			$Tornado.frame = 2
			yield(get_tree().create_timer(.5), "timeout")
			$Tornado.frame = 3
			yield(get_tree().create_timer(.2), "timeout")
			$Tornado.visible = false
			yield(get_tree().create_timer(4), "timeout")
			$"../Player".get_node("Camera2D").zoom = Vector2(1,1)
			
		
	if entered == true:
		$PlayerEnterBoss/CollisionShape2D.disabled = true
		$"../Player".get_node("Camera2D").zoom = Vector2(3,3)
		
	if bossalive == true and fightstarted:
		summon_timer += delta
		if summon_timer >= summon_interval:
			summon_guitar()
			summon_timer = 0
		yield(get_tree().create_timer(7), "timeout")
		$Tornado/MoveAnimation.play("Move")

func summon_guitar():
	call_deferred("_summon_guitar")

func _summon_guitar():
	guitar_instance = throw.instance()
	guitar_instance.position = Vector2(2000, -1100)
	add_child(guitar_instance)
	

func _on_Hurtbox_area_entered(_area):
	bosshealth -= 10
