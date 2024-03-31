extends Node

var final_score = 0

# This dictionary will be used to store the score and name before saving.
# It's declared here at the class level so it can be accessed by both
# _on_spawning_stopped and save functions.

func update_final_score(score):
	final_score = score
	save(score)

func save(content): # Corrected to use the File class.
	var existing = FileAccess.open("res://save_game.json", FileAccess.READ)
	var data = existing.get_as_text()
	var topScores = JSON.parse_string(data)
	topScores.append({"name" : "Name6", "score": content})
	topScores.sort()
	topScores.pop_back()
	
	
	var file = FileAccess.open("res://save_game.json", FileAccess.READ_WRITE)
	var save = JSON.stringify(topScores)
	file.store_line(save)
	file.close()

func load():
	if not FileAccess.file_exists("res://save_game.json"):
		save("")
		return
	var file = FileAccess.open("res://save_game.json", FileAccess.READ)
	var data = file.get_as_text()
	return data

