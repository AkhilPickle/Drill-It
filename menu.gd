extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = false
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _on_start_game_button_up() -> void:
	$"../Settings".hide()
	get_tree().change_scene_to_file("res://game.tscn")
	pass # Replace with function body.

func _on_settings_button_up() -> void:
	$"../Settings".show()
	$".".hide()
	pass


func _on_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_leaderboard_pressed() -> void:
	get_tree().change_scene_to_file("res://leaderboard.tscn")
	pass # Replace with function body.
