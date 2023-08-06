extends Node2D

var spiderKeyAnimationPlayed = false
var keys = []

func _ready():
	keys.append($CanvasLayer/MissingSpider)
	keys.append($CanvasLayer/MissingEarth)
	keys.append($CanvasLayer/MissingCloud)
	
func _process(_delta):
	if SaveManager.spiderkey > 0 and !spiderKeyAnimationPlayed:
		$CanvasLayer/MissingSpider.visible = false
		$CanvasLayer/SpiderKey.visible = true
		if SaveManager.spider_animation <1:
			$CanvasLayer/SpiderKeyAnimation.visible = true
			$CanvasLayer/KeyAnimation.play("Key")
		spiderKeyAnimationPlayed = true
		SaveManager.animationplayed()
		if SaveManager.spider_animation > 1:
			$CanvasLayer/SpiderKeyAnimation.queue_free()
			
	if Input.is_action_just_pressed("Inventory"):
		$CanvasLayer/Inventory.visible = !$CanvasLayer/Inventory.visible
		$CanvasLayer/Healthfull.visible = !$CanvasLayer/Inventory.visible
		$CanvasLayer/Emptyhealth.visible = !$CanvasLayer/Inventory.visible
		
		for key in keys:
			 key.visible = !$CanvasLayer/Inventory.visible
		
		if SaveManager.spiderkey == 1:
			$CanvasLayer/SpiderKey.visible = !$CanvasLayer/SpiderKey.visible

