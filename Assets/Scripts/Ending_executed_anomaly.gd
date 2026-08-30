extends Control

@export var narration_lines: Array[String] = []
@export var final_voice_line: String = "Everything is fine. Everything is under control."
@export var line_display_delay := 2.5
@export var ending_music: AudioStream

@onready var narration_label: Label = $NarrationLabel
@onready var score_label: Label = $ScoreLabel
@onready var restart_button: Button = $RestartButton
@onready var menu_button: Button = $MenuButton
@onready var music_player: AudioStreamPlayer2D = $EndingMusic
@onready var anomaly_label: Label = $AnomalyLabel

func _ready() -> void:
	restart_button.visible = false
	menu_button.visible = false
	restart_button.pressed.connect(_on_restart_pressed)
	menu_button.pressed.connect(_on_menu_pressed)
	score_label.text = "%d" % GameState.get_score()
	var anomaly_count := GameState.anomalies_helped.size()
	anomaly_label.text = "%d " % [
		anomaly_count,
	]
	narration_label.text = ""

	if ending_music:
		music_player.stream = ending_music
		AudioFader.fade_in(music_player, -6.0, 2.0)

	_play_narration()

func _play_narration() -> void:
	for line in narration_lines:
		narration_label.text = line
		await get_tree().create_timer(line_display_delay).timeout

	narration_label.text = final_voice_line
	await get_tree().create_timer(line_display_delay).timeout

	restart_button.visible = true
	menu_button.visible = true

func _on_restart_pressed() -> void:
	restart_button.disabled = true
	menu_button.disabled = true
	await AudioFader.fade_out(music_player, 0.8)
	GameState.reset()
	get_tree().change_scene_to_file("res://Assets/Scenes/Main.tscn")

func _on_menu_pressed() -> void:
	restart_button.disabled = true
	menu_button.disabled = true
	await AudioFader.fade_out(music_player, 0.8)
	GameState.reset()
	get_tree().change_scene_to_file("res://Assets/Scenes/MainMenu.tscn")
