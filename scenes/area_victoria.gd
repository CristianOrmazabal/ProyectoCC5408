class_name Area_Victoria
extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)



func _on_body_entered(body: Node) -> void:
	var player = body as Player
	if player:
		action(player)
	
func action(player: Player) -> void:
	LevelManager.victory.emit()
	print("victoria")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
