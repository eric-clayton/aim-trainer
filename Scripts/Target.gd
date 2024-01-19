extends Area2D

func _ready():
	# Connect the input_event signal to a function that handles mouse clicks
	connect("input_event", Callable(self, "_on_mouse_click_event"))

func _on_mouse_click_event(viewport, event, shape_idx):
	# Check if the event is a left mouse button press
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		# Hide the target
		hide()
