class_name GunTest extends Weapon


const BULLET: PackedScene = preload("res://components/bullet.tscn")


func attack() -> void:
	var bullet: Bullet = BULLET.instantiate()

	bullet.damage = actor.damage
	bullet.direction = actor.weapon_dir
	bullet.fired_by = actor

	bullet.global_position = actor.global_position

	get_tree().root.get_child(0).add_child(bullet)
