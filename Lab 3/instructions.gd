extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	if Input.is_action_pressed ("ui_right") || Input.is_action_pressed ("ui_left"): 
		visible = false
		
	
