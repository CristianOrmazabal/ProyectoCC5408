extends Area2D



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -=1


func _on_body_entered(body):
	if body.name == 'Player':
		get_tree().reload_current_scene()
		Gravity.set_gravity(Vector2.DOWN)
		queue_free()
	else:
		queue_free()
		
		
