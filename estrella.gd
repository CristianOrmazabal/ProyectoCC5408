extends CharacterBody2D

const SPEED = 75

@onready var animated_sprite = $AnimatedSprite2D 

var direction = 1
var health = 1

func add_gravity(delta):
	if not is_on_floor():
		velocity += get_gravity() * delta
		
func move_enemy():
	velocity.x = SPEED * direction
	if direction == 1:
		animated_sprite.scale.x = -1
	elif direction == -1:
		animated_sprite.scale.x = 1

func reverse_direction():
	if is_on_wall():
		direction = -direction

func _physics_process(delta:float) -> void:
	add_gravity(delta)
	move_enemy()
	move_and_slide()
	reverse_direction()


func _on_area_2d_body_entered(body):
	if body.name == 'Player':
		get_tree().reload_current_scene()
		queue_free()
