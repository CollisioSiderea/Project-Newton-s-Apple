extends RigidBody2D

#func 
#var torque = 20000
#var GRAVITY = 500.0
#var thrust = Vector2(0, GRAVITY)
#var velocity = Vector2()

#func _integrate_forces(state):
#	var force = Vector2(0, -(GRAVITY))
#	
#	if Input.is_action_just_pressed("grav"):
#		GRAVITY = 0
#		applied_force = thrust.slide(GRAVITY)
#		
#	if Input.is_action_pressed("ui_up"):
#		applied_force = thrust.rotated(rotation)
#	else:
#		applied_force = Vector2()
#	var rotation_dir = 0
#	if Input.is_action_pressed("ui_right"):
#		rotation_dir += 1
#	if Input.is_action_pressed("ui_left"):
#		rotation_dir -= 1
#	applied_torque = rotation_dir * torque
	
#	velocity += force * state
#	velocity = move_local_y(velocity)
	
#extends RigidBody2D

#var GRAVITY = 500.0
#var velocity = Vector2()


# Called when the node enters the scene tree for the first time.
#func _physics_process(delta):
#	var force = Vector2(0, GRAVITY)
#	var grav = Input.is_action_just_pressed("grav")
	
	
	#if grav:
	#	if GRAVITY == 500:
	#		GRAVITY = 0
	#	else: 
	#		GRAVITY = 500'''
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
