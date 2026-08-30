extends Area2D

@export var npc_id: String

var data: Dictionary
var player_in_range := false

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D

func _ready() -> void:
	data = NpcData.ALL_NPCS[npc_id]
	$PromptLabel.visible = false
	anim.play("idle")
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
		InteractionUi.open(npc_id)
