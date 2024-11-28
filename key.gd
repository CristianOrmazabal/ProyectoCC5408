extends Area2D

signal door_key

func _on_body_entered(body):
	if body.get_name() == 'Player' or 'shadow':
		emit_signal('door_key')
		queue_free()
	
