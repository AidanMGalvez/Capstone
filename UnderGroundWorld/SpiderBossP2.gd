extends Node2D

var rand = RandomNumberGenerator.new()
var EnemyScene = load("res://UnderGroundWorld/BigRock.tscn")
var LocationCount = {1:0,2:0,3:0}
var anim
var location: int

func _on_BattleArea_body_entered(_body):
	$SpiderWall/LeftWall.set_deferred("disabled", false)
	$SpiderWall/AnimationPlayer.play("WallsDown")
	$BattleArea/CollisionShape2D.queue_free()
	anim = get_node("Spiderboss/AnimationPlayer")
	anim.play("SpiderWalking")
	yield(get_tree().create_timer(3.6), "timeout")
	$Player/Camera2D.shake()
	round_one()
	yield(get_tree().create_timer(17), "timeout")
	$Player/Camera2D.shake()
	round_two()
	yield(get_tree().create_timer(22), "timeout")
	$Player/Camera2D.shake()
	round_three()
	yield(get_tree().create_timer(28), "timeout")
	$Player/Camera2D.shake()
	battle_over()
	

func round_one():
	anim.play("SpiderJumping")
	for e in range (0,12):
		LocationCount[1] = e
		LocationCount[2] = e
		LocationCount[3] = e
		for _i in range (1):
			rand.randomize()
			location = rand.randi_range(1,3)
			summon_rocks()
	yield(get_tree().create_timer(3.84), "timeout")
	anim.stop()
	$Player/Camera2D.shake_duration = 6.5
			
func round_two():
	anim.play("SpiderJumping")
	for e in range (0,20):
		LocationCount[1] = e
		LocationCount[2] = e
		LocationCount[3] = e
		for _i in range (1):
			rand.randomize()
			location = rand.randi_range(1,3)
			summon_rocks()
	yield(get_tree().create_timer(6.5), "timeout")
	anim.stop()
	$Player/Camera2D.shake_duration = 10.5
	
func round_three():
	anim.play("SpiderJumping")
	for e in range (0,35):
		LocationCount[1] = e
		LocationCount[2] = e
		LocationCount[3] = e
		for _i in range (1):
			rand.randomize()
			location = rand.randi_range(1,3)
			summon_rocks()
	yield(get_tree().create_timer(10.5), "timeout")
	anim.stop()
	$Player/Camera2D.shake_duration = 11
	
func summon_rocks():
	if location == 1: 
		var rock = EnemyScene.instance()
		rock.position.y = -20 + (LocationCount[1] * -120)
		rock.position.x = 30
		add_child(rock)
		
	elif location == 2: 
		var rock = EnemyScene.instance()
		rock.position.y = -20 + (LocationCount[2] * -120) 
		rock.position.x = 90
		add_child(rock)
		
	elif location == 3:
		var rock = EnemyScene.instance()
		rock.position.y = -20 + (LocationCount[3] * -120) 
		rock.position.x = 150
		add_child(rock)

func battle_over():
	anim.play("SpiderJumping")
	yield(get_tree().create_timer(10.5), "timeout")
	anim.stop()
	var huge_rock_anim = get_node("HugeRock/AnimationPlayer")
	huge_rock_anim.play("FallingRock")
	yield(get_tree().create_timer(.5), "timeout")
	$HugeRock.visible = false
	$Spiderboss.visible = false
	$CrushedSpiderboss.visible = true
	$SpiderWall/AnimationPlayer.play("WallsUp")
	$SpiderWall/RightWall.disabled = true
	$SpiderWall/LeftWall.disabled = true


