extends CanvasLayer
var score = Global.score
var playername = Global.playername

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_tree().paused = false
	if Global.finished == true:
		await Leaderboards.post_guest_score("drill_it-leaderboard2-65fB", score, playername)
		Global.finished = false
	else:
		pass
	pass # Replace with function body.


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://menu.tscn")
	pass # Replace with function body.


func _on_reload_pressed() -> void:
	get_tree().reload_current_scene()
	pass # Replace with function body.
