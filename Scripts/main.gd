extends Node2D

# The number of targets to spawn
@export var max_target_count = 10
# Minimum distance targets have to be apart
@export var min_dist = 200

# The path to the target scene
const TARGET_SCENE = "res://Scenes/target.tscn"
const END_SCENE = "res://Scenes/end_menu.tscn"

@onready var timer: Timer = $TargetTimer
# Load the end scene
@onready var end_scene = load(END_SCENE)
# Load the target scene
@onready var target_scene = load(TARGET_SCENE)
# Get the screen size
@onready var screen_size = get_viewport_rect().size
# The array of target instances
@onready var targets = []
# The array of active target locs
@onready var active_target_locs = []
@onready var target_locs = []
# Number of targets spawned
@onready var spawned_targets = 0
@onready var accuracy = 0.0
@onready var num_hit = 0
@onready var final_target = null
func _ready():
	timer.timeout.connect(spawn_target)
	timer.start()
	
func _on_target_hide(target):
	active_target_locs.pop_front()
	target_locs.append(target)
	if target.hit:
		num_hit += 1
	accuracy = 100 * float(num_hit) / float(spawned_targets)
	# Check if there are no more targets left
	if spawned_targets == max_target_count and target == final_target:
		# End the game
		end_game()
		
func spawn_target():
	# Create a new target instance
	var target = target_scene.instantiate()
	# Make the target invisible
	target.visible = false;
	# Add it to the scene
	add_child(target)
	# Target radius to 
	var radius = target.collision_shape_2d.shape.radius
	# Attempt to get a random location that is not too close to another target
	var newLoc = getSpawnLoc(radius)
	# Check if the placement worked
	while(newLoc == Vector2(-1, -1)):
		# Wait for next frame and try again
		await get_tree().process_frame
		newLoc = getSpawnLoc(radius)
	# Set its position to a random point on the screen
	target.position = newLoc
	# Make the target visible
	target.visible = true
	# Add it to the array
	targets.append(target)
	# Connect its hide signal to a function that handles target hiding
	target.hidden.connect(_on_target_hide.bind(target))
	# Increment the amount of targets and check if it reached the max number to stop spawning targets
	spawned_targets += 1
	if spawned_targets == max_target_count:
		final_target = target
		timer.queue_free()
func getSpawnLoc(radius) -> Vector2:
	var max_tries = 100
	while (max_tries > 0):
		var newLoc = Vector2(randf_range(0 + radius, screen_size.x - radius), randf_range(0 + radius, screen_size.y - radius))
		var tooClose = false
		for loc in active_target_locs:
			if newLoc.distance_to(loc) < min_dist:
				tooClose = true
				break
		if !tooClose:
			active_target_locs.append(newLoc)
			return newLoc
		max_tries -= 1
	return Vector2(-1,-1)

func end_game():
	var end = end_scene.instantiate()
	add_child(end)
	end.Accuracy.text = "Accuracy: " + str(accuracy)  + "%"
	
