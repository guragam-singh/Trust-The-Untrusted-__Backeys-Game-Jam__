extends CanvasLayer

@onready var fade_rect: ColorRect = $FadeRect
@onready var door_sound: AudioStreamPlayer2D = $DoorSound

var is_transitioning := false

func _ready() -> void:
	fade_rect.color = Color(0, 0, 0, 0)
	fade_rect.mouse_filter = Control.MOUSE_FILTER_IGNORE

func go_to_car(scene_path: String, spawn_point_name: String) -> void:
	if is_transitioning:
		return
	is_transitioning = true
	door_sound.play()
	var players = get_tree().get_nodes_in_group("player")
	if players.size() > 0:
		players[0].dialogue_open = true
	var tween := create_tween()
	tween.tween_property(fade_rect, "color:a", 1.0, 0.4)
	tween.tween_callback(_swap_scene.bind(scene_path, spawn_point_name))
	tween.tween_property(fade_rect, "color:a", 0.0, 0.4)
	tween.tween_callback(_finish_transition)

func _swap_scene(scene_path: String, spawn_point_name: String) -> void:
	var car_container = get_tree().current_scene.get_node("CarContainer")
	
	for child in car_container.get_children():
		child.queue_free()
	
	var new_car = load(scene_path).instantiate()
	car_container.add_child(new_car)
	
	await get_tree().process_frame
	
	var spawn = new_car.get_node_or_null(spawn_point_name)
	var players = get_tree().get_nodes_in_group("player")
	if spawn and players.size() > 0:
		players[0].global_position = spawn.global_position
	elif spawn == null:
		push_error("Spawn point not found: " + spawn_point_name)

func _finish_transition() -> void:
	is_transitioning = false
	var players = get_tree().get_nodes_in_group("player")
	if players.size() > 0:
		players[0].dialogue_open = false
