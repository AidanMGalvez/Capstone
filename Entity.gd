extends KinematicBody2D

export(int) var hp_max: int = 100
export(int) var hp: int = hp_max
export(int) var defense: int = 0

export(int) var SPEED: int = 75
var velocity: Vector2 = Vector2.ZERO

onready var sprite = $Sprite
onready var collShape = $CollisionShape2D
onready var animPlayer = $SpiderWalkingAnimation

func _physics_process(_delta):
	move()

func move():
	velocity = move_and_slide(velocity)

func die():
	queue_free()

func _on_Hurtbox_area_entered(hitbox):
	var base_damage = hitbox.damage
	self.hp -= base_damage
	print(self.hp)
	if self.hp < 0:
		die()
	
