extends Area2D

@export var target_scene: String
@export var target_spawn_point: String

var player_in_range := false

func _ready() -> void:
	$PromptLabel.visible = false
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = true
		$PromptLabel.visible = true

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = false
		$PromptLabel.visible = false

func _unhandled_input(event: InputEvent) -> void:
	if player_in_range and event.is_action_pressed("interact"):
		SceneTransition.go_to_car(target_scene, target_spawn_point)
