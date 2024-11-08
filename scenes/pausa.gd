extends CanvasLayer

@onready var resume = $VBoxContainer/Resume
@onready var restart = $VBoxContainer/Restart
@onready var main_menu = $VBoxContainer/MainMenu
@onready var quit_game = $VBoxContainer/QuitGame
#@export var mainmenu: PackedScene
var main = preload("res://scenes/main.tscn")
#var mainmenu = preload("res://scenes/mainmenu.tscn")

func _ready() -> void:
	quit_game.pressed.connect(get_tree().quit)
	resume.pressed.connect(_on_resume_pressed)
	restart.pressed.connect(_on_restart_pressed)
	main_menu.pressed.connect(_on_main_menu_pressed)
	hide()
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Pause"):
		visible = not visible
		get_tree().paused = visible
 
func _on_resume_pressed() -> void:
	hide()
	get_tree().paused = false

func _on_restart_pressed() -> void:
	get_tree().paused = false
	Gravity.set_gravity(Vector2.DOWN)
	hide()
	get_tree().reload_current_scene()

func _on_main_menu_pressed() -> void:
	get_tree().paused = false
	Gravity.set_gravity(Vector2.DOWN)
	LevelManager.go_to_menu()
