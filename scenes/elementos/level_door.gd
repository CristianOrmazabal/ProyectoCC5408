class_name puerta_nivel
extends Area2D
#puerta selectora de nivel

@export var level: int
#var status
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

var inside = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exit)
	if LevelManager.is_unlocked(level):
		animated_sprite_2d.set_frame(5)
	else:
		animated_sprite_2d.set_frame(1)
	

func _on_body_exit(body: Node) -> void:
	var player = body as Player
	if player:
		inside = false

func _on_body_entered(body: Node) -> void:
	var player = body as Player
	if player:
		inside = true
		#action(player)
	
func _process(_delta: float) -> void:
	if inside: #probablemente no se haga asi
		if Input.is_action_just_pressed("ui_accept"):
			Gravity.set_gravity(Vector2.DOWN)
			if LevelManager.is_unlocked(level):
				LevelManager.current_level = level
				LevelManager.load_level(level)
			else:
				print("nivel no desbloqueado o no existe")
				pass
	
#func action(player: Player) -> void:
	#print("selecciona nivel")
