extends PointLight2D

@export var min_energy := 0.4
@export var max_energy := 1.0
@export var flicker_speed := 0.15

func _ready() -> void:
	_flicker()

func _flicker() -> void:
	while true:
		energy = randf_range(min_energy, max_energy)
		await get_tree().create_timer(flicker_speed).timeout
