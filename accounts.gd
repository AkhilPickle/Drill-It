extends Control

var user_email = ""
var user_password = ""

func _ready() -> void:
	pass # Replace with function body.


func _on_login_pressed() -> void:
	$ButtonsContainer.hide()
	$Login.show()
	pass # Replace with function body.


func _on_login_back_pressed() -> void:
	$ButtonsContainer.show()
	$Login.hide()
	pass # Replace with function body.


func _on_sign_up_pressed() -> void:
	$ButtonsContainer.hide()
	$Register.show()
	pass # Replace with function body.


func _on_create_back_pressed() -> void:
	$Register.hide()
	$ButtonsContainer.show()
	pass # Replace with function body.
