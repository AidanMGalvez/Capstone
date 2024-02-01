extends KinematicBody2D

export var velocity = Vector2(-50, -50)  
var timer
var hp = 30

func _ready():
	timer = Timer.new()
	add_child(timer)
	timer.connect("timeout", self, "_on_timer_timeout")
	timer.wait_time = 5.0 
	timer.start()

func _process(_delta):
	move_and_slide(velocity)
	if hp <= 0:
		hp = 0
		queue_free()

func _on_timer_timeout():
	velocity = -velocity 
	if velocity.x < 0: 
		$Firewisp.frame = 0
	elif velocity.x > 0:  
		$Firewisp.frame = 1
	timer.wait_time = 5.0  
	timer.start()

func _on_Hurtbox_area_entered(area):
	hp -= 12
