extends Node

var gravityG = Vector2(0,1)

func _get_gravity()-> Vector2:
	return gravityG

func _set_gravity(g: Vector2) -> void:
	gravityG = g
	
