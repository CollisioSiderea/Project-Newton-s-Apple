extends KinematicBody2D

# This demo shows how to build a kinematic controller.

# Member variables
var GRAVITY = 157 # pixels/second/second

var velocity = Vector2()

func _physics_process(delta):
	# Create forces
	var force = Vector2(0, GRAVITY)
	
	var grav = Input.is_action_just_pressed("grav")
	
	if grav:
		if GRAVITY == 157:
			GRAVITY = 1
		else: 
			GRAVITY = 157
		
	# Integrate forces to velocity
	velocity += force * delta	
	# Integrate velocity into motion and move
	if is_on_floor() or is_on_wall() or is_on_ceiling():
		velocity = move_and_slide(velocity, Vector2(0, -1))
	else:
		velocity = move_and_slide(velocity, Vector2(0, -1))
