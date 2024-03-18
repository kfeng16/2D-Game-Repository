extends Sprite2D

var score = 0
var flag = true


# Called when the node enters the scene tree for the first time.
func _ready():
	add_to_group("Bowl") # Add bowl to a group for easier detection
	pass
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var viewport_size = get_viewport_rect().size
	var viewport_height = viewport_size.y
	var viewport_width = viewport_size.x
	if Input.is_action_pressed("ui_right") && position.x < viewport_width && flag == true:
		position.x += 10
	if Input.is_action_pressed("ui_left") && position.x > 0 && flag == true:
		position.x -= 10
		
	pass



func _on_area_2d_area_entered(area):
	area.get_node("../..").queue_free()


func _on_label_final(number):
	flag = false
	pass # Replace with function body.
