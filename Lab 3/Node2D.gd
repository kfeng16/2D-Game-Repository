extends Node2D

var popcorn_scene = preload("res://popcornfall.tscn") # Adjust the path to your Popcorn scene
var spawn_rate = 0.5 # Time in seconds between spawns
var time_since_last_spawn = 0.0
var stuck_to_bowl = false

func _ready():
	randomize() # Ensure random numbers are different each time you run the scene

func _process(delta):
	time_since_last_spawn += delta
	
	# Check if it's time to spawn a new popcorn
	if time_since_last_spawn >= spawn_rate:
		spawn_popcorn()
		time_since_last_spawn = 0 # Reset the timer

func spawn_popcorn():
	var popcorn_instance = popcorn_scene.instantiate()
	add_child(popcorn_instance)

