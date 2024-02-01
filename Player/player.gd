extends KinematicBody2D

const JUMP_RELEASE= -80
const FRICTION = 40
const ACCELERATION = 20
const GRAVITY = 4
const FALL_FAST = 28

var JUMP_POWER= -130
var MAX_SPEED = 100
var hp = SaveManager.hp
var fast_fall = false
var velocity = Vector2.ZERO
var movement_enabled = true
var isButtonHeldright = false
var isButtonHeldleft = false
var facingright = true
var facingleft = false
var dagger = load("res://Player/PlayerDagger.tscn")
var can_throw_dagger = true
var shieldup = false
var tween : Tween
var change_scene

var jumps = 0
const MAX_JUMPS = 3

func _ready():
	SaveManager.playerposition = global_position

func _physics_process(_delta):
	
	load_hp()
	
	if SaveManager.movement == 1:
		movement_enabled = false
		$AnimationPlayer.stop()
	if SaveManager.movement == 0:
			movement_enabled = true
			SaveManager.movement += 3
			
	if movement_enabled:
		process_player_movement()
		
	if !movement_enabled:
		apply_gravity()
		
	if SaveManager.LeaveShop == true:
		position = Vector2(880, 190)
		SaveManager.LeaveShop = false
	if SaveManager.LeaveMagic == true:
		position = Vector2(1080, 190)
		SaveManager.LeaveMagic = false
	if SaveManager.LeaveSky == true:
		position = Vector2(725,-20)
		SaveManager.LeaveSky = false
	if SaveManager.failedjump == true:
		position = Vector2(160,152)
		SaveManager.failedjump = false
	if SaveManager.LeaveParkour == true:
		position = Vector2(-90,30)
		SaveManager.LeaveParkour = false
		
	if SaveManager.useslingshot == true:
		position = Vector2(1850,170)
		scale = Vector2(0.8,0.8)
		tween = Tween.new()
		add_child(tween)
# warning-ignore:return_value_discarded
		tween.interpolate_property(self, "position", position, Vector2(1770, 35), 0.8, Tween.TRANS_LINEAR)
# warning-ignore:return_value_discarded
		tween.interpolate_property(self, "scale", scale, Vector2(0.3, 0.3), 1, Tween.TRANS_LINEAR)
# warning-ignore:return_value_discarded
		tween.interpolate_property(self, "rotation", rotation, rotation + 5, 1, Tween.TRANS_LINEAR)
# warning-ignore:return_value_discarded
		tween.start()
		SaveManager.useslingshot = false
	
	if SaveManager.falling == true:
		rotation_degrees += 362.5
		yield(get_tree().create_timer(5), "timeout")
		rotation_degrees -= 1
		if rotation_degrees <= 0:
			rotation_degrees = 0
	
	if SaveManager.leavefrog == true:
		position = Vector2(460,1125)
		SaveManager.leavefrog = false
		
	if SaveManager.leaveunderground == true:
		position = Vector2(90,180)
		SaveManager.leaveunderground = false
		
	if SaveManager.leavewell == true:
		position = Vector2(1160,180)
		SaveManager.leavewell = false
	
	if SaveManager.leavespiderboss == true:
		position = Vector2(550,99)
		SaveManager.leavespiderboss = false
	
	if SaveManager.leavecraft == true:
		position = Vector2(1000,180)
		SaveManager.leavecraft = false
	
		
	if SaveManager.cloak == true:
			MAX_SPEED = 150
			JUMP_POWER = -180
	if SaveManager.cloak == false:
			MAX_SPEED = 100
			JUMP_POWER = -130
	
	if SaveManager.sword == true:
		$Hitbox.damage = 20
	if SaveManager.sword == false:
		$Hitbox.damage = 14
		
	
	
func process_player_movement():
	velocity.y += GRAVITY
	var input = Vector2.ZERO
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if Input.is_action_pressed("ui_right"):
		isButtonHeldright = true
		facingright = true
		facingleft = false
		$AnimationPlayer.play("RunRight")
		disableshield()
	else:
		if isButtonHeldright and !shieldup:
			$AnimationPlayer.play("IdleRight")
		isButtonHeldright = false
	
	if Input.is_action_pressed("ui_left"):
		isButtonHeldleft = true
		facingleft = true
		facingright = false
		$AnimationPlayer.play("RunLeft")
		disableshield()
	else:
		if isButtonHeldleft and !shieldup:
			$AnimationPlayer.play("IdleLeft")
		isButtonHeldleft = false

	if Input.is_action_just_pressed("Attack") and $Area2D/ShieldBlock.disabled == true:
		if facingright == true and facingleft == false:
			movement_enabled = false
			$AnimationPlayer.play("SwingSwordRight")
			yield(get_tree().create_timer(.4), "timeout")
			$AnimationPlayer.play("IdleRight")
			movement_enabled = true
		else:
			movement_enabled = false
			$AnimationPlayer.play("SwingSwordLeft")
			yield(get_tree().create_timer(.4), "timeout")
			$AnimationPlayer.play("IdleLeft")
			movement_enabled = true
	
	if Input.is_action_just_pressed("Wall"):
		shieldup = true
		if SaveManager.shield == true and Input.is_action_just_pressed("Wall"):
			if facingleft:
				velocity.x = -2000
				velocity = move_and_slide(velocity, Vector2.LEFT)
			if facingright:
				velocity.x = 2000
				velocity = move_and_slide(velocity, Vector2.RIGHT)
		movement_enabled = false
		if facingright == true and facingleft == false:
			$AnimationPlayer.play("ShieldRight")
		else:
			$AnimationPlayer.play("ShieldLeft")
		yield(get_tree().create_timer(.5), "timeout")
		movement_enabled = true
		
		
	if Input.is_action_just_pressed("Projectile") and can_throw_dagger and SaveManager.daggercount != 0:
		if $Area2D/ShieldBlock.disabled == false:  
			return
		if facingright == true and facingleft == false:
			SaveManager.playerdirection = 1
		if facingright == false and facingleft == true:
			SaveManager.playerdirection = 0
		SaveManager.daggercount -= 1
		if SaveManager.daggercount == -1:
			return

		var new_dagger = dagger.instance()
		new_dagger.global_position = global_position  
		new_dagger.initial_position = global_position  
		new_dagger.initial_direction = SaveManager.playerdirection  
		get_parent().add_child(new_dagger) 
		can_throw_dagger = false
		yield(get_tree().create_timer(1), "timeout")
		can_throw_dagger = true
		
	if input.x == 0:
		apply_friction()
	else:
		apply_acceleration(input.x)
		
	if is_on_floor():
		fast_fall = false
		jumps = 0
		
		if Input.is_action_just_pressed("ui_up") and $Area2D/ShieldBlock.disabled == true and SaveManager.blockjump != true:
			velocity.y = JUMP_POWER
			jumps += 1
	else:
		if Input.is_action_just_released("ui_up") and velocity.y < JUMP_RELEASE:
			velocity.y = JUMP_RELEASE
			
		if velocity.y > 10 and not fast_fall:
			velocity.y += FALL_FAST
			fast_fall = true
			
	jumps = clamp(jumps, 0, MAX_JUMPS)	
		
	if SaveManager.boots == true and Input.is_action_just_pressed("ui_up") and $Area2D/ShieldBlock.disabled == true and SaveManager.blockjump != true:
		if jumps < MAX_JUMPS:
			velocity.y = JUMP_POWER
			jumps += 1
		
			
	velocity = move_and_slide(velocity, Vector2.UP)

func apply_friction():
	velocity.x = move_toward(velocity.x, 0, FRICTION)
	
func apply_acceleration(amount):
	velocity.x = move_toward(velocity.x, MAX_SPEED * amount, ACCELERATION)
	pass

func apply_gravity():
	velocity.y += GRAVITY
	velocity.x = 0
	velocity = move_and_slide(velocity)

func _on_Hurtbox_area_entered(hitbox):
	var base_damage = hitbox.damage
	self.hp -= base_damage
	$Health/CanvasLayer/Healthfull.value = self.hp
	SaveManager.hp = self.hp
	print(self.hp)
	if self.hp <= 0:
		SaveManager.hp = 100
		die()

func die():
	change_scene = get_tree().change_scene("res://MainWorld/Main.tscn")
	SaveManager.hp = 100
	self.hp = 100
	
func load_hp():
	if SaveManager.usesmall == true:
		SaveManager.hp += 10
		SaveManager.usesmall = false
	if SaveManager.uselarge == true:
		SaveManager.hp += 40
		SaveManager.uselarge = false
	
	if hp > 100 and !SaveManager.cloak:
		hp = 100
	if SaveManager.cloak == true:
		if hp > 120:
			hp = 120
	if SaveManager.hp == 100:
		$Health/CanvasLayer/Healthfull.value = 100
	$Health/CanvasLayer/Healthfull.value = self.hp

func disableshield():
	if $Area2D/ShieldBlock.disabled == false:
		movement_enabled = false
		if facingright == true and facingleft == false:
			$AnimationPlayer.play_backwards("ShieldRight")
		else:
			$AnimationPlayer.play_backwards("ShieldLeft")
		yield(get_tree().create_timer(.4), "timeout")
		shieldup = false
		movement_enabled = true
	$Area2D/ShieldBlock.disabled = true

