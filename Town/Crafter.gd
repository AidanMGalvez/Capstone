extends Area2D

var entered = false

func _on_Crafter_body_entered(_body):
	entered = true
	
func _on_Crafter_body_exited(_body):
	entered = false

func _physics_process(_delta):
	if entered == true:
		$".".visible = true
		$Labels/BootsLabel.text = "\nX 10"   + "\n\nX 5" 
		$Labels/ShieldLabel.text = "\nX 8"  + "       X 10"  + "\n\nX 5"
		$Labels/SwordLabel.text = "\nX 15"  + "     X 8"  + "\n\nX 12"
		$Labels/DaggerLabel.text = "\nX 10"  + "     X 12"  + "\n\nX 8"
		$Labels/CloakLabel.text = "\nX 12"  + "       X 8"  + "\n\nX 15" + "       X 10"
	if entered == false:
		$".".visible = false

func _on_CloudButton_pressed():
	if SaveManager.cloud >= 10 and SaveManager.spiderlegcount >= 5 and SaveManager.buyBoots == false:
		SaveManager.cloud -= 10
		SaveManager.cloud -= 5
		SaveManager.buyBoots = true

func _on_CloakButton_pressed():
	if SaveManager.spiderlegcount >= 12 and SaveManager.volcanicrock >= 8 and SaveManager.amethyst >= 15 and SaveManager.cloud >= 10 and SaveManager.buyCloak == false:
		SaveManager.spiderlegcount -= 12
		SaveManager.volcanicrock -= 8
		SaveManager.amethyst -= 15
		SaveManager.cloud -= 10
		SaveManager.buyCloak = true

func _on_DaggerButton_pressed():
	if SaveManager.volcanicrock >= 10 and SaveManager.wood >= 12 and SaveManager.amethyst >=8 and SaveManager.buyDagger == false:
		SaveManager.volcanicrock -= 10
		SaveManager.wood -= 12
		SaveManager.amethyst -= 8
		SaveManager.buyDagger = true

func _on_ShieldButton_pressed():
	if SaveManager.amethyst >= 8 and SaveManager.cloud >= 5 and SaveManager.volcanicrock >= 10 and SaveManager.buyShield == false:
		SaveManager.amethyst -= 8
		SaveManager.cloud -= 5
		SaveManager.volcanicrock -= 10
		SaveManager.buyShield = true

func _on_SwordButton_pressed():
	if SaveManager.spiderlegcount >= 15 and SaveManager.amethyst >= 8 and SaveManager.wood >= 12 and SaveManager.buySword == false:
		SaveManager.spiderlegcount -= 15
		SaveManager.amethyst -= 8
		SaveManager.wood -= 12
		SaveManager.buySword = true
