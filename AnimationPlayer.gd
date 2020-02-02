extends AnimationPlayer


func animate( ):
	var move = Animation.new()
	var track_index = move.add_track(Animation.TYPE_VALUE)
	move.track_set_path(track_index, "Enemy:position.x")
	move.track_insert_key(track_index, 0.0, 0)
	move.track_insert_key(track_index, 0.5, 100)
