extends Node2D

var spiderKeyAnimationPlayed = false
var keys = []
var open = false

func _ready():
	keys.append($CanvasLayer/Keys/MissingSpider)
	keys.append($CanvasLayer/Keys/MissingEarth)
	keys.append($CanvasLayer/Keys/MissingCloud)
	
func _process(_delta):
	if SaveManager.spiderkey > 0 and !spiderKeyAnimationPlayed:
		$CanvasLayer/Keys/MissingSpider.visible = false
		$CanvasLayer/Keys/SpiderKey.visible = true
		if SaveManager.spider_animation <1:
			$CanvasLayer/Keys/SpiderKeyAnimation.visible = true
			$CanvasLayer/Keys/KeyAnimation.play("Key")
		spiderKeyAnimationPlayed = true
		SaveManager.animationplayed()
		if SaveManager.spider_animation > 1:
			$CanvasLayer/Keys/SpiderKeyAnimation.queue_free()
			
	if Input.is_action_just_pressed("Inventory"):   
		if open:
			SaveManager.movement = 0
			open = false
		else:
			SaveManager.movement = 1
			open = true
			
		$CanvasLayer/Inventory.visible = !$CanvasLayer/Inventory.visible
		$CanvasLayer/Healthfull.visible = !$CanvasLayer/Inventory.visible
		$CanvasLayer/Emptyhealth.visible = !$CanvasLayer/Inventory.visible
		$CanvasLayer/CoinLabel.visible = !$CanvasLayer/CoinLabel.visible
		$CanvasLayer/Coin.visible = !$CanvasLayer/Coin.visible
		$CanvasLayer/DaggerLabel.visible = !$CanvasLayer/DaggerLabel.visible
		$CanvasLayer/Dagger.visible = !$CanvasLayer/Dagger.visible
		
		for key in keys:
			 key.visible = !$CanvasLayer/Inventory.visible
			
		if SaveManager.spiderkey == 1:
			$CanvasLayer/SpiderKey.visible = !$CanvasLayer/SpiderKey.visible

