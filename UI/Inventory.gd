extends Sprite

const Slots = preload("res://UI/Slot.gd")
onready var inventory_slot = $GridContainer
var holding_item = null

func _ready():
	for inv_slot in inventory_slot.get_children():
		inv_slot.connect("gui_input", self, "slot_gui_input", [inv_slot])
		
func slot_gui_input(event: InputEvent, slot: Slots):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.pressed:
			if holding_item != null:
				if !slot.item:
					slot.putinslot(holding_item)
					holding_item = null
					print("Place item in ", slot.name)
				else:
					var temp_item = slot.item
					slot.pickfromslot()
					temp_item.global_position = event.global_position
					slot.putinslot(holding_item)
					holding_item = temp_item
					print("Item Switched with item in", slot.name)
			elif slot.item:
				holding_item = slot.item
				print("grab item")
				slot.pickfromslot()
				holding_item.global_position = get_global_mouse_position()

func _input(_event):
	if holding_item:
		holding_item.global_position = get_global_mouse_position()

