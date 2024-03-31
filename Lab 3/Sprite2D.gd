extends Sprite2D

var speed = 200 # Speed of falling
var rotation_speed: float
var stuck_to_bowl: bool = false
var score = 0
signal counter

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

func _on_area_2d_area_entered(area):
	if area.is_in_group("Bowl"):
		print("Colliding with bowl, attempting to stick.")
		#stick_to_bowl(area.get_parent())  # Assuming the bowl's Area2D is a direct child of the bowl sprite
	else:
		stick_to_bowl(area.get_parent())
		score = score + 1
	
func stick_to_bowl(bowl):
	pass
#
func get_popcorn_info():
	return {
	"value": 10,  # As an example, each popcorn could represent 10 points.
	}

