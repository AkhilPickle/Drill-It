extends Control
@onready var timer = $GameCountdown
@onready var label = $Timer1
@onready var crosshair = $CenterContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.start()
	crosshair.hide()
	pass # Replace with function body

func countdown():
	var time_left = timer.time_left
	var second = int(time_left) % 60 + 1
	return [second]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	label.text = "%01d" % countdown()

func _on_timer_timeout() -> void:
	label.hide()
	crosshair.show()
	pass # Replace with function body.
