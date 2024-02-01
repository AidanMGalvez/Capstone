extends KinematicBody2D

export var velocity = Vector2(30, 0) 
var timer
var hp = 30

func _ready():
	timer = Timer.new()
	add_child(timer)
	timer.connect("timeout", self, "_on_timer_timeout")
	timer.wait_time = 2.8
	timer.start()
	if velocity.x > 0:
		$Shortkingthing.scale.x *= -1
		$CollisionPolygon2D.scale.x *= -1
	
func _process(_delta):
	move_and_slide(velocity)
	if hp <= 0:
		hp = 0
		queue_free()

func _on_timer_timeout():
	velocity = -velocity 
	timer.start()
	$Shortkingthing.scale.x *= -1
	$CollisionPolygon2D.scale.x *= -1
func _on_Hurtbox_area_entered(area):
	hp -= 12
