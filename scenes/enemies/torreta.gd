extends Area2D

@export var bullet : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func shoot():
	var newbullet = bullet.instantiate()
	newbullet.global_position = $spawnbullet.global_position
	get_parent().add_child(newbullet)


func _on_timer_timeout():
	shoot()
