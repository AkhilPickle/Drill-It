extends Button


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_pressed():
	Global.mode = 1
	print(Global.mode)
	get_tree().change_scene_to_file("res://game.tscn")
	pass # Replace with function body.
