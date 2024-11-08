extends Control

@onready var start = $VBoxContainer/Start
@onready var creditos = $VBoxContainer/Creditos
@onready var quit_game = $"VBoxContainer/Quit Game"
var main = preload("res://scenes/main.tscn")
@export var mainmenu: PackedScene


#Creamos los Botones
func _ready() -> void:
	start.pressed.connect(_on_start_pressed)
	quit_game.pressed.connect(func(): get_tree().quit())
	
func _on_start_pressed() -> void: #Start
	get_tree().change_scene_to_packed(main)
	
