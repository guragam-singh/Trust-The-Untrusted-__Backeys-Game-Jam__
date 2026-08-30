extends Node

var npcs_helped: Array[String] = []
var anomalies_helped: Array[String] = []
var npc_states: Dictionary = {}

var has_lantern: bool = false
var has_key_half_a: bool = false
var has_key_half_b: bool = false

func _ready() -> void:
	for npc_id in NpcData.ALL_NPCS.keys():
		npc_states[npc_id] = "unmet"

func mark_helped(npc_id: String) -> void:
	if npc_states.get(npc_id) == "helped":
		return 
	npc_states[npc_id] = "helped"
	var data = NpcData.ALL_NPCS[npc_id]
	if data.is_anomaly:
		anomalies_helped.append(npc_id)
	else:
		npcs_helped.append(npc_id)
	_apply_rewards(data)

func mark_refused(npc_id: String) -> void:
	if npc_states.get(npc_id) == "unmet":
		npc_states[npc_id] = "refused"

func _apply_rewards(data: Dictionary) -> void:
	if data.get("give_item", "") == "lantern":
		has_lantern = true
	if data.get("give_key_half", "") == "a":
		has_key_half_a = true
	if data.get("give_key_half", "") == "b":
		has_key_half_b = true

func has_full_key() -> bool:
	return has_key_half_a and has_key_half_b

func get_score() -> int:
	return npcs_helped.size()

func get_ending() -> String:
	if anomalies_helped.size() > 0:
		return "executed_anomaly"
	if get_score() < 3:
		return "executed_insufficient"
	if get_score() >= 6:
		return "best_ending"
	return "standard_ending"
func reset() -> void:
	npcs_helped.clear()
	anomalies_helped.clear()
	npc_states.clear()
	has_lantern = false
	has_key_half_a = false
	has_key_half_b = false
	for npc_id in NpcData.ALL_NPCS.keys():
		npc_states[npc_id] = "unmet"
