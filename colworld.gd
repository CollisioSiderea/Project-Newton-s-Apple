extends Node2D
var push = Input.is_action_just_pressed("push")

func _on_princess_body_enter(body):
		
	if body.get_name() == "caja":
		$pared.move_local_y(50,true)
		
		var t = Timer.new() 		# Create a new Timer node
		t.set_wait_time(5.5) 		# Set the wait time
		add_child(t)			# Add it to the node tree as the direct child
		t.start()			# Start it
		yield(t, "timeout")		# Finally, make the script stop with the yield
		
		$pared.move_local_y(-50,true)




		#$puente.move_local_x(60,true)
		
		#var t = Timer.new() 		# Create a new Timer node
		#t.set_wait_time(5.5) 		# Set the wait time
		#add_child(t)			# Add it to the node tree as the direct child
		#t.start()			# Start it
		#yield(t, "timeout")		# Finally, make the script stop with the yield

		#$puente.move_local_x(-60,true)


func _on_muerte_body_entered(body):
	if body.get_name() == "caja":
		get_tree().reload_current_scene()
