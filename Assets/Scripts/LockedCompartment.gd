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
	if GameState.has_key_half_b:
		$PromptLabel.visible = false
	elif GameState.has_lantern:
		$PromptLabel.text = "Press E to search"
		$PromptLabel.visible = true
	else:
		$PromptLabel.visible = false 

func _unhandled_input(event: InputEvent) -> void:
	if not player_in_range or not event.is_action_pressed("interact"):
		return
	if GameState.has_key_half_b:
		return 
	if not GameState.has_lantern:
		return 

	GameState.has_key_half_b = true
	$PromptLabel.text = "Found a key fragment."
	$PromptLabel.visible = true
	await get_tree().create_timer(1.5).timeout
	$PromptLabel.visible = false
