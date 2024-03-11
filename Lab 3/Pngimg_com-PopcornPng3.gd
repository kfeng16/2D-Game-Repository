extends Sprite2D

# Declare variables
@export var min_speed : float = 2
@export var max_speed : float = 4
@export var min_rotation : float = -1
@export var max_rotation : float = 1
var speed : float
var rotation_speed : float

func _ready():
	# Initialize properties randomly
	speed = randi_range(min_speed, max_speed)
	rotation_speed = randi_range(min_rotation, max_rotation) * 0.3

func _process(delta):
	shoot()

func shoot():
	position.y += speed
	rotate(rotation_speed)
	pass
	
