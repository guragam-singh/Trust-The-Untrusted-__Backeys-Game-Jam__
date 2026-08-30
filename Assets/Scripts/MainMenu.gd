extends Control

@onready var start_button: Button = $StartButton
@onready var quit_button: Button = $QuitButton
@onready var video: VideoStreamPlayer = $VideoBackground
@onready var menu_music: AudioStreamPlayer2D = $MenuMusic

func _ready() -> void:
	video.play()
	AudioFader.fade_in(menu_music, -8.0, 1.5) 
	start_button.pressed.connect(_on_start_pressed)
	if quit_button:
		quit_button.pressed.connect(_on_quit_pressed)

func _on_start_pressed() -> void:
	AudioFader.fade_out(menu_music, 0.8)
	GameState.reset()
	get_tree().change_scene_to_file("res://Assets/Scenes/AnnouncementScene.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
