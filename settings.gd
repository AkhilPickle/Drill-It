extends Control
@onready var resolution = $MarginContainer/VBoxContainer/HBoxContainer/Resolution
@onready var windowtype = $MarginContainer/VBoxContainer/WindowType
@onready var timer = $"MarginContainer/VBoxContainer/HBoxContainer/Confirm Resolution/Timer"
var confirm = false

const WINDOW_TYPE : Array[String] = [
	"Full Screen",
	"Window Mode",
	"Borderless Window",
	"Borderless Full Screen"
]

const RESOLUTION : Dictionary = {
	"1152x648": Vector2i(1152, 648),
	"3840x2160": Vector2i(3840,2160),
	"2560x1440": Vector2i(2560,1440),
	"1920x1080": Vector2i(1920,1080),
	"1366x768": Vector2i(1366,768),
	"1280x720": Vector2i(1280,720),
	"1440x900": Vector2i(1440,900),
	"1600x900": Vector2i(1600,900),
	"1024x600": Vector2i(1024,600),
	"800x600": Vector2i(800,600)
}

func _ready():
	add_windowmodes()
	add_resolutions()
	resolution.item_selected.connect(on_resolution_mode_selected)
	windowtype.item_selected.connect(on_window_mode_selected)

func add_windowmodes() -> void:
	for i in WINDOW_TYPE:
		windowtype.add_item(i)

func add_resolutions() -> void:
	for resolution_size_text in RESOLUTION:
		resolution.add_item(resolution_size_text)

func on_resolution_mode_selected(index: int) -> void:
	DisplayServer.window_set_size(RESOLUTION.values()[index])
	timer.start()

func on_window_mode_selected(index : int) -> void:
	match index:
		0: #Fullscreen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		1: #Window Mode
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		2: #Borderless  Window
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
		3: #Borderless Full Screen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)

func _on_h_slider_value_changed(value: float) -> void:
	@warning_ignore("narrowing_conversion")
	Global.fov = value
	$MarginContainer/VBoxContainer/Label/Number.text = str(value)
	pass # Replace with function body.


func _on_h_slider_2_value_changed(value: float) -> void:
	Global.sens = value
	$MarginContainer/VBoxContainer/Label2/Number.text = str(value * 1000)
	pass # Replace with function body.


func _on_button_pressed() -> void:
	$".".hide()
	$"../Menu GUI".show()
	pass # Replace with function body.


func _on_confirm_resolution_pressed() -> void:
	confirm = true
	pass # Replace with function body.


func _on_timer_timeout() -> void:
	if confirm == false:
		DisplayServer.window_set_size(RESOLUTION.values()[0])
	else:
		pass
