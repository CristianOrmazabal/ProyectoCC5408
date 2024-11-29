class_name shadow
extends CharacterBody2D

var gravity
@onready var gravity_mag = Gravity.get_magnitude()

#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0

func _ready() -> void:
	gravity = Gravity.get_gravity() * gravity_mag
	Gravity.gravityG_changed.connect(_on_gravity_changed)
	set_up_direction(Vector2.DOWN)
	rotation_degrees = 180

func _on_gravity_changed() ->void:
	gravity = Gravity.get_gravity() * gravity_mag
	#var inp = Input
	if Input.is_action_just_pressed("Gravity_down"):
		#Gravity.set_gravity(Vector2.DOWN)
		set_up_direction(Vector2.DOWN)
		rotation_degrees = 180
	if Input.is_action_just_pressed("Gravity_up"):
		#Gravity.set_gravity(Vector2.UP)
		set_up_direction(Vector2.UP)
		rotation_degrees = 0
	if Input.is_action_just_pressed("Gravity_left"):
		#Gravity.set_gravity(Vector2.LEFT)
		set_up_direction(Vector2.LEFT)
		rotation_degrees = 270
	if Input.is_action_just_pressed("Gravity_right"):
		#Gravity.set_gravity(Vector2.RIGHT)
		set_up_direction(Vector2.RIGHT)
		rotation_degrees = 90
	

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += -1 * gravity * delta
	

	
	## Handle jump.
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#var direction := Input.get_axis("ui_left", "ui_right")
	#if direction:
		#velocity.x = direction * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
