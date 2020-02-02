extends KinematicBody2D

var GRAVITY = 157 # pixels/second/second
var WALK_FORCE = 1000
var WALK_MIN_SPEED = 10
var WALK_MAX_SPEED = 65
var STOP_FORCE = 1000

var velocity = Vector2()

func _physics_process(delta):
	#print(delta)
	# Create forces
	var force = Vector2(0, GRAVITY)
	var grav = Input.is_action_just_pressed("grav")
	
	var walk_left = Input.is_action_pressed("move_left")
	var walk_right = Input.is_action_pressed("move_right")
	var up = Input.is_action_pressed("move_up")
	var down = Input.is_action_pressed("move_bottom")
	
	if grav:
		if GRAVITY == 157:
			GRAVITY = 1
			WALK_FORCE = 50
			STOP_FORCE = 1000
		else: 
			GRAVITY = 157
			WALK_FORCE = 250
			STOP_FORCE = 1000
			
	velocity += force * delta
	# Integrate velocity into motion and move

	#velocity = move_and_slide(velocity, Vector2(0, -1))
	
	
#func _move_box(body):
#	print("_move_box")
#	print(body.name)
#	
#	if body.name=="player":
#		var walk_left = Input.is_action_pressed("move_left")
#		var walk_right = Input.is_action_pressed("move_right")
#		var up = Input.is_action_pressed("move_up")
#		var down = Input.is_action_pressed("move_bottom")
#		
#		if walk_left:
#			velocity = move_and_slide(Vector2(-65, velocity.y), Vector2(0, -1))
#		elif walk_right:
#			velocity = move_and_slide(Vector2(65, velocity.y), Vector2(0, -1))
#		if up and GRAVITY<=1:
#			velocity = move_and_slide(Vector2(velocity.x, 65), Vector2(0, -1))
#		elif down and GRAVITY<=1:
#			velocity = move_and_slide(Vector2(velocity.x, -65), Vector2(0, -1))
#	
#	#if collision_info == "[KinematicCollision2D:1293]":
#	#	print("FUNCA")
#
#
