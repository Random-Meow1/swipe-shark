extends CharacterBody2D

const SPEED = 150.0
const JUMP_VELOCITY = -400.0
const gravity = 1000.0

@onready var jump_sound: AudioStreamPlayer = $JumpSound
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

var direction := 0
var keyboard_dir := 0
var touch_dir := 0

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed:
			if event.position.x < get_viewport().size.x / 2:
				touch_dir = -1  # Left side of screen
			if event.position.x > get_viewport().size.x / 2:
				touch_dir = 1   # Right side of screen
		else:
			touch_dir = 0  # Stop moving when touch is released

func _physics_process(delta: float) -> void:
	# Gravity
	if not is_on_floor() and Global.power <= 0:
		velocity.y += gravity * delta

	# Power
	if Global.power > 0:
		velocity.y = -500
		collision_shape.disabled = true
	else:
		collision_shape.disabled = false

	# Jumping
	if is_on_floor() and Global.settings["auto_jump"]:
		velocity.y = JUMP_VELOCITY

	# Keyboard input
	keyboard_dir = Input.get_axis("left", "right")

	# Choose keyboard if active, else use touch
	if keyboard_dir != 0:
		direction = keyboard_dir
	else:
		direction = touch_dir

	# Movement
	if direction != 0:
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
		velocity.x = direction * SPEED
		if direction < 0:
			animated_sprite.flip_h = true
		if direction > 0:
			animated_sprite.flip_h = false
	elif Global.settings["can_stop"]:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	
	if velocity.y < 0 and Global.settings["travel_through_platforms"]:
		collision_shape.disabled = true
	elif Global.power == 0:
		collision_shape.disabled = false

	if Global.power > 0:
		Global.power -= delta

	move_and_slide()
