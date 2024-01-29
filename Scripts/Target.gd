extends Area2D
@onready var collision_shape_2d = $CollisionShape2D
@onready var timetolive = $TimeToLive
@onready var hit = false
var mouse_hover = false
func _ready():
	
	pass
	

func _on_input_event(_viewport, event, _shape_idx):
	# Check if the event is a left mouse button press
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		hit = true
		# Hide the target
		hide()
		mouse_hover = false


func _on_draw():
	timetolive.start()


func _on_time_to_live_timeout():
	hide()
	mouse_hover = false

func _on_mouse_entered():
	if visible:
		mouse_hover = true

func _on_mouse_exited():
	mouse_hover = false
