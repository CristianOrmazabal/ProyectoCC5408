extends Node
#hacer señal
signal gravityG_changed()
var gravityG = Vector2(0,1)

func get_gravity()-> Vector2:
	return gravityG

func set_gravity(g: Vector2) -> void:
	gravityG = g
	gravityG_changed.emit()
	
