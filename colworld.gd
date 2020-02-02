extends Node2D

func _on_princess_body_enter(body):
		
	if body.get_name() == "caja":
		$pared.move_local_y(50,true)
		$puente.move_local_x(60,true)
		
	#else:
		#$pared.move_local_y(0,false)
		#$puente.move_local_x(0,false)
