extends KinematicBody2D

var velocity = Vector2()
var GRAVITY = 500.0

func _physics_process(delta):
	var collision_info = move_and_slide(velocity * delta, Vector2(0,GRAVITY))
	if collision_info:
		velocity = velocity.bounce(collision_info.normal)
		#velocity.x = velocity * delta
