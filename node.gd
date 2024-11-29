extends Node
#levelManager
@export var mainmenu: PackedScene
@export var level_selector: PackedScene
signal victory()
signal door_key()
signal muerte()
@export var levels: Array[PackedScene]
var unlocked = [0,1,2,3,4]
const max_level = 5
var current_level: int = 0
#const LEVEL_SELECTOR = preload("res://ui/LevelSelector.tscn")
func go_to_menu():
	if not mainmenu:
		return
	get_tree().change_scene_to_packed(mainmenu)

func is_unlocked(level_id: int):
	return (level_id in unlocked)


func go_to_selector() ->void:
	if not level_selector:
		return
	get_tree().change_scene_to_packed(level_selector)
	
func unlock_level(level_id: int) -> void:
	if level_id <= max_level and (level_id not in unlocked):
		print(level_id, "desbloqueado")
		unlocked.append(level_id)
				

func load_next_level() -> void:
	#unlock_level(current_level+1)
	load_level(current_level+1)

func load_level(level_id: int) -> void:
	print("cargando nivel",level_id)
	#print(level_id in levels)
	if level_id >= max_level or level_id < 0: #id invalida
	#if(level_id not in levels): bloque viejo
		if not mainmenu:
			return
		get_tree().change_scene_to_packed(mainmenu)
		return
	if levels[level_id]:
		var level = (levels[level_id])
		if not level:
			return
		current_level = level_id
		get_tree().change_scene_to_packed(level)
		
