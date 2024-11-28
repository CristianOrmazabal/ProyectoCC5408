extends CharacterBody2D

const SPEED = 75

@onready var animated_sprite = $AnimatedSprite2D

var direction = 1
var health = 1
var gravity = Vector2(0, -1)  # Dirección inicial de gravedad (invertida)
var gravity_mag = 600.0  # Magnitud inicial de gravedad

func _ready() -> void:
	# Conectar a la señal que informa cambios en la gravedad
	Gravity.gravityG_changed.connect(_on_gravity_changed)
	# Obtener valores iniciales de gravedad
	gravity = Gravity.get_gravity()
	gravity_mag = Gravity.get_magnitude()

func _on_gravity_changed() -> void:
	# Actualizar gravedad dinámica cuando cambie en el sistema global
	gravity = Gravity.get_gravity()
	gravity_mag = Gravity.get_magnitude()

func add_gravity(delta):
	# Aplicar gravedad en la dirección actual
	velocity += gravity * gravity_mag * delta

func move_enemy():
	# Movimiento horizontal o vertical del enemigo según la dirección de la gravedad
	if abs(gravity.y) > 0:  # Gravedad vertical
		velocity.x = SPEED * direction
	else:  # Gravedad horizontal
		velocity.y = SPEED * direction

	# Ajustar la orientación del sprite según la dirección de la gravedad y del movimiento
	if gravity == Vector2(0, -1):  # Gravedad hacia arriba
		animated_sprite.rotation_degrees = 180
		animated_sprite.flip_h = direction > 0
		animated_sprite.flip_v = false
	elif gravity == Vector2(0, 1):  # Gravedad hacia abajo
		animated_sprite.rotation_degrees = 0
		animated_sprite.flip_h = direction < 0
		animated_sprite.flip_v = false
	elif gravity == Vector2(1, 0):  # Gravedad hacia la derecha
		animated_sprite.rotation_degrees = 270
		animated_sprite.flip_h = false
		animated_sprite.flip_v = direction > 0
	elif gravity == Vector2(-1, 0):  # Gravedad hacia la izquierda
		animated_sprite.rotation_degrees = 270
		animated_sprite.flip_h = false
		animated_sprite.flip_v = direction < 0

	# Reproducir la animación de correr si hay movimiento
	if velocity.length() > 0:  # Comprobar si el enemigo se está moviendo
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")

func reverse_direction():
	# Cambiar de dirección al chocar con una pared o piso/techo, dependiendo de la gravedad
	if abs(gravity.y) > 0:  # Gravedad vertical
		if is_on_wall():
			direction = -direction
	else:  # Gravedad horizontal
		if is_on_floor():
			direction = -direction

func _physics_process(delta: float) -> void:
	add_gravity(delta)
	move_enemy()
	move_and_slide()
	reverse_direction()

func _on_area_2d_body_entered(body):
	if body.name == 'Player':
		get_tree().reload_current_scene()
		queue_free()
