extends Node3D

@onready var endstate = false
@onready var shovelhead = preload("res://shovelhead.tscn")
# Called when the node enters the scene tree for the first time.
@onready var timer = $GameDuration
func _ready() -> void:
	Global.score = 0
	Global.miss = 0
	timer.start()
	get_tree().paused = false
	pass
	
func countdown():
	var time_left = timer.time_left
	var second = int(time_left) % 60 + 1
	return [second]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	Global.countdownremaining = "%01d" % countdown()
	if int(Global.countdownremaining) == 0:
		pass

func _on_timer_timeout():
	$Gap.start()
	var shvlhead = shovelhead.instantiate()
	shvlhead.position = Vector3(randf_range(9,14),0.7,randf_range(-4,4))
	add_child(shvlhead)
	pass # Replace with function body.

func _on_game_duration_timeout() -> void:
	endstate = true
	$Gap.stop()
	$Delay.start()
	pass # Replace with function body

func _on_gap_timeout() -> void:
	if endstate == false:
		var shvlhead = shovelhead.instantiate()
		shvlhead.position = Vector3(randf_range(11,14),0.7,randf_range(-5.2,5.2))
		add_child(shvlhead)
		$Gap.start()
	else:
		print("END")
	pass # Replace with function body.


func _on_delay_timeout() -> void:
	for Enemy in get_tree().get_nodes_in_group("Enemy"):
		Enemy.queue_free()
	get_node("End").gameover()
	pass # Replace with function body.
