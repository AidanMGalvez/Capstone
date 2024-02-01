extends Node2D

func _process(_delta):
	
	# shows item count
	$Items/Dagger/DaggerLabel.text = "X " + str(SaveManager.daggercount)
	$Items/Wood/WoodLabel.text = "X " + str(SaveManager.wood)
	$Items/CloudinJar/CloudLabel.text = "X " + str(SaveManager.cloud)
	$Items/SpiderLegsinjar/SpiderLabel.text = "X " + str(SaveManager.spiderlegcount)
	$Items/VolcanicRock/VolcanicLabel.text = "X " + str(SaveManager.volcanicrock)
	$Items/Amethyst/AmethystLabel.text = "X " + str(SaveManager.amethyst)
	$Items/Smallhealth/SmallLabel.text = "X" + str(SaveManager.smallhealth)
	$Items/Largepotion/LargeLabel.text = "X" + str(SaveManager.largehealth)
	$Items/Coin/CoinLabel.text = "X" + str(SaveManager.coins)
	
	# sets text color
	$Items/Dagger/DaggerLabel.modulate = Color(0,0,0)
	$Items/Wood/WoodLabel.modulate = Color(0,0,0)
	$Items/CloudinJar/CloudLabel.modulate = Color(0,0,0)
	$Items/SpiderLegsinjar/SpiderLabel.modulate = Color(0,0,0)
	$Items/VolcanicRock/VolcanicLabel.modulate = Color(0,0,0)
	$Items/Amethyst/AmethystLabel.modulate = Color(0,0,0)
	$Items/Largepotion/LargeLabel.modulate = Color(0,0,0)
	$Items/Smallhealth/SmallLabel.modulate = Color(0,0,0)
	$Items/Coin/CoinLabel.modulate = Color(0,0,0)
	
	# saves equipment switch
	if SaveManager.cloak == true:
		$Equipment/Cloak/Upgradedcloakpng.visible = true
		$Equipment/Cloak/Cloakoutline.visible = false
		$Equipment/Cloak.pressed = true
	if SaveManager.boots == true:
		$Equipment/Boots/CloudBoots.visible = true
		$Equipment/Boots/BootsOutline.visible = false
		$Equipment/Boots.pressed = true
	if SaveManager.dagger == true:
		$Equipment/Dagger/Upgradeddagger.visible = true
		$Equipment/Dagger/DaggerOutline.visible = false
		$Equipment/Dagger.pressed = true
	if SaveManager.shield == true:
		$Equipment/Shield/UpgradedShield.visible = true
		$Equipment/Shield/ShieldOutline.visible = false
		$Equipment/Shield.pressed = true
	if SaveManager.sword == true:
		$Equipment/Sword/Upgradedsword.visible = true
		$Equipment/Sword/SwordOutline.visible = false
		$Equipment/Sword.pressed = true
		
	if SaveManager.cloak == false:
		$Equipment/Cloak/Upgradedcloakpng.visible = false
		$Equipment/Cloak/Cloakoutline.visible = true
		$Equipment/Cloak.pressed = false
	if SaveManager.boots == false:
		$Equipment/Boots/CloudBoots.visible = false
		$Equipment/Boots/BootsOutline.visible = true
		$Equipment/Boots.pressed = false
	if SaveManager.dagger == false:
		$Equipment/Dagger/Upgradeddagger.visible = false
		$Equipment/Dagger/DaggerOutline.visible = true
		$Equipment/Dagger.pressed = false
	if SaveManager.shield == false:
		$Equipment/Shield/UpgradedShield.visible = false
		$Equipment/Shield/ShieldOutline.visible = true
		$Equipment/Shield.pressed = false
	if SaveManager.sword == false:
		$Equipment/Sword/Upgradedsword.visible = false
		$Equipment/Sword/SwordOutline.visible = true
		$Equipment/Sword.pressed = false
		
	
func _on_Cloak_toggled(state):
	if SaveManager.buyCloak == true:
		SaveManager.cloak = state
func _on_Boots_toggled(state):
	if SaveManager.buyBoots == true:
		SaveManager.boots = state
func _on_Dagger_toggled(state):
	if SaveManager.buyDagger == true:
		SaveManager.dagger = state
func _on_Shield_toggled(state):
	if SaveManager.buyShield == true:
		SaveManager.shield = state
func _on_Sword_toggled(state):
	if SaveManager.buySword == true:
		SaveManager.sword = state

func _on_UseSmall_pressed():
	if SaveManager.smallhealth >= 1:
		SaveManager.smallhealth -= 1
		SaveManager.usesmall = true

func _on_UseLarge_pressed():
	if SaveManager.largehealth >= 1:
		SaveManager.largehealth -= 1
		SaveManager.uselarge = true
