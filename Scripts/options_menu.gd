extends Control

@onready var targets = $"CenterContainer/VBoxContainer/Targets"
@onready var next_target_timer = $"CenterContainer/VBoxContainer/Next Target Timer"
@onready var target_lifetime = $"CenterContainer/VBoxContainer/Target Lifetime"
@onready var h_slider = $CenterContainer/VBoxContainer/HSlider

func _ready():
	targets.value = Settings.max_target_count
	next_target_timer.value = Settings.spawn_time
	target_lifetime.value = Settings.time_time_to_live
	h_slider.value = Settings.difficulty

func _on_back_pressed():
	Settings.max_target_count = int(targets.value)
	Settings.spawn_time = next_target_timer.value
	Settings.time_time_to_live = target_lifetime.value
	Settings.difficulty = h_slider.value
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
	
func _on_h_slider_value_changed(value):
	Settings.set_difficulty(int(value))
	targets.value = Settings.max_target_count
	next_target_timer.value = Settings.spawn_time
	target_lifetime.value = Settings.time_time_to_live
	if(Settings.difficulty == Settings.Difficulties.Custom):
		set_spinbox_editable(true)
func set_spinbox_editable(editable):
	targets.editable = editable
	next_target_timer.editable = editable
	target_lifetime.editable = editable


func _on_back_mouse_entered():
	$ButtonSound.play()
	pass # Replace with function body.
