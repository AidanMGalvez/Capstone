extends Sprite

var entered = false
var change_scene
var shop = false

func _ready():
	if $Player/Camera2D:
		$Player/Camera2D.zoom = $Player/Camera2D.zoom * .4

func _on_Area2D_body_entered(_body):
	entered = true
func _on_Area2D_body_exited(_body):
	entered = false
	
	
func _on_Shop_body_entered(_body):
	shop = true
func _on_Shop_body_exited(_body):
	shop = false
	
func _process(_delta):
	if entered == true:
		if Input.is_action_just_pressed("ui_accept"):
			change_scene = get_tree().change_scene("res://MainWorld/Main.tscn")
			SaveManager.LeaveMagic = true
		
	if shop == true:
		$Shop.visible = true
		
	if shop == false:
		$Shop.visible = false

	
func _physics_process(_delta):
	if Input.is_action_just_pressed("Attack") or Input.is_action_just_pressed("Wall"):
		$Area2D/CollisionShape2D.disabled = true
		yield(get_tree().create_timer(.4), "timeout")
		$Area2D/CollisionShape2D.disabled = false


func _on_BuyLarge_pressed():
	if SaveManager.coins >= 10:
		SaveManager.largehealth +=1
		SaveManager.coins -= 10

func _on_SellLarge_pressed():
	if SaveManager.largehealth >= 1:
		SaveManager.largehealth -= 1
		SaveManager.coins += 10
		

func _on_BuySmall_pressed():
	if SaveManager.coins >= 5:
		SaveManager.smallhealth +=1
		SaveManager.coins -= 5

func _on_SellSmall_pressed():
	if SaveManager.smallhealth >= 1:
		SaveManager.smallhealth -= 1
		SaveManager.coins += 5
