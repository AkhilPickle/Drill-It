extends CharacterBody3D

@onready var navagent = $NavigationAgent3D

func ready():
	var randompos := Vector3.ZERO
	randompos.y = randf_range(-5, 5)
	randompos.z = randf_range(0.5, 5)
	navagent.set_target_position(randompos)
	
func _physics_process(_delta: float) -> void:
	var destination = navagent.get_next_path_position()
	var local_destination = destination - global_position
	var direction = local_destination.normalized()

	velocity = direction * 4
	move_and_slide()
