extends Sprite2D

# Declare member variables here. Examples:
@export var min_speed: float = 2
@export var max_speed: float = 4
@export var min_rotation: float = -1
@export var max_rotation: float = 1
var speed: float
var rotation_speed: float
var stuck_to_bowl: bool = false
var bowl_name

func _ready():
	randomize()
	speed = 20 * randi_range(min_speed, max_speed)
	rotation_speed = randi_range(min_rotation, max_rotation) * PI / 180  # Convert to radians if needed.
	set_process(true)  # This ensures that _process will be called.

func _process(delta):
	if Input.is_action_pressed("ui_text_backspace"):
			speed = speed * 2
	bowl_name = get_parent().get_node("04Bowl")
	if Input.is_action_just_pressed("ui_up"):  # Press a key to trigger
		_on_area_2d_area_entered(bowl_name)  # Direct reference for testing
	#print("Processing: ")  # This will print the current time in milliseconds to the output panel every frame.
	if not stuck_to_bowl:
		#print("Not stuck: ", position.y)  # This will print the y position every frame.
		position.y += speed * delta  # This should make the popcorn fall.
		rotation += rotation_speed * delta  # Ensure rotation_speed is in radians if using rotate().
		
func _on_area_2d_area_entered(area):
	if area.is_in_group("Bowl"):
		print("Colliding with bowl, attempting to stick.")
		stick_to_bowl(area.get_parent())  # Assuming the bowl's Area2D is a direct child of the bowl sprite
		var popcorn_info = get_popcorn_info()
		var label_node = get_node("$../Score")  # Replace with the actual path to your label node
		label_node.process_popcorn_collision(popcorn_info["value"])
	else:
		stick_to_bowl(area.get_parent())
		print("Collided with something else: ", area.name)
	
func stick_to_bowl(bowl):
	global_position = Vector2(bowl.global_position.x, bowl.global_position.y)
	speed = 0
	self.z_index = bowl.z_index + 1
	rotation_speed = 0
	stuck_to_bowl = true
	set_process(false)


func get_popcorn_info():
	return {
	"value": 10,  # As an example, each popcorn could represent 10 points.
	}



