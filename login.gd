extends Control

signal verification_required

@onready var username: LineEdit = $LoginContainer/LoginUser
@onready var password: LineEdit = $LoginContainer/LoginPass
@onready var validation_label: Label = $LoginContainer/Label


func _process(_delta: float) -> void:
	if username.text.is_empty():
		$LoginContainer/LoginSubmit.hide()
	if password.text.is_empty():
		$LoginContainer/LoginSubmit.hide()
	else: 
		$LoginContainer/LoginSubmit.show()
func _on_login_submit_pressed() -> void:	
	var res := await Talo.player_auth.login(username.text, password.text)
	match res:
			Talo.player_auth.LoginResult.FAILED:
				match Talo.player_auth.last_error.get_code():
					TaloAuthError.ErrorCode.INVALID_CREDENTIALS:
						validation_label.text = "Username or password is incorrect"
					_:
						validation_label.text = Talo.player_auth.last_error.get_string()
			Talo.player_auth.LoginResult.VERIFICATION_REQUIRED:
				verification_required.emit()
			Talo.player_auth.LoginResult.OK:
				Global.playername = username.text
				print(Global.playername)
				get_tree().change_scene_to_file("res://menu.tscn")
				pass
