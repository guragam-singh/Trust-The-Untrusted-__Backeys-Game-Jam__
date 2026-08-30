extends CharacterBody2D

const SPEED := 190.0
var dialogue_open := false
var facing := "down"

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@onready var footstep_sound: AudioStreamPlayer2D = $FootstepSound
var footstep_timer := 0.0
const FOOTSTEP_INTERVAL := 0.35

func _physics_process(_delta: float) -> void:
	if dialogue_open:
		velocity = Vector2.ZERO
		move_and_slide()
		_update_animation(Vector2.ZERO)
		return

	var dir := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = dir * SPEED
	move_and_slide()

	_update_animation(dir)
	if dir.length() > 0.1:
		footstep_timer -= _delta
		if footstep_timer <= 0.0:
			footstep_sound.play()
			footstep_timer = FOOTSTEP_INTERVAL
	else:
		footstep_timer = 0.0
		if footstep_sound.playing:
			footstep_sound.stop()

func _update_animation(dir: Vector2) -> void:
	var moving := dir.length() > 0.1

	if moving:
		if abs(dir.x) > abs(dir.y):
			facing = "right" if dir.x > 0 else "left"
		else:
			facing = "down" if dir.y > 0 else "up"

	var use_mirror := (not moving) and facing == "right"
	anim.flip_h = use_mirror

	var anim_facing = facing
	if use_mirror:
		anim_facing = "left"

	var anim_name : String= ("walk_" if moving else "idle_") + anim_facing
	if anim.animation != anim_name:
		anim.play(anim_name)
