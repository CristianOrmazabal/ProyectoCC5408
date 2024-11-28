extends CharacterBody2D

const SPEED = 75

@onready var animated_sprite = $AnimatedSprite2D

var direction = 1
var health = 1
const INVERTED_GRAVITY = -600.0  # Ajusta la intensidad según tu juego

func add_gravity(delta):
	# Aplica la gravedad invertida
	if not is_on_ceiling():  # Verificar si está en el techo
		velocity.y += INVERTED_GRAVITY * delta

func move_enemy():
	velocity.x = SPEED * direction
	# Ajustar la escala del sprite según la dirección
	if direction == 1:
		animated_sprite.flip_h = false  # No invertir horizontalmente
	elif direction == -1:
		animated_sprite.flip_h = true  # Invertir horizontalmente

func reverse_direction():
	# Cambiar dirección al encontrar una pared
	if is_on_wall():
		direction = -direction

func _physics_process(delta: float) -> void:
	add_gravity(delta)
	move_enemy()
	move_and_slide()  # No necesita argumentos
	reverse_direction()

func _on_area_2d_body_entered(body):
	if body.name == 'Player':
		get_tree().reload_current_scene()
		queue_free()
