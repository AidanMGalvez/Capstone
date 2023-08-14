extends KinematicBody2D

const JUMP_POWER= -130
const JUMP_RELEASE= -80
const MAX_SPEED = 60
const FRICTION = 40
const ACCELERATION = 20
const GRAVITY = 4
const FALL_FAST = 28


var hp = SaveManager.hp
var fast_fall = false
var velocity = Vector2.ZERO
var movement_enabled = true
var isButtonHeldright = false
var isButtonHeldleft = false
var facingright = true
var facingleft = false
var dagger = load("res://PlayerDagger.tscn")
var can_throw_dagger = true

func _physics_process(_delta):
	if movement_enabled:
		process_player_movement()
	load_hp()

func process_player_movement():
	velocity.y += GRAVITY
	var input = Vector2.ZERO
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if Input.is_action_pressed("ui_right"):
		isButtonHeldright = true
		facingright = true
		facingleft = false
		$AnimationPlayer.play("RunRight")
	else:
		if isButtonHeldright:
			$AnimationPlayer.play("IdleRight")
		isButtonHeldright = false
	
	if Input.is_action_pressed("ui_left"):
		isButtonHeldleft = true
		facingleft = true
		facingright = false
		$AnimationPlayer.play("RunLeft")
	else:
		if isButtonHeldleft:
			$AnimationPlayer.play("IdleLeft")
		isButtonHeldleft = false

	if Input.is_action_just_pressed("Attack"):
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
	
	if Input.is_action_just_pressed("Projectile") and can_throw_dagger:
		if facingright == true and facingleft == false:
			SaveManager.playerdirection = 1
		if facingright == false and facingleft == true:
			SaveManager.playerdirection = 0

		var new_dagger = dagger.instance()
		new_dagger.global_position = global_position  
		new_dagger.initial_position = global_position  
		new_dagger.initial_direction = SaveManager.playerdirection  
		get_parent().add_child(new_dagger) 
		can_throw_dagger = false
		yield(get_tree().create_timer(1), "timeout")
		can_throw_dagger = true
		
	if Input.is_action_just_pressed("Wall"):
		$AnimationPlayer.play("Shield")
	
	if input.x == 0:
		apply_friction()
	else:
		apply_acceleration(input.x)
		
	if is_on_floor():
		fast_fall = false
		if Input.is_action_just_pressed("ui_up"):
			velocity.y = JUMP_POWER
	else:
		if Input.is_action_just_released("ui_up") and velocity.y < JUMP_RELEASE:
			velocity.y = JUMP_RELEASE
			
		if velocity.y > 10 and not fast_fall:
			velocity.y += FALL_FAST
			fast_fall = true
			
	velocity = move_and_slide(velocity, Vector2.UP)

func apply_friction():
	velocity.x = move_toward(velocity.x, 0, FRICTION)
	
func apply_acceleration(amount):
	velocity.x = move_toward(velocity.x, MAX_SPEED * amount, ACCELERATION)
	pass

func _input(event):
	if event.is_action_pressed("Inventory"):
		movement_enabled = !movement_enabled

func _on_Hurtbox_area_entered(hitbox):
	var base_damage = hitbox.damage
	self.hp -= base_damage
	$Health/CanvasLayer/Healthfull.value = self.hp
	SaveManager.hp = self.hp
	print(self.hp)
	if self.hp < 0:
		die()

func die():
	$Sprite.visible = false
	
func load_hp():
	$Health/CanvasLayer/Healthfull.value = self.hp
