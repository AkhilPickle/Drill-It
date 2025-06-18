extends Area3D


@onready var shot_anim = $ShovelAnim
var health := 1

func _ready():
	print(get_path())
func _process(_delta):  
	if health <= 0:
		shot_anim.play("Shot")
		await shot_anim.animation_finished
		Global.score += 1
		free()
	
		
