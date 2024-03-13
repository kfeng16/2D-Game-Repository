extends Control  # Change Control to the type of your parent node if different

# Preload your game scene here
var game_scene_path = "res://Main scene Kristine.tscn"

func _on_button_pressed():
	var new_scene = load(game_scene_path).instantiate()
	var current_scene = get_tree().current_scene
	get_tree().get_root().add_child(new_scene)
	get_tree().current_scene = new_scene
	current_scene.queue_free()
