class_name Box
extends RigidBody2D
var grav
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#set_constant_force(Vector2.UP*900)
	grav = Gravity.get_gravity()
	Gravity.gravityG_changed.connect(_on_gravity_changed)
	
	
func _physics_process(delta: float) -> void:
	pass
	#print(constant_force)

func _on_gravity_changed() -> void:
	grav = Gravity.get_gravity()
	#set_constant_force(Vector2(0,0))
	#set_constant_force(grav*1000)
	
