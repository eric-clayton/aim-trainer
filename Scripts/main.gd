extends Node2D

# The number of targets to spawn
const TARGET_COUNT = 10

# The path to the target scene
const TARGET_SCENE = "res://Scenes/target.tscn"

# The size of the screen
var screen_size

# The array of target instances
var targets = []

func _ready():
	# Get the screen size
	screen_size = get_viewport_rect().size
	# Load the target scene
	var target_scene = load(TARGET_SCENE)
	# Spawn the targets
	for i in range(TARGET_COUNT):
		# Create a new target instance
		var target = target_scene.instantiate()
		# Add it to the scene
		add_child(target)
		# Set its position to a random point on the screen
		target.position = Vector2(randf_range(0, screen_size.x), randf_range(0, screen_size.y))
		# Add it to the array
		targets.append(target)
		# Connect its hide signal to a function that handles target hiding
		target.connect("hide", Callable(self, "_on_target_hide"))

func _on_target_hide(target):
	# Remove the target from the array
	targets.erase(target)
	# Free the target from memory
	target.queue_free()
	# Check if there are no more targets left
	if targets.empty():
		# End the game
		print("You win!")
