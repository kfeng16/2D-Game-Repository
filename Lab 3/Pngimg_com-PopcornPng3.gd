extends Sprite2D


# Declare variables
@export var speed = randi_range(2,4)
@export var dir = 1

func _ready():
	pass

func _process(delta):
	shoot()


func shoot():
	position.y += speed
	var popRotation = 0.2
	rotate(popRotation)
	popRotation = popRotation -1
	pass
	

