class_name Player
extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
#var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var gravity = Gravity.gravityG

@onready var animated_sprite = $AnimatedSprite2D

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += gravity * delta * 1000 

	#
#           ROTAR JUGADOR
	if is_on_floor(): #cambio de gravedad solo usable en piso
		if Input.is_action_just_pressed("Gravity_down"):
			Gravity._set_gravity(Vector2.DOWN)
			set_up_direction(Vector2.UP)
			rotation_degrees = 0
			gravity = Gravity._get_gravity()
		if Input.is_action_just_pressed("Gravity_up"):
			Gravity._set_gravity(Vector2.UP)
			set_up_direction(Vector2.DOWN)
			rotation_degrees = 180
			gravity = Gravity._get_gravity()
		if Input.is_action_just_pressed("Gravity_left"):
			Gravity._set_gravity(Vector2.LEFT)
			set_up_direction(Vector2.RIGHT)
			rotation_degrees = 90
			gravity = Gravity._get_gravity()
		if Input.is_action_just_pressed("Gravity_right"):
			Gravity._set_gravity(Vector2.RIGHT)
			set_up_direction(Vector2.LEFT)
			rotation_degrees = 270
			gravity = Gravity._get_gravity()
	
	
	if abs(gravity.x) == 0:
		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY * gravity.y

	# Get the input direction and handle the movement/deceleration.
		var direction = Input.get_axis("move_left", "move_right")
		if direction:
			velocity.x = direction * SPEED
			# Flip the character sprite based on direction
			animated_sprite.flip_h = gravity.y * direction < 0

			# Play run animation
			if is_on_floor():
				animated_sprite.play("run")
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
			# Play idle animation when not moving
			if is_on_floor():
				animated_sprite.play("idle")
				
		# Play jump animation when in the air
		if not is_on_floor() and velocity.y < 0:
			animated_sprite.play("jump")
	else: #gravedad en horizontal
				# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.x = JUMP_VELOCITY * gravity.x
			# Get the input direction and handle the movement/deceleration.
		var direction = Input.get_axis("move_down", "move_up")
		if direction:
			velocity.y = -direction * SPEED
			# Flip the character sprite based on direction
			animated_sprite.flip_h = gravity.x * direction < 0

			# Play run animation
			if is_on_floor():
				animated_sprite.play("run")
		else:
			velocity.y = move_toward(velocity.y, 0, SPEED)
			# Play idle animation when not moving
			if is_on_floor():
				animated_sprite.play("idle")
				
		# Play jump animation when in the air
		if not is_on_floor() and velocity.x < 0:
			animated_sprite.play("jump")
		pass
	move_and_slide()
