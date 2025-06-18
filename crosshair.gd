extends CenterContainer

@export var DOT_RAD : float = 1.0
@export var DOT_COL : Color = Color.WHITE
@export var CROSS_LINE : Array[Line2D]
@export var PLAYER : CharacterBody3D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	queue_redraw()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

func _draw():
	draw_circle(Vector2(0,0),DOT_RAD,DOT_COL) 
