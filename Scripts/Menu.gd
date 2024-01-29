extends Control

func _on_play_pressed():
	get_tree().change_scene_to_file("res://Scenes/main.tscn")

func _on_options_pressed():
	get_tree().change_scene_to_file("res://Scenes/options_menu.tscn")

func _on_quit_pressed():
	get_tree().quit()




func _on_play_mouse_entered():
	$ButtonSound.play()
	pass # Replace with function body.

func _on_options_mouse_entered():
	$ButtonSound.play()
	pass # Replace with function body.

func _on_quit_mouse_entered():
	$ButtonSound.play()
	pass # Replace with function body.
