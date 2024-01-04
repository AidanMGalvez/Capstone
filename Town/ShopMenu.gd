extends Node2D

func _process(_delta):
	$Dagger/DaggerLabel.text = "X " + str(SaveManager.daggercount)
	$Wood/WoodLabel.text = "X " + str(SaveManager.wood)
	$Cloud/CloudLabel.text = "X " + str(SaveManager.cloud)
	$Spider/SpiderLabel.text = "X " + str(SaveManager.spiderlegcount)
	$VolcanicRock/VolcanicLabel.text = "X " + str(SaveManager.volcanicrock)
	$Amethyst/AmethystLabel.text = "X " + str(SaveManager.amethyst)
# buy and sell daggers
func _on_BuyDagger_pressed():
	if SaveManager.coins >= 3:
		SaveManager.daggercount += 1
		SaveManager.coins -= 3
		
func _on_SellDagger_pressed():
	if SaveManager.daggercount >= 1:
		SaveManager.daggercount -= 1
		SaveManager.coins += 3

# buy and sell wood
func _on_BuyWood_pressed():
	if SaveManager.coins >= 5:
		SaveManager.coins -= 5
		SaveManager.wood += 3

func _on_SellWood_pressed():
	if SaveManager.wood >= 3:
		SaveManager.wood -= 3
		SaveManager.coins += 5

#buy and sell clouds
func _on_BuyCloud_pressed():
	if SaveManager.coins >= 5:
		SaveManager.coins -= 5
		SaveManager.cloud += 1

func _on_SellCloud_pressed():
	if SaveManager.cloud >= 1:
		SaveManager.cloud -= 1
		SaveManager.coins += 5

# buy and sell spider legs
func _on_BuySpider_pressed():
	if SaveManager.coins >= 4:
		SaveManager.coins -= 4
		SaveManager.spiderlegcount += 1
	
func _on_SellSpider_pressed():
	if SaveManager.spiderlegcount >= 1:
		SaveManager.spiderlegcount -= 1
		SaveManager.coins += 4

# buy and sell volcanic rock
func _on_BuyVolcanicRock_pressed():
	if SaveManager.coins >= 5:
		SaveManager.coins -= 5
		SaveManager.volcanicrock += 1

func _on_SellVolcanicRock_pressed():
	if SaveManager.volcanicrock >= 1:
		SaveManager.volcanicrock -= 1
		SaveManager.coins += 5

# buy and sell amethyst
func _on_BuyAmethyst_pressed():
	if SaveManager.coins >= 5:
		SaveManager.coins -= 5
		SaveManager.amethyst += 1

func _on_SellAmythist_pressed():
	if SaveManager.amethyst >= 1:
		SaveManager.amethyst -= 1
		SaveManager.coins += 5
