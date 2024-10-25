extends Node
#señal de cambio de gravedad
signal gravityG_changed()
#var gravityG = Vector2(0,1)
#valores de gravedad
var gravity_vector : Vector2 = ProjectSettings.get_setting("physics/2d/default_gravity_vector")
var gravity_magnitude : int = ProjectSettings.get_setting("physics/2d/default_gravity")

func get_gravity()-> Vector2:
	#print("projectg = ",gravity_vector)
	#print(gravity_magnitude)
	return gravity_vector #*gravity_magnitude

func get_magnitude()->int:
	return gravity_magnitude

func get_gravity_dir() -> Vector2:
	return gravity_vector


func set_gravity(g: Vector2) -> void:
	print("set grav to ",g)
	PhysicsServer2D.area_set_param(get_viewport().find_world_2d().space,
							PhysicsServer2D.AREA_PARAM_GRAVITY_VECTOR, g)
	gravity_vector = g
	gravityG_changed.emit()	

#func gravity_down()->void:
	#set_gravity(Vector2.DOWN)
#func gravity_up()->void:
	#set_gravity(Vector2.UP)
#func gravity_left()->void:
	#set_gravity(Vector2.LEFT)
#func gravity_right()->void:
	#set_gravity(Vector2.RIGHT)
