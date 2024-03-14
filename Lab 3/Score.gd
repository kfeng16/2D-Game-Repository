extends Label

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	update_score_display()

# This function is meant to be called from another script when the popcorn collides.
func process_popcorn_collision(popcorn_value):
	score += popcorn_value
	update_score_display()

# This function updates the label text to display the current score.
func update_score_display():
	text = "Score: " + str(score)


func _on_sprite_2d_counter():
	score = score + 1
	update_score_display()
	pass # Replace with function body.
