extends Node2D

func _on_princess_body_enter(body):
	
	if body.get_name() == "caja":
		$pared.move_local_y(50,true)
		#$puente.move_local_x(60,true)
		var t = Timer.new() 		# Create a new Timer node
		t.set_wait_time(5.5) 		# Set the wait time
		add_child(t)			# Add it to the node tree as the direct child
		t.start()			# Start it
		yield(t, "timeout")		# Finally, make the script stop with the yield
		$pared.move_local_y(-50,true)
		#$puente.move_local_x(-60,true)
		


func _on_bottom_input_event(viewport, event, shape_idx):
		
		$puente.move_local_x(60,true)
		var t = Timer.new() 		# Create a new Timer node
		t.set_wait_time(5.5) 		# Set the wait time
		add_child(t)			# Add it to the node tree as the direct child
		t.start()			# Start it
		yield(t, "timeout")		# Finally, make the script stop with the yield
		#$pared.move_local_y(-50,true)
		$puente.move_local_x(-60,true)
