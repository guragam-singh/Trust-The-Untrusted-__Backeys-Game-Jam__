extends ColorRect

@export var min_delay := 6.0
@export var max_delay := 18.0
@export var thunder_sound_delay := 0.4
@export var thunder_player: AudioStreamPlayer2D

func _ready() -> void:
	color = Color(0.85, 0.9, 1.0, 0)
	mouse_filter = Control.MOUSE_FILTER_IGNORE
	_flash_loop()

func _flash_loop() -> void:
	while true:
		await get_tree().create_timer(randf_range(min_delay, max_delay)).timeout
		_do_flash()

func _do_flash() -> void:
	var tween := create_tween()
	tween.tween_property(self, "color:a", 0.35, 0.05)
	tween.tween_property(self, "color:a", 0.05, 0.15)
	if randf() < 0.5:
		tween.tween_property(self, "color:a", 0.25, 0.04)
		tween.tween_property(self, "color:a", 0.0, 0.2)
	else:
		tween.tween_property(self, "color:a", 0.0, 0.25)

	await get_tree().create_timer(thunder_sound_delay).timeout
	if thunder_player and not thunder_player.playing:
		thunder_player.play()
