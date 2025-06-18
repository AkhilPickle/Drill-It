extends Control
@onready var line_edit = $MarginContainer/VBoxContainer/HBoxContainer/LineEdit
var score = Global.score
var playername:String


func _on_score_pressed() -> void:
	Global.score += 10
	score = Global.score
	print(score)
	pass # Replace with function body.


func _on_submit_pressed() -> void:
	await Leaderboards.post_guest_score("drill_it-leaderboard1-uYLm", score, playername)
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_leaderboard_pressed() -> void:
	$"../LeaderboardUI".show()
	pass # Replace with function body.


func _on_close_pressed() -> void:
	$"../LeaderboardUI".hide()
	pass # Replace with function body.


func _on_line_edit_text_changed(new_text: String) -> void:
	playername = line_edit.text
	Global.playername  = playername
	print(playername)
	pass # Replace with function body.
