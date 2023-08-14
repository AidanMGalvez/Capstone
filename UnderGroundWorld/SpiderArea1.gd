extends Area2D

var entered = false
var delete_explosion
var explosion_timer = 1.01
var web
var web_timer = .4

func _ready():
	var explosion = get_parent().get_parent().get_node("AnimationPlayer/Explosionattempt2")
	explosion.visible = false
	
	delete_explosion = get_parent().get_parent().get_node("AnimationPlayer/Explosionattempt2")
	web = get_parent().get_node("Brokenweb")
	
	if SaveManager.Spider > 0:
		$CollisionShape2D.disabled = true
		var spider_in_cave = get_parent().get_node("Spiderincave")
		spider_in_cave.visible = false
		web.visible = true

		
func _on_Area2D_body_entered(_body):
	var spider_in_cave = get_parent().get_node("Spiderincave")
	spider_in_cave.visible = false
	call_deferred("_disable_collision_shape")
	SaveManager.add_spider()
	entered = true
	var anim = get_parent().get_parent().get_node("AnimationPlayer")
	anim.play("explosion")
	var explosion = get_parent().get_parent().get_node("AnimationPlayer/Explosionattempt2")
	explosion.visible = true
	var audio = get_parent().get_parent().get_node("SpiderDen/AudioStreamPlayer2D")
	if audio.playing == false:
		audio.play()
	

func _on_Area2D_body_exited(_body):
	entered = false

func _disable_collision_shape():
	$CollisionShape2D.disabled = true

func _process(delta):
	if entered == true:
		explosion_timer-=delta
		if explosion_timer<0:
			if is_instance_valid(delete_explosion):
				delete_explosion.queue_free()
				
	if entered == true:
		web_timer-=delta
		if web_timer<0:
			if is_instance_valid(web):
				web.visible = true
			
