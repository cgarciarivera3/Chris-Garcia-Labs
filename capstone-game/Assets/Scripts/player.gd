extends CharacterBody2D
class_name Player

@export var animation_player : AnimationPlayer
@export var speed = 10.0
@export var jump_power = 10.0
@export var dash_distance = 100.0
@export var dash_time = 0.3
var is_blinking = false
var can_blink = true
var is_dead = false
var facing = 1

var speed_mult = 30.0
var jump_mult = -30.0
var direction = 0.0

#const SPEED = 300.0
#const JUMP_VELOCITY = -400.0

func _physics_process(delta: float) -> void:
	if is_blinking:
		return
		
	if is_dead:
		return
		
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
	if is_on_floor():
		can_blink = true

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_power * jump_mult

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	direction = Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * speed * speed_mult
	else:
		velocity.x = move_toward(velocity.x, 0, speed * speed_mult)
		
	if direction != 0:
		facing = direction
	
	if get_tree().current_scene.name != "Level 1":
		if Input.is_action_just_pressed("blink") and can_blink and not is_blinking:
			blink()
	
	move_and_slide()

func get_input_direction() -> Vector2:
	var dir = Vector2.ZERO

	dir.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	dir.y = Input.get_action_strength("down") - Input.get_action_strength("up")

	return dir.normalized()
	
func blink():
	can_blink = false
	is_blinking = true
	velocity = Vector2.ZERO
	
	animation_player.play("dash", -1, 0.5)
	
	var dir = get_input_direction()

	if dir == Vector2.ZERO:
		dir = Vector2.RIGHT * facing

	var start = global_position
	var target = start + dir * dash_distance

	var space_state = get_world_2d().direct_space_state

	# move backwards until valid
	while true:
		var query = PhysicsPointQueryParameters2D.new()
		query.position = target + Vector2.UP * 4
		query.exclude = [self]

		var result = space_state.intersect_point(query)

		# found safe spot
		if result.is_empty():
			break

		# move backward slightly
		target -= dir * 4.0

		# failsafe
		if target.distance_to(start) < 4.0:
			target = start
			break

	var tween = create_tween()
	tween.tween_property(self, "global_position", target, dash_time)
	tween.finished.connect(func():
		is_blinking = false)
