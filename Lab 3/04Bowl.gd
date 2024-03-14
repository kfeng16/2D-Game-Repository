extends Sprite2D

var score = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Bowl") # Add bowl to a group for easier detection
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var viewport_size = get_viewport_rect().size
	var viewport_height = viewport_size.y
	var viewport_width = viewport_size.x
	if Input.is_action_pressed("ui_right") && position.x < viewport_width:
		position.x += 15
	if Input.is_action_pressed("ui_left") && position.x > 0:
		position.x -= 15
	pass
	pass

# Implement this method if you need to perform some logic when a popcorn collides.

	# ... any other logic you want to happen when a popcorn hits the bowl ...

