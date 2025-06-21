extends CanvasLayer
@onready var stat = $Control/MarginContainer/Panel/MarginContainer/VBoxContainer2/Stat
@onready var nearstat = $Control/MarginContainer/Panel/MarginContainer/VBoxContainer2/NearStat

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func gameover():
	get_tree().paused = true
	self.show()
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED) 
	stat.text = str("Targets Destroyed: " , Global.score)
	nearstat.text = str("Near Misses: " , Global.miss)
	if Global.miss >= 10:
		$Control/MarginContainer/Panel/MarginContainer/VBoxContainer2/Label.show()


func _on_retry_pressed() -> void:
	Global.score = 0
	Global.miss = 0
	get_tree().change_scene_to_file("res://game.tscn")
	print("retry")


func _on_home_screen_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()
	pass # Replace with function body.


func _on_leaderboard_pressed() -> void:
	get_tree().change_scene_to_file("res://leaderboard.tscn")
	pass # Replace with function body.
