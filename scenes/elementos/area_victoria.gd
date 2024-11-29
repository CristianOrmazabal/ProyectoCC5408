class_name Area_Victoria
extends Area2D

@export var locked: bool = false
@onready var sprite: Sprite2D = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	LevelManager.door_key.connect(_on_key_get)
	body_entered.connect(_on_body_entered)
	if not locked:
		sprite.frame = 4
	else:
		sprite.frame = 0

func _on_key_get() -> void:
	print("key")
	locked = false
	sprite.frame = 4
	pass

func _on_body_entered(body: Node) -> void:
	var player = body as Player
	print(locked)
	if player and not locked:
		print("action")
		action(player)
	
func action(_player: Player) -> void:
	LevelManager.victory.emit()
	print("victoria")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
