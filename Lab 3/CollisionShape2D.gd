extends CollisionShape2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var viewport_size = get_viewport_rect().size
	var viewport_height = viewport_size.y
	var viewport_width = viewport_size.x
	if Input.is_action_pressed("ui_right") && position.x < viewport_width:
		position.x += 5
	if Input.is_action_pressed("ui_left") && position.x > 0:
		position.x -= 5
	pass
