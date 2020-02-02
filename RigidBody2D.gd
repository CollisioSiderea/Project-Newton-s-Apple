extends RigidBody2D


var animation = "jugo" 

func _physics_process(delta):
	
	$ANewton.play(animation)
