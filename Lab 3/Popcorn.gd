extends Sprite2D

var speed = 200 # Speed of falling

func _ready():
	# Randomize the starting position
	position.x = randf_range(0, get_viewport_rect().size.x)
	position.y = -texture.get_height() # Start above the screen

func _process(delta):
	# Move the popcorn down
	position.y += speed * delta
	
	# Reset position if it goes off the bottom
	if position.y > get_viewport_rect().size.y:
		position.x = randf_range(0, get_viewport_rect().size.x)
		position.y = -texture.get_height()
