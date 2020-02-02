extends KinematicBody2D

# This demo shows how to build a kinematic controller.

# Member variables
var GRAVITY = 157 # pixels/second/second

# Angle in degrees towards either side that the player can consider "floor"
var FLOOR_ANGLE_TOLERANCE = 40
var WALK_FORCE = 1000
var WALK_MIN_SPEED = 10
var WALK_MAX_SPEED = 75
var STOP_FORCE = 1000
var JUMP_SPEED = 115
var JUMP_MAX_AIRBORNE_TIME = 0.01

var SLIDE_STOP_VELOCITY = 1000.0 # one pixel/second
var SLIDE_STOP_MIN_TRAVEL = 1000.0 # one pixel

var velocity = Vector2()
var on_air_time = 100
var jumping = false

var prev_jump_pressed = false

var animation = "idle"

func _physics_process(delta):
	# Create forces
	var force = Vector2(0, GRAVITY)
	
	var walk_left = Input.is_action_pressed("move_left")
	var walk_right = Input.is_action_pressed("move_right")
	var jump = Input.is_action_pressed("jump")
	var grav = Input.is_action_just_pressed("grav")
	var up = Input.is_action_pressed("move_up")
	var down = Input.is_action_pressed("move_bottom")
	var reset = Input.is_action_just_pressed("reset")
	
	var stop = true
	
	if reset:
		get_tree().reload_current_scene()
	
	if walk_left:
		if velocity.x <= WALK_MIN_SPEED and velocity.x > -WALK_MAX_SPEED:
			force.x -= WALK_FORCE
			stop = false
	elif walk_right:
		if velocity.x >= -WALK_MIN_SPEED and velocity.x < WALK_MAX_SPEED:
			force.x += WALK_FORCE
			stop = false
	if up:
		if velocity.y <= WALK_MIN_SPEED and velocity.y > -WALK_MAX_SPEED and GRAVITY<=1:
			force.y -= WALK_FORCE
			stop = false
	elif down:
		if velocity.y >= -WALK_MIN_SPEED and velocity.y < WALK_MAX_SPEED and GRAVITY<=1:
			force.y += WALK_FORCE
			stop = false
			
	if grav:
		if GRAVITY == 157:
			GRAVITY = 1
			WALK_FORCE = 50
			WALK_MAX_SPEED = 50
			STOP_FORCE = 1000
			Physics2DServer.area_set_param(get_world_2d().space, Physics2DServer.AREA_PARAM_GRAVITY_VECTOR, Vector2(0,0))
		else: 
			GRAVITY = 157
			WALK_FORCE = 250
			WALK_MAX_SPEED = 75
			STOP_FORCE = 1000
			Physics2DServer.area_set_param(get_world_2d().space, Physics2DServer.AREA_PARAM_GRAVITY_VECTOR, Vector2(0,1.5))

	if stop:
		var vsign = sign(velocity.x)
		var vlen = abs(velocity.x)
		vlen -= STOP_FORCE * delta
		if vlen < 0:
			vlen = 0
		velocity.x = vlen * vsign
		if GRAVITY<=1:
			var yvsign = sign(velocity.y)
			var yvlen = abs(velocity.y)
			yvlen -= STOP_FORCE * delta
			if yvlen < 0:
				yvlen = 0
			velocity.y = yvlen * yvsign
		#else:
			#animation="idle"
		
	# Integrate forces to velocity
	velocity += force * delta	
	# Integrate velocity into motion and move
	velocity = move_and_slide(velocity, Vector2(0, -1))
	
	if is_on_floor():
		on_air_time = 0
		
	if jumping and velocity.y > 0:
		# If falling, no longer jumping
		jumping = false
	
	if on_air_time < JUMP_MAX_AIRBORNE_TIME and jump and not prev_jump_pressed and not jumping:
		# Jump must also be allowed to happen if the character left the floor a little bit ago.
		# Makes controls more snappy.
		velocity.y = -JUMP_SPEED
		jumping = true
	#if pfloat = true:
	#	$PAnimation.play("idle")
	on_air_time += delta
	prev_jump_pressed = jump
	if GRAVITY > 2 and velocity.x == 0:
		animation = "idle"
	elif GRAVITY > 2 and velocity.x < 0:
		animation = "walk"
	elif GRAVITY > 2 and velocity.x > 0:
		animation = "walkr"
	elif GRAVITY < 2 and velocity.x <= 0 or velocity.x > 0:
		animation = "gravity"
	$PAnimation.play(animation)
