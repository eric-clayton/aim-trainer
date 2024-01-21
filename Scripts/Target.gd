extends Area2D
@onready var collision_shape_2d = $CollisionShape2D
@onready var timetolive = $TimeToLive
@onready var hit = false
func _ready():
	
	pass
	

func _on_input_event(_viewport, event, _shape_idx):
	# Check if the event is a left mouse button press
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		hit = true
		# Hide the target
		hide()


func _on_draw():
	timetolive.start()


func _on_time_to_live_timeout():
	hide()
