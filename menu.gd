extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_start_game_button_up() -> void:
	$"../Start".show()
	$"../Settings".hide()
	pass # Replace with function body.

func _on_settings_button_up() -> void:
	$"../Settings".show()
	$"../Start".hide()
	pass


func _on_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.
