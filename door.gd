extends Node2D

var key = false
var door_opened = false  # Bandera para saber si la puerta ya fue abierta

func _on_area_2d_2_body_entered(body):
	if body.get_name() == 'Player' and key == true and not door_opened:
		# Verificar si los nodos existen antes de eliminarlos
		if $staticbody/Sprite:
			$staticbody/Sprite.queue_free()
		if $staticbody/CollisionShape2D:
			$staticbody/CollisionShape2D.queue_free()
		# Iniciar la animación de la puerta y marcarla como abierta
		$staticbody/AnimatedSprite2D.play("open")
		door_opened = true  # Marcar que la puerta ya fue abierta

func _on_key_door_key():
	key = true
