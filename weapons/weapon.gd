class_name Weapon extends Sprite2D


@export var actor: Entity:
	get:
		if not actor:
			actor = get_parent()
		return actor


@export var weapon_name: String = ""

@export_group("Stat Multipliers")
@export var damage: float = 0.0 ## Higher = stronger
@export_range(0.0, 1.0, 0.01) var attack_speed: float = 0.0 ## Less = faster
# ^^^ Should very much change how this works ^^^


func apply_stats() -> void:
	actor.damage *= damage
	actor.attack_speed *= attack_speed


func attack() -> void:
	pass
