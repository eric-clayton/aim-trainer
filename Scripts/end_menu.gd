extends Control

@onready var accuracy = $CenterContainer/VBoxContainer/Accuracy
@onready var targets_hit = $CenterContainer/VBoxContainer/TargetsHit

func _on_play_again_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_back_to_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")


func _on_play_again_mouse_entered():
	$ButtonSound.play()
	pass # Replace with function body.


func _on_back_to_main_menu_mouse_entered():
	$ButtonSound.play()
	pass # Replace with function body.
