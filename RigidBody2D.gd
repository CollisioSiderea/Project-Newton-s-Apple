extends RigidBody2D


var animation = "idle" 

func _physics_process(delta):
	
	$ANewton.play(animation)

	
