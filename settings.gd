extends Control

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_h_slider_value_changed(value: float) -> void:
	@warning_ignore("narrowing_conversion")
	Global.fov = value
	$MarginContainer/VBoxContainer/Label/Number.text = str(value)
	pass # Replace with function body.


func _on_h_slider_2_value_changed(value: float) -> void:
	Global.sens = value
	$MarginContainer/VBoxContainer/Label2/Number.text = str(value * 1000)
	pass # Replace with function body.
