extends Area2D

var player_in_range := false

func _ready() -> void:
	$PromptLabel.visible = false
	body_entered.connect(_on_body_entered)
	body_exited.connect(_on_body_exited)

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = true
		_update_prompt()

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("player"):
		player_in_range = false
		$PromptLabel.visible = false

func _update_prompt() -> void:
	if GameState.has_full_key():
		$PromptLabel.text = "Press E to leave"
	else:
		$PromptLabel.text = "The door won't budge. You need something more."
	$PromptLabel.visible = true

func _unhandled_input(event: InputEvent) -> void:
	if not player_in_range or not event.is_action_pressed("interact"):
		return

	if not GameState.has_full_key():
		return

	var ending := GameState.get_ending()
	get_tree().change_scene_to_file("res://Assets/Scenes/Ending_%s.tscn" % ending)
