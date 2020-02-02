extends Node2D

#Physics2DServer.areasetparam(getworld2d.getspace())
#Physics2DServer.area_param_Gravity(500, Vector2(0, 0))

func _on_princess_body_enter(body):
	# The name of this editor-generated callback is unfortunate
	if body.get_name() == "caja":
		#$youwin.show()
		#$pared.rotate(-5000)
		#$pared. remove_and_skip()
		#$pared. hide()
		$caja. remove_and_skip()
		$pared. move_local_y(50,true)
		$puente. move_local_x(60,true)
		
	else:
		#$pared. show()
		$pared. move_local_y(0,false)
		$puente. move_local_x(0,false)
