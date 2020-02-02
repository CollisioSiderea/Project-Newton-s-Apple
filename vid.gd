extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var t = Timer.new() 		# Create a new Timer node
	t.set_wait_time(35) 		# Set the wait time
	add_child(t)			# Add it to the node tree as the direct child
	t.start()			# Start it
	yield(t, "timeout")		# Finally, make the script stop with the yield
	
	$video. remove_and_skip()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
