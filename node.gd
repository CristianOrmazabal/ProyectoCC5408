extends Node
#levelManager
@export var mainmenu: PackedScene
@export var level_selector: PackedScene
signal victory()
signal door_key()
@export var levels = {
	1:"res://scenes/mapa_1.tscn"
}
var unlocked = [1]
const max_level = 1
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
				

func load_level(level_id: int) -> void:
	print(level_id)
	print(level_id in levels)
	if(level_id not in levels):
		if not mainmenu:
			return
		get_tree().change_scene_to_packed(mainmenu)
		return
	if levels[level_id]:
		var level = load(levels[level_id])
		if not level:
			return
		get_tree().change_scene_to_packed(level)
		
