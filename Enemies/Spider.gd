extends KinematicBody2D

export(int) var hp_max: int = 40
export(int) var hp: int = hp_max
export(int) var defense: int = 0
export(int) var SPEED: int = 75
var velocity: Vector2 = Vector2.ZERO
var GRAVITY = 1
var is_inside_area = false
var direction = Vector2(1, 0)

func _physics_process(_delta):
	move()
	apply_gravity()
	SaveManager.spiderhealth = self.hp

func move():
	if is_inside_area:
		velocity = direction.normalized() * SPEED
		$AnimationPlayer.play("SpiderWalking")
	
func die():
	SaveManager.spider_died()
	queue_free()

func _on_Hurtbox_area_entered(hitbox):
	var base_damage = hitbox.damage
	self.hp -= base_damage
	print(self.hp)
	if self.hp < 0:
		die()
	
func apply_gravity():
	velocity.y += GRAVITY
	velocity.x = 0
	velocity = move_and_slide(velocity)
		

func _on_PlayerDetection_body_entered(_body):
	if true:
		is_inside_area = true
		print("Area entered")

func _on_PlayerDetection_body_exited(_body):
	is_inside_area = false
	print("area exited")
