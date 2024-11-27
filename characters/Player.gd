class_name Player
extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@onready var ray_cast_2d_up: RayCast2D = %RayCast2D_UP
@onready var ray_cast_2d_up_left: RayCast2D = %RayCast2D_UP_LEFT
@onready var ray_cast_2d_up_right: RayCast2D = %RayCast2D_UP_RIGHT
@onready var ray_cast_2d_right: RayCast2D = %RayCast2D_RIGHT1
@onready var ray_cast_2d_left: RayCast2D = %RayCast2D_LEFT1
@onready var ray_cast_2d_right_2: RayCast2D = %RayCast2D_RIGHT2
@onready var ray_cast_2d_left_2: RayCast2D = %RayCast2D_LEFT2
@onready var ray_cast_2d_right_3: RayCast2D = %RayCast2D_RIGHT3
@onready var ray_cast_2d_left_3: RayCast2D = %RayCast2D_LEFT3



@onready var gravity = Gravity.get_gravity()
@onready var gravity_mag := Gravity.get_magnitude()
@onready var animated_sprite = $AnimatedSprite2D

func _ready() -> void:
	Gravity.gravityG_changed.connect(_on_gravity_changed)
	
func _on_gravity_changed() ->void:
	gravity = Gravity.get_gravity()

func _physics_process(delta):
	#var ray_up = ray_cast_2d_up.get_collider()
	var rays = {
		"up": ray_cast_2d_up,
		"left1": ray_cast_2d_left,
		"up_left": ray_cast_2d_up_left,
		"right1": ray_cast_2d_right,
		"up_right": ray_cast_2d_up_right,
		"left2": ray_cast_2d_left_2,
		"left3": ray_cast_2d_left_3,
		"right2": ray_cast_2d_right_2,
		"right3": ray_cast_2d_right_3
	}
	for key in rays:		
		#print(key)	
		#print(rays[key])
		if rays[key]:
			var ray = rays[key]
			var col = ray as RayCast2D 
			var rgd = col.get_collider() as RigidBody2D
			var norm = col.get_collision_normal()
			if rgd:
				#rgd.apply_central_impulse(global_position.direction_to(rgd.global_position)*500)
				rgd.apply_central_impulse(-norm*15)
	#var col = get_slide_collision_count()
	#for i in col:
		#var collision = get_slide_collision(i)
		#var rgd = collision.get_collider() as RigidBody2D
		#if rgd:
			#rgd.apply_central_impulse(global_position.direction_to(rgd.global_position)*500)
		
	# Add the gravity.
	if not is_on_floor():
		velocity += gravity*gravity_mag*delta

	#
#           ROTAR JUGADOR
	if is_on_floor(): #cambio de gravedad solo usable en piso{
		#var GlobalG = ["Gravity_down","Gravity_up","Gravity_left",""]
		#var inp = Input
		if Input.is_action_just_pressed("Gravity_down"):
			Gravity.set_gravity(Vector2.DOWN)
			set_up_direction(Vector2.UP)
			rotation_degrees = 0
		if Input.is_action_just_pressed("Gravity_up"):
			Gravity.set_gravity(Vector2.UP)
			set_up_direction(Vector2.DOWN)
			rotation_degrees = 180
		if Input.is_action_just_pressed("Gravity_left"):
			Gravity.set_gravity(Vector2.LEFT)
			set_up_direction(Vector2.RIGHT)
			rotation_degrees = 90
		if Input.is_action_just_pressed("Gravity_right"):
			Gravity.set_gravity(Vector2.RIGHT)
			set_up_direction(Vector2.LEFT)
			rotation_degrees = 270
	
		
	if abs(gravity.x) == 0: #gravedadd vertical
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
		
	move_and_slide()
