extends Panel

# Timer duration in seconds
var display_time = 5.0
# A variable to keep track of the elapsed time
var elapsed_time = 0.0
# A flag to indicate whether the instructions should be currently displayed
var showing_instructions = true

func _ready():
	# Make sure the panel is visible at the start
	visible = true
	# Reset the timer and flag
	elapsed_time = 0.0
	showing_instructions = true

func _process(delta):
	# Check if we are currently showing the instructions
	if showing_instructions:
		# Increase the elapsed time by the frame's delta time
		elapsed_time += delta
		# Check if the elapsed time has exceeded the display time
		if elapsed_time >= display_time:
			# Hide the instructions
			visible = false
			# Update the flag so we don't keep entering this block
			showing_instructions = false
			# Optionally, stop the _process from being called if you don't need it for other purposes
			set_process(false)
