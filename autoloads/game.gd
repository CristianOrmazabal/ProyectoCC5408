extends Node

var valid_checkpoint := false
var last_checkpoint: Vector2


func get_data() -> Dictionary:
	return {
		"valid_checkpoint": valid_checkpoint,
		"last_checkpoint_x": last_checkpoint.x,
		"last_checkpoint_y": last_checkpoint.y
	}

func load_data(dict: Dictionary) -> void:
	valid_checkpoint = dict["valid_checkpoint"]
	last_checkpoint.x = dict["last_checkpoint_x"]
	last_checkpoint.y = dict["last_checkpoint_y"]


func save_game() -> void:
	var data = JSON.stringify(get_data())
	var file = FileAccess.open_encrypted_with_pass("user://game.data", FileAccess.WRITE, "1234")
	file.store_string(data)
	file.close()



func load_game() -> void:
	var file = FileAccess.open_encrypted_with_pass("user://game.data", FileAccess.READ, "1234")
	var dict = JSON.parse_string(file.get_as_text())
	load_data(dict)


#
## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
