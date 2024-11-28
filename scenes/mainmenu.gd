extends Control

@onready var start = $Start
@onready var credits = $Credits
@onready var quit_game = $"Quit Game"

@export var creditos: PackedScene
#var creditos = preload("res://scenes/creditos.tscn")
var main = preload("res://scenes/main.tscn")
@export var mainmenu: PackedScene




#Creamos los Botones
func _ready() -> void:
	start.pressed.connect(_on_start_pressed)
	quit_game.pressed.connect(func(): get_tree().quit())
	
func _on_start_pressed() -> void: #Start
	get_tree().change_scene_to_packed(main)
	
func _on_credits_pressed() -> void: #Credits
	get_tree().change_scene_to_file("res://scenes/creditos.tscn")
