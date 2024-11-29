extends Node

@onready var llave_sound = $LlaveSound
@onready var muerte_sound = $MuerteSound

# Called when the node enters the scene tree for the first time.
func _ready():
	LevelManager.door_key.connect(_on_key_pickup)
	LevelManager.muerte.connect(_on_muerte)

func _on_key_pickup():
	llave_sound.play()

func _on_muerte():
	muerte_sound.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
