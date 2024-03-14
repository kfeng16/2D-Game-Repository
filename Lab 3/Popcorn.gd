extends Sprite2D

var speed = 200 # Speed of falling
var rotation_speed: float
var stuck_to_bowl: bool = false
signal counter

func _ready():
	# Randomize the starting position
	position.x = randf_range(0, get_viewport_rect().size.x)
	position.y = -texture.get_height() # Start above the screen

func _process(delta):
	# Move the popcorn down
	if not stuck_to_bowl:
		#print("Not stuck: ", position.y) 
		position.y += speed * delta
	
	# Reset position if it goes off the bottom
	if position.y > get_viewport_rect().size.y:
		position.x = randf_range(0, get_viewport_rect().size.x)
		position.y = -texture.get_height()

func _on_area_2d_area_entered(area):
	if area.is_in_group("Bowl"):
		print("Colliding with bowl, attempting to stick.")
		stick_to_bowl(area.get_parent())  
	else:
		stick_to_bowl(area.get_parent())
		print("Collided with something else: ", area.name)
	
func stick_to_bowl(bowl):
	self.get_parent().remove_child(self)
	bowl.add_child(self)
	self.position = bowl.to_local(global_position)
	self.z_index = bowl.z_index + 1
	speed = 0
	rotation_speed = 0
	stuck_to_bowl = true
	set_process(false) # Optionally stop processing if no other updates are needed.


func get_popcorn_info():
	return {
	"value": 10,  # As an example, each popcorn could represent 10 points.
	}
