@tool
extends Window

@onready var brush_container = find_child("brush_container")
var can_zoom = false

var return_window:Window
func _ready():
	mouse_entered.connect( func(): can_zoom = true)
	mouse_exited.connect( func(): can_zoom = false)

func _input(event):
	if not can_zoom: return
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_WHEEL_UP:
		for child in brush_container.get_children():
			child.custom_minimum_size *= 1.02
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
		for child in brush_container.get_children():
			child.custom_minimum_size /= 1.02
	size = Vector2.ZERO
	
func _on_close_requested():
	queue_free()

func load_brushes(brushes):
	for brush in brushes:
		brush_container.add_child(brush)
		
