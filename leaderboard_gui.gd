extends Control
var score = Global.score



func _on_score_pressed() -> void:
	Global.score += 10
	score = Global.score
	print(score)
	pass # Replace with function body.


func _on_submit_pressed() -> void:
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_leaderboard_pressed() -> void:
	$"../LeaderboardUI".show()
	pass # Replace with function body.


func _on_close_pressed() -> void:
	$"../LeaderboardUI".hide()
	pass # Replace with function body.
