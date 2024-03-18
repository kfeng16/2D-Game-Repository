extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	var scores = Global.load()  # Load top scores
	var display_text = ""
	#for score in scores:
		#display_text += "Name: %s, Score: %d\n" % [score["name"], score["score"]]
	#self.text = display_text

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
