extends Area2D

func _on_body_entered(body):
	if body.name == 'Player':
		get_tree().reload_current_scene()
		queue_free()
	#else:
		#queue_free()
