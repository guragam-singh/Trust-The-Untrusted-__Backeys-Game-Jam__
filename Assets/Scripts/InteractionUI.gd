extends CanvasLayer

var current_npc_id: String

func _ready() -> void:
	visible = false
	$Panel/HelpButton.pressed.connect(_on_help_pressed)
	$Panel/RefuseButton.pressed.connect(_on_refuse_pressed)

func open(npc_id: String) -> void:
	$InteractSound.play()
	current_npc_id = npc_id
	var data = NpcData.ALL_NPCS[npc_id]
	$Panel/NameLabel.text = data.name
	$Panel/AskLabel.text = data.ask_text + "\n[" + data.tell_text + "]"
	visible = true
	_set_player_dialogue_state(true)

func _on_help_pressed() -> void:
	GameState.mark_helped(current_npc_id)
	close()

func _on_refuse_pressed() -> void:
	GameState.mark_refused(current_npc_id)
	close()

func close() -> void:
	visible = false
	_set_player_dialogue_state(false)

func _set_player_dialogue_state(value: bool) -> void:
	var players = get_tree().get_nodes_in_group("player")
	if players.size() > 0:
		players[0].dialogue_open = value
