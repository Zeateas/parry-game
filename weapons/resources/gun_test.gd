class_name GunTest extends WeaponInformation


const BULLET: PackedScene = preload("res://components/bullet.tscn")


func attack(source: Entity) -> void:
	var bullet: Bullet = BULLET.instantiate()

	bullet.damage = source.damage
	bullet.direction = source.weapon_dir
	bullet.fired_by = source

	bullet.global_position = source.weapon_sprite.global_position

	source.get_tree().root.get_child(0).add_child(bullet)
