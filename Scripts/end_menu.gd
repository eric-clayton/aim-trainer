extends Control

@onready var Accuracy = $MarginContainer/VBoxContainer/Accuracy

func _on_play_again_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_back_to_main_menu_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
