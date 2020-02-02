extends Node2D
var push = Input.is_action_just_pressed("push")

		


func _on_muerte_body_entered(body):
	if body.get_name() == "caja":
		get_tree().reload_current_scene()
	elif body.get_name() == "player":
		get_tree().reload_current_scene()




func _on_princess_body_entered(body):
	if body.get_name() == "caja":
		$pared.move_local_y(100,true)
	
		var t = Timer.new() 		# Create a new Timer node
		t.set_wait_time(5.5) 		# Set the wait time
		add_child(t)			# Add it to the node tree as the direct child
		t.start()			# Start it
		yield(t, "timeout")		# Finally, make the script stop with the yield
		
		$pared.move_local_y(-100,true)


func _on_salida1_body_entered(body):
	if body.get_name() == "player":
		get_tree().change_scene("world2.tscn")

func _on_salida2_body_entered(body):
	if body.get_name() == "player":
		get_tree().change_scene("world3.tscn")

func _on_salida3_body_entered(body):
	if body.get_name() == "player":
		get_tree().change_scene("world4.tscn")

func _on_salida4_body_entered(body):
	if body.get_name() == "player":
		get_tree().change_scene("world1.tscn")
	



#func _on_bottom_body_entered(body):
#	if body.get_name() == "player":
#		$puente.move_local_x(60,true)
#		
#		var t = Timer.new() 		# Create a new Timer node
#		t.set_wait_time(5.5) 		# Set the wait time
#		add_child(t)			# Add it to the node tree as the direct child
#		t.start()			# Start it
#		yield(t, "timeout")		# Finally, make the script stop with the yield

#		$puente.move_local_x(-60,true)


func _on_boton_body_entered(body):
	if body.get_name() == "player":
		$pared.move_local_y(100,true)
		
		var t = Timer.new() 		# Create a new Timer node
		t.set_wait_time(9.5) 		# Set the wait time
		add_child(t)			# Add it to the node tree as the direct child
		t.start()			# Start it
		yield(t, "timeout")		# Finally, make the script stop with the yield
		
		$pared.move_local_y(-100,true)


#func _on_puerta_body_entered(body):
	#if body.get_name() != "pared":
		
