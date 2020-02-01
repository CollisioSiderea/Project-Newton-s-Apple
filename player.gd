extends KinematicBody2D

# This demo shows how to build a kinematic controller.

# Member variables
var GRAVITY = 500.0 # pixels/second/second

# Angle in degrees towards either side that the player can consider "floor"
const FLOOR_ANGLE_TOLERANCE = 40
var WALK_FORCE = 100
const WALK_MIN_SPEED = 10
const WALK_MAX_SPEED = 200
var STOP_FORCE = 1000
const JUMP_SPEED = 200
const JUMP_MAX_AIRBORNE_TIME = 0.2

const SLIDE_STOP_VELOCITY = 1.0 # one pixel/second
const SLIDE_STOP_MIN_TRAVEL = 1.0 # one pixel

var velocity = Vector2()
var on_air_time = 100
var jumping = false

var prev_jump_pressed = false


func _physics_process(delta):
	# Create forces
	var force = Vector2(0, GRAVITY)
	
	var walk_left = Input.is_action_pressed("move_left")
	var walk_right = Input.is_action_pressed("move_right")
	var jump = Input.is_action_pressed("jump")
	var grav = Input.is_action_just_pressed("grav")
	var up = Input.is_action_pressed("move_up")
	var down = Input.is_action_pressed("move_bottom")
	
	var stop = true
	
	if walk_left:
		if velocity.x <= WALK_MIN_SPEED and velocity.x > -WALK_MAX_SPEED:
			force.x -= WALK_FORCE
			stop = false
	elif walk_right:
		if velocity.x >= -WALK_MIN_SPEED and velocity.x < WALK_MAX_SPEED:
			force.x += WALK_FORCE
			stop = false
			
	if up:
		if velocity.y <= WALK_MIN_SPEED and velocity.y > -WALK_MAX_SPEED:
			#force.y -= WALK_FORCE
			stop = false
	elif down:
		if velocity.y >= -WALK_MIN_SPEED and velocity.y < WALK_MAX_SPEED:
			force.y += WALK_FORCE
			stop = false
			
	if grav:
		if GRAVITY == 500:
			GRAVITY = 0
		if WALK_FORCE == 100:
			WALK_FORCE = 10
		if STOP_FORCE == 1000:
			STOP_FORCE = 10
		else: 
			GRAVITY = 500
			WALK_FORCE = 100
			STOP_FORCE = 1000
			
	
	if stop:
		var vsign = sign(velocity.x)
		var vlen = abs(velocity.x)
		
		vlen -= STOP_FORCE * delta
		if vlen < 0:
			vlen = 0
		
		velocity.x = vlen * vsign
	
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
	
	on_air_time += delta
	prev_jump_pressed = jump
