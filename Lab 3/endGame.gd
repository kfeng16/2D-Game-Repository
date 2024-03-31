extends Label

var initialScores = Global.load()
signal new_Name


# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_label_final(number):
	text = "hello"
	visible = true
	print('in endGame', initialScores)
	var scores = JSON.parse_string(initialScores)
	if scores[4]["score"] < number:
		text = "Congradulations you got " + str(number) + ". You made the leaderboard. \n"
		emit_signal("new_Name")
	else:
		text = "You got " + str(number) + " \n"
	text += "Leaderboard:\n"
	for i in range(scores.size()):
		text += scores[i]["name"]+ ": " + str(scores[i]["score"]) + "\n"
	pass # Replace with function body.
