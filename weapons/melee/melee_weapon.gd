class_name MeleeWeapon extends Weapon


var swing_strength: float = 0.0
var swing_speed: float = 0.0


func _ready() -> void:
	super()


func attack() -> void:
	_swing()


func _swing() -> void:
	pass
