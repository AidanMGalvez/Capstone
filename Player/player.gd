extends KinematicBody2D

const JUMP_POWER= -130
const JUMP_RELEASE= -80
const MAX_SPEED = 60
const FRICTION = 40
const ACCELERATION = 20
const GRAVITY = 4
const FALL_FAST = 28

var hp = 100
var fast_fall = false
var velocity = Vector2.ZERO
var movement_enabled = true

func _physics_process(_delta):
	if movement_enabled:
		process_player_movement()
		
func process_player_movement():
	velocity.y += GRAVITY
	var input = Vector2.ZERO
	input.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
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
	print(self.hp)
	if self.hp < 0:
		die()

func die():
	$Sprite.visible = false
