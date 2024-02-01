extends Node2D

var spiderKeyAnimationPlayed = false
var cloudKeyAnimationPlayed = false
var earthkeyAnimationPlayed = false
var keys = []
var open = false

func _ready():
	keys.append($CanvasLayer/Keys/MissingSpider)
	keys.append($CanvasLayer/Keys/MissingEarth)
	keys.append($CanvasLayer/Keys/MissingCloud)
	
func _process(_delta):
	if SaveManager.finalboss == true:
		$CanvasLayer/Keys/SpiderKey.visible = false
		$CanvasLayer/Keys/Cloudkey.visible = false
		$CanvasLayer/Keys/Earthkey.visible = false
		$CanvasLayer/Keys/MissingCloud.visible = false
		$CanvasLayer/Keys/MissingEarth.visible = false
		$CanvasLayer/Keys/MissingSpider.visible = false
	if SaveManager.cloak == true:
		$CanvasLayer/Healthfull.max_value = 120
	if SaveManager.cloak == false:
		$CanvasLayer/Healthfull.max_value = 100
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
	
	if SaveManager.cloudkey > 0 and !cloudKeyAnimationPlayed:
		$CanvasLayer/Keys/MissingCloud.visible = false
		$CanvasLayer/Keys/Cloudkey.visible = true
		if SaveManager.cloud_animation < 1:
			$CanvasLayer/Keys/CloudKeyAnimation.visible = true
			$CanvasLayer/Keys/CloudKeyAnimations.play("CloudKey")
			cloudKeyAnimationPlayed = true
			SaveManager.cloudanimation()
			if SaveManager.cloud_animation > 1:
				$CanvasLayer/Keys/CloudKeyAnimation.queue_free()
	
	if SaveManager.earthkey >  0 and !earthkeyAnimationPlayed:
		$CanvasLayer/Keys/MissingEarth.visible = false
		$CanvasLayer/Keys/Earthkey.visible = true
		if SaveManager.earth_animation < 1:
			$CanvasLayer/Keys/EarthKeyAnimation.visible = true
			$CanvasLayer/Keys/EarthAnimation.play("EarthKey")
			earthkeyAnimationPlayed = true
			SaveManager.earthanimation()
			if SaveManager.earth_animation > 1:
				$CanvasLayer/Keys/EarthKeyAnimation.queue_free()
				
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
			$CanvasLayer/Keys/SpiderKey.visible = !$CanvasLayer/Keys/SpiderKey.visible
			$CanvasLayer/Keys/Cloudkey.visible = !$CanvasLayer/Keys/Cloudkey.visible
			$CanvasLayer/Keys/Earthkey.visible =!$CanvasLayer/Keys/Earthkey.visible
