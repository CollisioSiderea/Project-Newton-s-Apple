extends Node2D


func _on_princess_body_enter(body):
	# The name of this editor-generated callback is unfortunate
	if body.get_name() == "caja":
		#$youwin.show()
		#$pared.rotate(-5000)
		#$pared. remove_and_skip()
		#$pared. hide()
		$caja. remove_and_skip()
		$pared. move_local_y(50,true)
		
	else:
		#$pared. show()
		$pared. move_local_y(0,false)
