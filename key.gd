extends Area2D

#signal door_key

func _on_body_entered(body):
	if(body.get_name() == 'Player') or (body.get_name() == 'shadow'):
		print("get")
		LevelManager.door_key.emit()
		#emit_signal('door_key')
		queue_free()
	
