extends Panel

var default_texture = preload("res://UI/InventorySlot.png")
var empty_texture = preload("res://UI/InventorySlotclear.png")
var default_style: StyleBoxTexture = null
var empty_style: StyleBoxTexture = null

var Items = preload("res://UI/Items.tscn")
var item = null

func _ready():
	default_style = StyleBoxTexture.new()
	empty_style = StyleBoxTexture.new()
	default_style.texture = default_texture
	empty_style.texture = empty_texture
		
	if randi() % 2 == 0:
		item = Items.instance()
		add_child(item)
	refresh_style()
func refresh_style():
	if item == null:
		set("custom_styles/panel", empty_style)
	else:
		set("custom_styles/panel", default_style)

func pickfromslot():
	remove_child(item)
	var inventorynode = find_parent("Inventory")
	inventorynode.add_child(item)
	item = null
	refresh_style()
	
func putinslot(new_item):
	item = new_item
	item.position = Vector2(0,0)
	var inventorynode = find_parent("Inventory")
	inventorynode.remove_child(item)
	add_child(item)
	refresh_style()
