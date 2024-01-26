extends Node

enum Difficulties {Easy, Normal, Hard, Legendary, Custom}
var max_target_count
var spawn_time
var time_time_to_live
var difficulty = Difficulties.Normal

func _ready():
	set_difficulty(difficulty)

func set_difficulty(value : int):
	match value:
		Difficulties.Easy:
			difficulty = Difficulties.Easy
			max_target_count = 10
			spawn_time = 3
			time_time_to_live = 3
		Difficulties.Normal:
			difficulty = Difficulties.Normal
			max_target_count = 20
			spawn_time = 2
			time_time_to_live = 2
		Difficulties.Hard:
			difficulty = Difficulties.Hard
			max_target_count = 50
			spawn_time = 1
			time_time_to_live = 1
		Difficulties.Legendary:
			difficulty = Difficulties.Legendary
			max_target_count = 60
			spawn_time = 0.5
			time_time_to_live = 0.5
		Difficulties.Custom:
			difficulty = Difficulties.Custom
