extends Control
@onready var username: LineEdit = $CreateContainer/CreateUser
@onready var password: LineEdit = $CreateContainer/CreatePass
@onready var enable_verification: CheckBox = $CreateContainer/CheckBox
@onready var email: LineEdit = $CreateContainer/CreateUserEmail
@onready var validation_label: Label = $CreateContainer/Label


func _on_create_submit_pressed() -> void:
	var res = await Talo.player_auth.register(username.text, password.text, email.text, enable_verification.button_pressed)
	if res != OK:
		match Talo.player_auth.last_error.get_code():
			TaloAuthError.ErrorCode.IDENTIFIER_TAKEN:
				validation_label.text = "Username is already taken"
			_:
				validation_label.text = Talo.player_auth.last_error.get_string()
	pass # Replace with function body.


func _on_check_box_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		$CreateContainer/CreateUserEmail.show()
	else: 
		$CreateContainer/CreateUserEmail.hide()
	pass # Replace with function body.
