class_name AudioFader
extends RefCounted

static func fade_in(player: Node, target_volume_db: float, duration: float) -> void:
	player.volume_db = -80.0
	player.play()
	var tween := player.create_tween()
	tween.tween_property(player, "volume_db", target_volume_db, duration)

static func fade_out(player: Node, duration: float) -> void:
	var tween := player.create_tween()
	tween.tween_property(player, "volume_db", -80.0, duration)
	await tween.finished
	player.stop()
