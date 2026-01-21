class_name Weapon extends Sprite2D


@export var actor: Entity:
	get:
		if not actor:
			actor = get_parent()
		return actor


@export var weapon_name: String = ""
@export var weapon_sprite: Texture = null

@export_group("Stat Multipliers")
@export var damage: float = 1.0 ## Higher = stronger
@export_range(0.0, 2.0, 0.01) var attack_speed: float = 1.0 ## Less = faster
# ^^^ Should very much change how this works ^^^


func _ready() -> void:
	texture = weapon_sprite


func apply_multipliers() -> void:
	actor.damage *= damage
	actor.attack_speed *= attack_speed


func attack() -> void:
	pass
