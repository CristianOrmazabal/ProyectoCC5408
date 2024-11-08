extends Node

@export var mainmenu: PackedScene

func go_to_menu():
	if not mainmenu:
		return
	get_tree().change_scene_to_packed(mainmenu)
