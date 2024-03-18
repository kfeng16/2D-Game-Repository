extends Label

var time_left = 5# Time left in seconds

func _ready():
	# Update the label text immediately on start
	text = str(int(time_left))

func _process(delta):
	if time_left > 0:
		time_left -= delta # Decrease the time left
		text = str(int(time_left)) # Update the label text
	else:
		time_left = 0 # Ensure time doesn't go below 0
		text = "" # Set the text to "0" to show the countdown is over
		set_process(false) # Stop the _process function from being called
