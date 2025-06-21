extends Control
@onready var username: LineEdit = $CreateContainer/CreateUser
@onready var password: LineEdit = $CreateContainer/CreatePass
@onready var enable_verification: CheckBox = $CreateContainer/CheckBox
@onready var validation_label: Label = $CreateContainer/Label
@onready var email: LineEdit = $CreateContainer/CreateEmail

func _process(_delta: float) -> void:
	if username.text.is_empty():
		$CreateContainer/CreateSubmit.hide()
	if password.text.is_empty():
		$CreateContainer/CreateSubmit.hide()
	else: 
		if $CreateContainer/CreatePass.text == $CreateContainer/CreateConfirmPass.text:
			$CreateContainer/CreateSubmit.show()
		else: 
			$CreateContainer/CreateSubmit.hide()


func _on_create_submit_pressed() -> void:
	var res = await Talo.player_auth.register(username.text, password.text, email.text, enable_verification.button_pressed)
	if res != OK:
		match Talo.player_auth.last_error.get_code():
			TaloAuthError.ErrorCode.IDENTIFIER_TAKEN:
				validation_label.text = "Username is already taken"
			_:
				validation_label.text = Talo.player_auth.last_error.get_string()
	else:
		$".".hide()
		$"../Login".show()
	pass # Replace with function body.

func _on_check_box_pressed() -> void:
	pass # Replace with function body.
