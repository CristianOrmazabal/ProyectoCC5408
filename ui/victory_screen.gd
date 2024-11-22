extends CanvasLayer

@onready var next: Button = $VBoxContainer/Next
@onready var select: Button = $VBoxContainer/Select
@onready var menu: Button = $VBoxContainer/Menu
var main = preload("res://scenes/main.tscn")
@export var current_level: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	next.pressed.connect(_on_next_pressed)
	select.pressed.connect(_on_select_pressed)
	menu.pressed.connect(_on_menu_pressed)
	hide()


func _on_next_pressed() -> void:
	get_tree().paused = false
	Gravity.set_gravity(Vector2.DOWN)	
	LevelManager.load_level(current_level+1)
	pass
	
func _on_select_pressed() -> void:
	get_tree().paused = false
	Gravity.set_gravity(Vector2.DOWN)
	LevelManager.got_to_selector()
	pass
	
func _on_menu_pressed() -> void:
	get_tree().paused = false
	Gravity.set_gravity(Vector2.DOWN)
	LevelManager.go_to_menu()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
