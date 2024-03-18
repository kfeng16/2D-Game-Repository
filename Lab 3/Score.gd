extends Label

var score:int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# This function updates the label text to display the current score.
func update_score_display():
	score += 1
	prints("score", score)
	text = str(score)

func _on_sprite_2d_counter():
	update_score_display()
	pass # Replace with function body.


func _on_area_2d_area_entered(area):
	update_score_display() # Replace with function body.


func _on_node_2d_stop():
	Global.update_final_score(score)
	pass # Replace with function body.
