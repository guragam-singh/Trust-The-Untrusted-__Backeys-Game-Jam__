extends Control

@onready var video: VideoStreamPlayer = $VideoPlayer
@onready var fade_rect: ColorRect = $FadeRect

const FADE_DURATION := 0.8

func _ready() -> void:
	fade_rect.color = Color(0, 0, 0, 1)
	video.finished.connect(_on_video_finished)
	_fade_in_then_play()

func _fade_in_then_play() -> void:
	var tween := create_tween()
	tween.tween_property(fade_rect, "color:a", 0.0, FADE_DURATION)
	await tween.finished
	video.play()

func _on_video_finished() -> void:
	var tween := create_tween()
	tween.tween_property(fade_rect, "color:a", 1.0, FADE_DURATION)
	await tween.finished
	get_tree().change_scene_to_file("res://Assets/Scenes/Main.tscn")
