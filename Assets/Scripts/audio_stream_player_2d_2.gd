extends AudioStreamPlayer2D

@export var min_delay := 8.0
@export var max_delay := 20.0

func _ready() -> void:
	_thunder_loop()

func _thunder_loop() -> void:
	while true:
		await get_tree().create_timer(randf_range(min_delay, max_delay)).timeout
		play()
