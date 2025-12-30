class_name Player extends CharacterBody2D


enum State {
	IDLE,
	MOVING,
	JUMPED,
	ATTACKING,
	PARRYING,
}


@export_group("Speed Parameters")
@export var move_speed: float = 400.0 # Directional (x) movement speed
@export var attack_speed: float = 0.0 # Player attack speed, affected by weapon and class
@export var parry_speed: float = 0.0 # Speed at which player can parry attacks

@export_group("Strength Parameters")
@export var attack_damage: float = 0.0 # Player attack strength, affected by weapon and class
@export var parry_strength: float = 0.0 # Damage reflected after a successful parry

@export_group("Jump Parameters")
@export var jump_height: float = 500.0 # Directional (y) jump velocity
@export var max_gravity_amplifier: float = 2.0 # Player max gravity


var current_state: State = State.IDLE # Used for player processing and transition

var direction: float = 0.0 # Movement variable
var air_time: float = 5.0 # Gravity helper


func _ready() -> void:
	add_to_group("Entities")


func _physics_process(delta: float) -> void:
	_apply_gravity(delta)

	# Process states
	match current_state:
		State.IDLE: _process_idle()
		State.MOVING: _process_moving()
		State.JUMPED: _process_jumped()
		State.ATTACKING: _process_attacking()
		State.PARRYING: _process_parrying()

	direction = Input.get_axis("move_left", "move_right")

	# Transition states
	if Input.is_action_just_pressed("jump") and is_on_floor():
		current_state = State.JUMPED
	elif direction != 0.0:
		current_state = State.MOVING
	else:
		current_state = State.IDLE

	move_and_slide()


func _process_idle() -> void:
	if velocity.x != 0.0:
		velocity.x = 0.0


func _process_moving() -> void:
	velocity.x = direction * move_speed


func _process_jumped() -> void:
	velocity.y -= jump_height


func _process_attacking() -> void:
	pass


func _process_parrying() -> void:
	pass


func _apply_gravity(delta: float) -> void:
	if is_on_floor():
		air_time = 0.0
	else:
		air_time += delta * 2.5

	# Apply gravity
	velocity.y = lerp(velocity.y, get_gravity().y * min(air_time, max_gravity_amplifier), delta)
