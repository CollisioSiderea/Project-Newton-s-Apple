extends Node2D

#Physics2DServer.areasetparam(getworld2d.getspace())
#Physics2DServer.area_param_Gravity(500, Vector2(0, 0))

func _on_princess_body_enter(body):
	# The name of this editor-generated callback is unfortunate
	if body.get_name() == "player":
		$youwin.show()
