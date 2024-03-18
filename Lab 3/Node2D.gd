extends Node2D

var popcorn_scene = preload("res://Working scnee.tscn") # Adjust the path to your Popcorn scene
var spawn_rate = 0.5 # Time in seconds between spawns
var time_since_last_spawn = 0.0
var total_time_elapsed = 0 # Variable to track total time elapsed
@export var spawn_duration = 30 # Duration in seconds after which spawning stops
var spawning_enabled = true # Flag to control spawning
var flag = true
signal stop

func _ready():
	randomize() # Ensure random numbers are different each time you run the scene

func _process(delta):
	if spawning_enabled:
		time_since_last_spawn += delta
		total_time_elapsed += delta # Update total time elapsed
		print("time", total_time_elapsed)

		if time_since_last_spawn >= spawn_rate && flag == true:
			spawn_popcorn()
			time_since_last_spawn = 0 

		if total_time_elapsed >= spawn_duration:
			flag = false
			print("spawning stopped")
			emit_signal("stop")  # Emit signal when spawning stops
			spawning_enabled = false # Stop spawning after 15 seconds

func spawn_popcorn():
	var popcorn_instance = popcorn_scene.instantiate()
	add_child(popcorn_instance)
