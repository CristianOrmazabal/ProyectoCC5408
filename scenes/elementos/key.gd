extends Area2D

#signal door_key

func _on_body_entered(body):
	var player = body as Player
	var shad = body as shadow
	#if not player and not shad:
		#return
	if(player or shad):
		print("get")
		LevelManager.door_key.emit()
		#emit_signal('door_key')
		queue_free()		
		
	#if(body.get_name() == 'Player') or (body.get_name() == 'shadow'):
		#print("get")
		#LevelManager.door_key.emit()
		##emit_signal('door_key')
		#queue_free()
	#
