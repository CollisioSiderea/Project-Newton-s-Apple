extends StaticBody2D
var boton = "idle"

func _on_princes_body_entered(body):
	if body.get_name() == "caja":
		$pared.move_local_y(100,true)
		$puerta/Doora.play("open")
		
		boton = "push"
		var t = Timer.new() 		# Create a new Timer node
		t.set_wait_time(5.5) 		# Set the wait time
		add_child(t)			# Add it to the node tree as the direct child
		t.start()			# Start it
		yield(t, "timeout")		# Finally, make the script stop with the yield
		
		$pared.move_local_y(-100,true)
		$puerta/Doora.play("close")
func _physics_process(delta):
		$botona.play(boton)
