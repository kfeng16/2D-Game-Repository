extends Node

var final_score = 0

# This dictionary will be used to store the score and name before saving.
# It's declared here at the class level so it can be accessed by both
# _on_spawning_stopped and save functions.
var save_data = {
	"score": 0,
	"name": "NAME"
}

func update_final_score(score):
	prints('final score', score)
	final_score = score
	save_data["score"] = score # Update the score in the save_data dictionary.
	save(save_data)

func save(content): # Corrected to use the File class.
	if not FileAccess.file_exists("res://save_game.json"):
		save("")
		return
	var file = FileAccess.open("res://save_game.json", FileAccess.READ_WRITE)
	var data = file.get_as_text()
	var save = JSON.stringify(content) + data
	file.store_line(JSON.stringify(save))
	file.close()

func load():
	print('hello')
	if not FileAccess.file_exists("res://save_game.json"):
		save("")
		return
	var file = FileAccess.open("res://save_game.json", FileAccess.READ)
	var data = file.get_as_text()
	print(data)
	return data

