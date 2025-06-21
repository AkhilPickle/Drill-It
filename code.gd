extends Control
@onready var code: LineEdit = $CodeContainer/CodeCode
@onready var validation_label: Label = $CodeContainer/Label

func _on_code_submit_pressed() -> void:
	var res := await Talo.player_auth.verify(code.text)
	if res != OK:
		match Talo.player_auth.last_error.get_code():
			TaloAuthError.ErrorCode.INVALID_CREDENTIALS:
				validation_label.text = "Verification code is incorrect"
			_:
				validation_label.text = Talo.player_auth.last_error.get_string()
	pass # Replace with function body.
